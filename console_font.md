# Console

https://wiki.archlinux.org/title/Linux_console

## Rotate 

```
echo 1 >> /sys/class/graphics/fbcon/rotate
```



In `/etc/default/grub` add `fbcon=rotate:1` to the `GRUB_CMDLINE_LINUX` line:

```
GRUB_CMDLINE_LINUX="fbcon=rotate:1"
```

dont' forget re-generate grub
```
grub-mkconfig -o /boot/grub/grub.cfg
```



## Larger Font



Terminus font ([terminus-font](https://archlinux.org/packages/?name=terminus-font)) is available in many sizes, such as `ter-i32n` which is large.



```
setfont i32b
```

all font lay under `/usr/share/kbd/consolefonts/`

presistent

```
/etc/vconsole.conf
...
FONT=iter-i32b
```

or

set to cmd `fbcon=font:TER16x32`

TER16x32 is compiled into console

if multipy fbcon needs tobe set ,set as below

```
fbcon=A:1 fbcon=B:2
```

