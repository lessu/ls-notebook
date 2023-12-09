
deb包自取(百度云)

链接: 1ZUkvykaEUISk7vAgKsJSsw

提取码: 0f10 






步骤：

1、安装debtap

yay -S debtap

//若没有yay命令请先安装yay
sudo pacman -S yay



2、deb包转换为arch包

//需要先运行下条命令，否则会报错
sudo debtap -u

//使用debtap将deb包转成arch包
//转换过程中会提示是否需要编辑相关信息，可直接回车跳过
sudo debtap -q 包名称.deb



3、pacman -U安装

//转换成功后会生成一个后缀为.pkg.tar.rst的文件
sudo pacman -U 包名称.pkg.tar.rst

