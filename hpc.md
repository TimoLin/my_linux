HPC Configuration
=================
## CentOS Local YUM Mirror
1. Fetch the latest Centos DVD
```
Centos-7-X86_64-Everything-2009.iso
```
2. Create folder under `/mnt`
```sh
cd /mnt
mkdir iso yum
# Copy/Move Centos-7-X86_64-Everything-2009.iso to `iso` folder
```

3. Auto mount the ISO
Edit `/etc/fstab`. Add the following line to the end:
```config
/mn/iso/Centos-7-X86_64-Everything-2009.iso /mnt/yum iso9660 loop,defaults 0 0
```
Mount the mirror:
```
mount /mnt/yum
```
4. Modify source list files
Move all files in `/etc/yum.repo.d` to backup
```sh
cd /etc/yum.repo.d
mkdir backup
mv CentOS* backup
cp backup/CentOS-Media.repo ./
```
Change the content in `CentOS-Media.repo` to the following:
```config
[c7-media]
name=CentOS-$releasever - Media
baseurl=file:///mnt/yum
gpgcheck=0
enabled=1
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```
Update cache:
```sh
yum makecache
```
## TigerVNC
1. Install vnc
```sh
sudo yum install tigervnc tigervnc-server
```
2. Under `root` user, do the followings:
```sh
sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
# Use editor to change the <USER> to nuaa in file `vncserver@:1.service`
sudo systemctl daemon-reload
sudo systemctl enable vncserver@:1.service
sudo firewall-cmd --state
sudo firewall-cmd --permanent --zone=public --add-port=5901-5905/tcp
sudo firewall-cmd --reload
``` 
3. Start Tiger VNC under user `nuaa` and set the password:
```
vncserver
```
4. Settings in `VNC Viewer`:
```
VNC Server: 192.168.1.31:1
Name : Bay31
```
## Software installation
### 1. Ansys Fluent
1.1. Prerequisites
```
yum install glibc.i686 glib2.i686 bzip2-lib-s.i686 libpng.i686 libtiff.i686 libXft.i686 libXxf86vm.i686 sssd-client.i686 libpng12 libpng12.i686 libXp libXp.i686 libXp openmotif zlib openmpi
```
1.2 Install Ansys without License server
1.3 Copy `Cr**k` files to the installation directory
1.4 Test if `Fluent` works properly.
### 2. Matlab
### 3. OpenFOAM
3.1 Prerequisites
```
yum groupinstall 'Development Tools' 
yum install openmpi openmpi-devel zlib-devel gstreamer-plugins-base-devel \
libXext-devel libGLU-devel libXt-devel libXrender-devel libXinerama-devel libpng-devel \
libXrandr-devel libXi-devel libXft-devel libjpeg-turbo-devel libXcursor-devel \
readline-devel ncurses-devel python python-devel cmake qt-devel qt-assistant \
mpfr-devel gmp-devel

```
