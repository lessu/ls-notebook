# Yay

## 添加以下源

```
sudo vim /etc/pacman.conf
```



```csharp
[archlinuxcn]
SigLevel = Optional TrustAll
#The Chinese Arch Linux communities packages.

#清华大学

Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
[blackarch]
SigLevel = Never

#国内镜像源

Server = https://mirrors.tuna.tsinghua.edu.cn/blackarch/$repo/os/$arch
```

```
pacman -Syy
```

## 安装yay

`sudo pacman -S yay`
*国内的源：*
`yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save`

## 最後

如果上一步添加了archlinuxcn的源：

```
sudo pacman -S archlinuxcn-keyring
```



# Chromium Video Decode

pacman -S libva-intel-driver


verify by vainfo
pacman -S libva-utils


[lessu@EPC ~]$ cat ~/.config/chromium-flags.conf 
--ignore-gpu-blocklist
--enable-gpu-rasterization
--enable-zero-copy
--disable-gpu-driver-bug-workarounds
--use-gl=desktop
--enable-accelerated-video-decode

check by chrome://gpu
chrome://media-internals
Player=Mojo means OK

# Scroll speed
imwheel



===================
#Monitor Config cannot open
https://github.com/lxqt/lxqt/wiki/ConfigLaunch#fixing-crashes-for-apps-using-dbus-daemon-common-when-using-lxqt-config-monitor


On some systems (like the default ArchLinux install), dbus-daemon is started as a systemd service before the xserver thus it has no $DISPLAY variable set in it's environment, leding to crashes. Systemd by default includes a script to fix this by fetching the variables in /etc/X11/xinit/xinitrc.d/50-systemd-user.sh. If you encounter this kind of crash add the following lines to your .xinitrc before exec startlxqt

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


=========================
# sound
pulseaudio
pulseaudio-alsa
https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#ALSA_firmware
new laptop should install additional firmware 
sof-firmware and alsa-ucm-conf
reboot

=========================
# configure menu
https://wiki.xfce.org/howto/customize-menu



# network tary 
nm-tray
networkmanager

systemctl enable NetworkManager.service
systemctl start NetworkManager.service
 1. pacman -S nm-connection-editor
 2. Edit /usr/share/nm-tray/nm-tray.conf so that connectionsEditor=nm-connection-editor
nm-tray or reboot



# pcmanfm no trash
pacman -S gvfs 
# right click scroll

# slow down track pointer

[lessu@EPC ~]$ cat /etc/X11/xorg.conf.d/50-trackpoint.conf 
Section "InputClass"
  Identifier      "GPD trackpoint"
  MatchProduct    "HAILUCK CO.,LTD USB KEYBOARD Mouse"
  MatchIsPointer  "on"
  Driver          "libinput"
  Option          "MiddleEmulation" "1"
  Option          "ScrollButton" "3"
  Option          "ScrollMethod" "button"
  Option          "TransformationMatrix" "0.15 0 0 0 0.15 0 0 0 1"
  Option          "AccelSpeed" "1"
EndSection


# ban / quan as mouse
## 1 swap ban/quan -> `
xmodmap -e "keycode  132 = grave asciitilde grave asciitilde"

## 2 act as mouse click
###left
xkbset m # enable mouse click by keyboard
xmodmap -e "keycode  49 = Pointer_Button1 "

### right click maps to cpasLK ( cannot use as scroll)
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Pointer_Button3"

#aur
use yay to install AUR source
https://github.com/Jguer/yay

  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si

# fzf
https://github.com/junegunn/fzf
