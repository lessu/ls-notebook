# QEMU
Using qemu can run arm arch on x86.
It may be useful when chroot into an arm based image on a more powerfull x86 machine.

## Setup
setup on archlinux
installing 

- pacman -S qemu-user-static-binfmt
- yay -S qemu-user-static 

after restart systemd-binfmt 
`systemctl restart systemd-binfmt`
then check the status of it
`systemctl status systemd-binfmt`



### Debian

```
sudo apt install qemu-user-binfmt
sudo apt install qemu-system
sudo apt install qemu-user-static
update-binfmts --display


```

# Chroot



```

sudo cp /usr/bin/qemu-aarch64-static  /media/sdcard/bin

sudo chroot /media/sdcard qemu-aarch64-static /bin/bash
```

