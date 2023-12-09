https://github.com/ohmyzsh/ohmyzsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

vi ~/.zshrc


# themes
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# like risto

```


# plugins 

https://www.zhihu.com/question/49284484/answer/2672294287


- zsh-autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
- zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- z

```
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

```

​    

- lf

    

# git slow

```
git config --add --global oh-my-zsh.hide-dirty 1
git config --add --global oh-my-zsh.hide-status 1
```



# fzf

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf


~/.fzf/install

```

## Proxy?

```
export http_proxy=http://127.0.0.1:1087;\
export https_proxy=http://127.0.0.1:1087;\
export ALL_PROXY=socks5://127.0.0.1:1080
```

