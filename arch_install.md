# Install Guide
see https://wiki.archlinux.org/index.php/installation_guide

## link to network
### through wlan
wifi connection with iwctl

iwctl
>
device list

station wlan scan

station wlan get networks

station wlan connect SSID



# show whether connected

station wlan show


### dhcp
run 
`dhcpd`



## setup time

	timedatectl set-ntp true 

## partition
	# partition
		fdisk -l
		find your disk ,assume /dev/sda
	
		fdisk /dev/sda
		help
		> m
	
		create new gpl table
		> g
		no label	size	type
		1 	Boot 	512M 	BIOS Boot (4)
		2 	root 
		3   swap    16G     Linux Swap(19)
		save
		> w
	
	# mkfs
	mkfs.ext4 /dev/sda2
	
	mkswap /dev/sda3

## mount

	mount /dev/sda2 /mnt

## swap on
	swapon /dev/sda2

## install
	中国源
	vim /etc/pacman.d/mirrorlist
	最上面添加
	Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch
	
	安装
	pacstrap /mnt base linux linux-firmware



archlinuxcn

	 [archlinuxcn]
	SigLevel = Optional TrustAll
	Server = https://mirrors.aliyun.com/archlinuxcn/$arch

## Configure
	### fstab
		genfstab -U /mnt >> /mnt/etc/fstab
	### chroot
		arch-chroot /mnt
	### time zoon
		ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
		hwclock --syncobc
	### Localizartion
		vim 
		/etc/locale.gen
		------
		uncomment en_US.UTF-8 ...


		locale-gen
	
		/etc/locale.conf
		LANG=en_US.UTF-8
	
	### Network
		/etc/hostname
		--
		muhostname
	
		/etc/hosts
		127.0.1.1 myhostname.localdomain myhostname
	
	### Initramfs
		mkinitcpio -P
	### change passwd
		passwd

### NetworkManager

when boot from hdd,network is not start automatic.
so 

install `networkmanager`

```
systemctl enable NetworkManager.service
# systemctl start NetworkManager.service 
```

## 

## install tools

vi
vim
net-tools
dhcpcd
iwd
	The iwd package provides the client program iwctl, the daemon iwd and the Wi-Fi monitoring tool iwmon.
	Start/enable iwd.service so it can be controlled using the iwctl command.
	systemctl enable iwd

## Boot
	### GRUB
		pacman -S grub
		grub-install --target=i386-pc /dev/sda
	
		grub-mkconfig -o /boot/grub/grub.cfg

### EFI

Install tools for format efi partition`dosfstools`
```
mkfs.vfat /dev/sda1 

# mount esp
mkdir /esp
mount /dev/sda1  /esp

cd /esp
mkdir EFI
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg
```
