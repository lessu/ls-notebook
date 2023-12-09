#!/bin/bash

usage(){
    echo "Usage: $0 -v6 -k<api_key> -e<email> <full_domain>"
    echo "    example $0 -v6 a.example.com"
}

# Parse options using getopt
options=$(getopt -o k:e:v: -- "$@")

eval set -- "$options"

ipv="4"
while true; do
    case "$1" in
        -k)
            shift
            API_KEY=$1
            ;;
        -e)
            shift
            ACCOUNT_EMAIL=$1
            ;;
        -v)
            shift
            ipv="$1"
            ;;
        --)
            shift # end of options reached, break the loop
            break;
            ;;
        *)
            usage
            ;;
    esac

    shift # move to next option or argument value

done

if [ $ipv != "6" ];then
    echo "Only ipv6 is supported"
    exit 255
fi

if [ -z $API_KEY ];then
    echo "API_KEY(-k) arg is not given"
    exit 255
fi

if [ -z $ACCOUNT_EMAIL ];then
    echo "email(-e) arg is not given"
    exit 255
fi

# Check if domain arg is provided and exists
if [ $# -eq 0 ]; then
    echo "Missing file argument" 1>&2
    usage
fi

DOMAIN=$1

# Get your external IP address for ipv6 from ipify.org
IPV6=`ip -6 addr show scope global | awk '/inet/{sub(/\/[0-9]+/,"",$2); print $2}'| head -n1`
echo "ip now="$IPV6

ZONE_ID=$( curl -s -X GET "https://api.cloudflare.com/client/v4/zones" \
    -H "X-Auth-Email: $ACCOUNT_EMAIL" \
    -H "X-Auth-Key: $API_KEY" \
    -H "Content-Type: application/json" | jq -r ".result[0].id")
echo $ZONE_ID

if [ "$ZONE_ID" == "null" -o -z "$ZONE_ID" ];then
    echo "Account auth Failed"
    exit 255
fi

# Get the current record content for ipv6 from Cloudflare API
CURRENT_IPV6_RECORD=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?name=$DOMAIN" \
     -H "X-Auth-Email: $ACCOUNT_EMAIL" \
     -H "X-Auth-Key: $API_KEY" \
     -H "Content-Type:application/json" | jq -r '{"result"}')

RECORD_LEN=$( echo $CURRENT_IPV6_RECORD | jq -r '.result | length' )
echo "record len="$RECORD_LEN

if [ $RECORD_LEN -gt 1 ];then
    echo "Record length >1,Abort"
    exit 255
fi

RECORD_DOMAIN_ID=$( echo $CURRENT_IPV6_RECORD | jq -r '.result[0] .id' )
echo "id in cloudflare="$RECORD_DOMAIN_ID

CURRENT_IPV6=$( echo $CURRENT_IPV6_RECORD | jq -r '.result[0] .content' )
echo "ip in cloudflare="$CURRENT_IPV6


if [ "$IPV6" == "$CURRENT_IPV6" ];then
    echo "Ipv6 address has not changed."
    exit 0
else
    echo "IPv6 address has changed. Updating the record."
    RESULT=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_DOMAIN_ID" \
         -H "X-Auth-Email: $ACCOUNT_EMAIL" \
         -H "X-Auth-Key: $API_KEY" \
         -H "Content-Type:application/json" \
         --data '{"type":"AAAA","name":"'"$DOMAIN"'","content":"'"$IPV6"'","ttl":1,"proxied":false}' | jq -r ".success")
    if [ "$RESULT" == "true" ];then
        echo "Update successfully"
        exit 0
    else
        echo "Update failed"
        exit 200
    fi
fi
