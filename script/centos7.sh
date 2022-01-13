# CentOS-Openfoam
yum groupinstall 'Development Tolls' --setopt=group_package_types=mandatory,default,optional

yum install -y environment-modules

yum install openmpi openmpi-devel zlib-devel gstreamer-plugins-base-devel \
libXext-devel libGLU-devel libXt-devel libXrender-devel libXinerama-devel libpng -devel \
libXrandr-devel libXi-devel libXft-devel libjpeg-turbo-devel libXcursor-devel \
readline-devel ncurses-devel python python-devel cmake qt-devel qt-assistant \
mpfr-devel gmp-devel


