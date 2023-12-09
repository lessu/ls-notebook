web 路径

/usr/share/kvmd/web/



# 升级

```
pacman -Syu
pacman -S openssl-1.1
pacman -S kvmd-platform-v3-hdmi-rpi4

```

# 扩容

```bash
```

## 添加 18433->433 端口

```
vim /etc/kvmd/nginx/listen-https.conf

-----------------------
listen 443 ssl http2;
listen [::]:443 ssl http2;

listen 18443 ssl http2;
listen [::]:18443 ssl http2;
-----------------------

systemctl restart kvmd-nginx.service
```



## DDNS(cloudflare)

```bash
./cloudflare.sh -v6 -e lessu@163.com -k 98a2420fe47eee673d16b63404504a6d8caee pikvm.nutsapp.com
```



