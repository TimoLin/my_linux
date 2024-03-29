# CentOS Environment deployment

# Run under Root user
if (( $EUID == 0 )); then
    # 1. Change Software source and update
    ## Base repo
    sed -e 's|^mirrorlist=|#mirrorlist=|g' \
        -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
        -i.bak \
        /etc/yum.repos.d/CentOS-Base.repo
    yum makecache
    ## EPEL repo
    yum install -y epel-release
    sed -e 's|^metalink=|#metalink=|g' \
             -e 's|^#baseurl=https\?://download.fedoraproject.org/pub/epel/|baseurl=https://mirrors.ustc.edu.cn/epel/|g' \
             -e 's|^#baseurl=https\?://download.example/pub/epel/|baseurl=https://mirrors.ustc.edu.cn/epel/|g' \
             -i.bak \
             /etc/yum.repos.d/epel.repo
    yum makecache
    
    ## Update system
    yum -y update
    
    # 2. VNC server
    # Install VNC server and ntfs support
    yum install -y ntfs-3g tigervnc tigervnc-server
    
    ## Configuration of VNC server
    wget https://ghproxy.com/https://raw.githubusercontent.com/TimoLin/my_linux/master/script/vnc.service
    sed -i "s/USERNAME/$USER/" vnc.service
    mv ./vnc.service /etc/systemd/system/vncserver@\:1.service
    systemctl daemon-reload
    systemctl enable vncserver@:1.service
    
    ## Set firewall for vnc port
    firewall-cmd --permanent --zone=public --add-port=5901-5905/tcp
    firewall-cmd --reload

    # OpenFoam enviroment
    #yum groupinstall 'Development Tools' --setopt=group_package_types=mandatory,default,optional
    #yum install -y environment-modules
    #yum install -y openmpi openmpi-devel zlib-devel gstreamer-plugins-base-devel \
    #libXext-devel libGLU-devel libXt-devel libXrender-devel libXinerama-devel libpng-devel \
    #libXrandr-devel libXi-devel libXft-devel libjpeg-turbo-devel libXcursor-devel \
    #readline-devel ncurses-devel python python-devel cmake qt-devel qt-assistant \
    #mpfr-devel gmp-devel
fi

# Run under Normal user
if (( $EUID != 0 )); then
    # 3. Fetch bashrc
    cd $HOME
    # get bashrc
    wget -O .bashrc https://ghproxy.com/https://raw.githubusercontent.com/TimoLin/my_linux/master/script/bashrc
fi

# Tips for Ansys 22R1 licensing problem
# copy crack file to installation folder
# Then run the following command
#chown $USER -R /usr/ansys_inc/shared_files
