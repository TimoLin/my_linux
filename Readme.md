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
#### 3.3.1 VIM-Plug
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Copy .vimrc to $HOME
```
#### 3.3.2 coc.nvim
(1) Update vim to 8.2
```sh
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
(2) Install Prerequisites
```sh
# C/C++ lsp 
sudo snap install ccls
sudo apt install bear 
# Fortran lsp
pip3 install fortran-language-server 
# VIM coc-plugins
# :CocInstall coc-pyright
```
(3) C/C++ generate `compile_commands.json`
1. For projects using `cmake` like `FlameMaster`
    ```sh
    # Recompile with `-DCMAKE_EXPORT_COMPILE_COMMANDS=1 option`
    cmake ../Repository -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1
    cmake --build . --parallel --target install --config Release
    cp compile_commands.json ../Repository/
    ```
2. For projects using `make` like `OpenFOAM`

   See [this tutorial](https://openfoamwiki.net/index.php/HowTo_Use_OpenFOAM_with_Visual_Studio_Code).

   Modify OpenFOAM-2.3.1/wmake/wmake:
   ```diff
    +#------------------------------------------------------------------------------
    +# check if bear is installed and we are not already running under bear
    +#------------------------------------------------------------------------------
    +
    +if [ -z "${RUNNING_UNDER_BEAR}" ] ; then
    +    if ! bear --version > /dev/null ; then
    +        echo "WARNING: bear is not installed -> There will be no compile_commands.json output." 1>&2
    +    elif printf '%s\n%s\n' "bear 3.0.0" "$(bear --version)" | sort -V -C ; then
    +        #bear version >= 3.0.0
    +        export RUNNING_UNDER_BEAR=true
    +        mkdir -p $FOAM_LIBBIN
    +        bear --append --output $FOAM_LIBBIN/../compile_commands.json -- wmake $@
    +        exit $?
    +    elif printf '%s\n%s\n' "bear 2.0.0" "$(bear --version)" | sort -V -C ; then
    +        #bear version >= 2.0.0
    +        export RUNNING_UNDER_BEAR=true
    +        mkdir -p $FOAM_LIBBIN
    +        bear --append -o $FOAM_LIBBIN/../compile_commands.json wmake $@
    +        exit $?
    +    else
    +        echo "WARNING: bear version is below 2.0.0 -> There will be no compile_commands.json output." 1>&2
    +    fi
    +fi
    
    ```

   Add script [`vscode-settings`](https://develop.openfoam.com/Development/openfoam/-/blob/a50047bbcc9ee270ebddd6e95ea7d0e01f2a525f/bin/tools/vscode-settings) to OpenFOAM-2.3.1/bin/tools.

   Generate VSCode setting files:
   ```sh
   cd $WM_PROJECT_DIR
   mkdir .vscode
   ./bin/tools/vscode-setting > .vscode/settings.json
   # Clean OpenFOAM installation
   wclean all
   # Re-build
   ./Allwmake
   ```
   Create softlink for `VIM`/`coc.nvim`:
   ```sh
   cd $WM_PROJECT_DIR
   ln -s ~/OpenFOAM/OpenFOAM-2.3.1/platforms/linux64GccDPOpt/compile_commands.json ./compile_commands.json
   ```
(4) Appendix:
1. `coc-settings.json` under `~/.vim`:
    ```json
    {
        "languageserver": {
            "ccls": {
                "command": "ccls",
                "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"],
                "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".root"],
                "initializationOptions": {
                    "cache": {
                        "directory": ".cache/ccls"
                    },
                    "highlight": {"lsRanges": true }
                }
            },
            "fortran": {
                "command": "fortls",
                "filetypes": ["fortran"],
                "rootPatterns": [".fortls", ".git/"]
            }
    }
    ```
  
### 3.4 Remote Desktop (Zerotier+VNC)
#### 3.4.1 Zerotier
Follow these steps or [this tutorial](https://zhuanlan.zhihu.com/p/422171986)
- Create an account at [Zerotier](https://www.zerotier.com/)
- Create A Network and copy the Network ID
- Install [Zerotier clients](https://www.zerotier.com/download) on your computers. Here I've a Linux workstation running Ubuntu 18.04 and a laptop running Windows 10
    - For Linux: 
      ```
      sudo zerotier-cli join YOUR_NETWORK_ID
      ```
    - For Windows:
      Right click the zerotier tray icon and Join Network.
- Autorize these two devices in the zerotier web-ui. You can see the virtual IP address of each device.

#### 3.4.2 Install vnc-server on Ubuntu 18.04
- 1. Install packages
    ```
    # Packages
    sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer
    ```
- 2. Set the vnc password
    ```
    tigervncpasswd
    ```
- 3. Set-up vnc desktop environment  
    Create `~/.vnc/xstartup` and paste the following content to it. (I have gnome desktop installed.)
    ```
    #!/bin/sh
    # Start Gnome 3 Desktop 
    [ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
    [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
    vncconfig -iconic &
    dbus-launch --exit-with-session gnome-session &
    ```
- 4. Start vnc-server and listening from anywhere
    ```
    tigervncserver -localhost no
    ```
- 5. Check the vnc server port
    ```
    tigervncserver -list
    ```
    Output:
    ```
    TigerVNC server sessions:
    
    X DISPLAY #	PROCESS ID
    :1		9332
    ```
    For example, `:1` is the port which is used to connect to the server in the viewer's side.

#### 3.4.3 Install vnc-viewer at Windows 10  
- Download and install [Real VNC](https://www.realvnc.com/en/connect/download/viewer/)  
- Click `File`->`New connection` and input the IP address of Ubuntu at Zerotier network. 
  For example: `192.168.29.110:1`. `:1` stands for the port of the vnc server.

