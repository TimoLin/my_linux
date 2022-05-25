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

