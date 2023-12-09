# Shorten boot time of beepy,orangepi-2w

## Uboot

主要花时间地方

1.kernel copy，kernel 解压 1.5s？

2.ramfs copy，ramfs解压1.5s？

1.kernel 移动？ 几百ms



## Menuconfig

1. Networking support disable (-50kb , -8%)
2. Boot Options/Autoboot options/delay in... -> 0

