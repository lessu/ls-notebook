# TProxy

直接使用

openwrt V2ray

```
cp /root/v2ray.main.json /var/etc/v2ray/

killall v2ray

nohup v2ray --config=/var/etc/v2ray/v2ray.main.json  &

```




sysctl net.bridge.bridge-nf-call-iptables=0


# Iptables
规则中的 return
1. 从一个CHAIN里可以jump到另一个CHAIN, jump到的那个CHAIN是子CHAIN. 
2. 从子CHAIN return后，回到触发jump的那条规则，从那条规则的下一条继续匹配. 
3. 如果return不是在子CHAIN里，而是在main CHAIN，那么就以默认规则进行.

https://v2raya.org/docs/advanced-application/tproxy-docker-support/