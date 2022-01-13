My Linux Workstation
====================
## 1. 换源 & 更新
```sh
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt dist-upgrade
```
## 2. 安装所需软件
```sh
sudo apt install zsh autojump 
sudo apt install vim ctags
sudo apt install build-essential
sudo apt install proxychains
```
## 3. 配置
### 3.1 Zsh: [oh-my-zsh](https://ohmyz.sh/#install)
```sh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Copy .zshrc to $HOME
```
### 3.2 代理: proxychains
修改`/etc/proxychains.conf`末尾行：
```sh
socks4 127.0.0.1 9095
```
为
```sh
# V2ray
socks5 127.0.0.1 10808
```
### 3.3 VIM
VIM-Plug
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Copy .vimrc to $HOME
```

