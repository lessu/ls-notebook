# LXQT
## install
pacman -S lxqt breeze breeze-icons xorg-xinit xorg adwaita-icon-theme breeze-gtk

optional
xf86-video-intel

yay -S adobe-source-han-sans-cn-fonts

~/.xinitrc
------------
```
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec startlxqt
```

##  start
startx



## application 
chromium
visual-studio-code-bin
featherpad
kcalc
meld
mpv
wps

## tweak
1.move systembar to top

2.change icons theme (Breeze Dark, uncheck 'Colorize icon based on widget style')
	or ePapirus(pacman -S papirus-icon-theme)
3.Font
	Source Han Sans CN(pacman -S adobe-sourcer-han-sans-cn-fonts)

4.Openbox Theme
	Adwaid
	1.Download
	2.copy paste in /usr/share/themes
	Search for Theme

	https://www.pling.com/browse/cat/140/page/2/ord/latest/
	
	or
	# updated @ 2022/12/17
	pling.com/p/1382200


# launcher 
albert





# New Resolution

https://en.wikibooks.org/wiki/Guide_to_X11/Define_new_resolution

```
cvt -v 1280 720
# 1280x720 59.86 Hz (CVT 0.92M9) hsync: 44.77 kHz; pclk: 74.50 MHz
Modeline "1280x720_60.00"   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync



xrandr --newmode "1280x720_60.00"   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync


xrandr --addmode "eDP-1" 1280x720_60.00
```

