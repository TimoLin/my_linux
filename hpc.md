HPC Configuration
=================
# HPC in local LAN network
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
# HPC with internet connection
## Deploy environment on CentOS
Under $HOME path, download deploy script:
```sh
wget -O centos7.sh https://raw.githubusercontent.com/TimoLin/my_linux/master/script/centos7.sh
```
Firstly, as normal user, fetch the bashrc template
```sh
./centos7.sh
```
## Sencondly, as root user, install prerequisites packages:
```sh
./centos7.sh
```

# Ganglia Environment 
[Reference](http://www.sunrisenan.com/docs/zabbix/zabbix-1b0fllosvls6a)
List of nodes:
```
192.168.1.13 bay3
192.168.1.14 bay4
...
192.168.1.26 bay16
```
Bay4 is set as the ganglia server.
## 1. Install prerequisites
Enable epel on each nodes.
### 1.1 Server side
```sh
yum -y install ganglia-gmetad.x86_64 ganglia-gmond.x86_64
```
Here we use LNMP as server enviroment. Goto [oneinstack](https://oneinstack.com/auto/) to generate the installation script. (Nginx, PHP-7.2d(without php-cache), DB-5.7)
Run the install command using root under $HOME path, for example:
```sh
wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --nginx_option 1 --php_option 7 --phpmyadmin  --db_option 2 --dbinstallmethod 1 --dbrootpwd oneinstack --pureftpd  --redis  --memcached 
```

### 1.2 Client side
```sh
yum -y install ganglia-gmond.x86_64
```
## 2. Configure the server and client
### 2.1 Server side
Modify the following items in `/etc/ganglia/gmetad.conf`:
```config
data_source "Cluster"  bay3 bay4
gridname "HPE-Grid"
xml_port 8651
interactive_port 8652
rrd_rootdir "/var/lib/ganglia/rrds"
```
Make sure the `rrd_rootdir` has right owner:
```ssh
chown -R ganglia:ganglia /var/lib/ganglia/rrds
```

### 2.2 Client side
Modify the following items in `/etc/ganglia/gmond.conf`:
```Config
globals {
        daemonize = yes  #是否后台运行，这里表示以后台的方式运行
        setuid = yes        #是否设置运行用户，在Windows中需要设置为false
        user = nobody    #设置运行的用户名称，必须是操作系统已经存在的用户，默认是nobody
        debug_level = 0   #调试级别，默认是0，表示不输出任何日志，数字越大表示输出的日志越多
        max_udp_msg_len = 1472
        mute = no     #是否发送监控数据到其他节点，设置为no表示本节点将不再广播任何自己收集到的数据到网络上
        deaf = no     #是否接受其他节点发送过来的监控数据，设置为no表示本节点将不再接收任何其他节点广播的数据包
        allow_extra_data = yes#是否发送扩展数据
        host_dmax = 0 /*secs */#是否删除一个节点，0代表永远不删除，0之外的整数代表节点的不响应时间，超过这个时间后，Ganglia就会刷新集群节点信息进而删除此节点
        cleanup_threshold = 300 /*secs */  #gmond清理过期数据的时间
        gexec = no             #是否使用gexec来告知主机是否可用，这里不启用
        send_metadata_interval = 60  #主要用在在单播环境中，如果设置为0，那么如果某个节点的gmond重启后，gmond汇聚节点将不再接受这个节点的数据，将此值设置大于0，可以保证在gmond节点关闭或重启后，在设定的时间内，gmond汇聚节点可以重新接收此节点发送过来的信息。单位秒
}
cluster {
    name = "Cluster"     #集群的名称，是区分此节点属于某个集群的标志，必须和监控服务端data_source中的某一项名称匹配
        owner = "zt"     #节点的拥有者，也就是节点的管理员
        latlong = "unspecified"   #节点的坐标，经度、纬度等，一般无需指定
url = "unspecified"     #节点的URL地址，一般无需指定
}
```
### 2.3 Web server
Download `ganglia-web-3.7.2` from [link](http://sourceforge.net/projects/ganglia/files/) and put it to `/var/www/html/ganglia-web`.  
Modify following items in `/var/www/html/ganglia-web/conf_defaut.php`:
```config
$conf['gweb_confdir'] = "/var/www/html/ganglia-web";  #ganglia web的根目录
$conf['gmetad_root'] = "/var/lib/ganglia";  # ganglia程序安装目录
$conf['rrds'] = "${conf['gmetad_root']}/rrds";      #ganglia web读取rrd数据库的路径
$conf['dwoo_compiled_dir'] = "${conf['gweb_confdir']}/dwoo/compiled";   #需要“777”权限
$conf['dwoo_cache_dir'] = "${conf['gweb_confdir']}/dwoo/cache"; #需要“777”权限
$conf['rrdtool'] = "env TZ='Asia/Shanghai' /usr/bin/rrdtool";  #指定rrdtool的路径
$conf['graphdir']= $conf['gweb_root'] . '/graph.d'; #生成图形模板目录
$conf['ganglia_ip'] = "192.168.1.14";      #gmetad服务所在服务器的地址
$conf['ganglia_port'] = 8652;       #gmetad服务器的交互式提供监控数据端口发布
```
Create the following two folders:
```sh
mkdir -p /var/www/html/ganglia-web/dwoo/compiled
mkdir -p /var/www/html/ganglia-web/dwoo/cache
chmod 777 /var/www/html/ganglia-web/dwoo/compiled
chmod 777 /var/www/html/ganglia-web/dwoo/cache
```
### 2.4 Start services
At server side:
```sh
systemctl start gmetad
systemctl start gmond
```
At each client side:
```sh
systemctl start gmond
```
## 3. Check
Use browser to open `http://192.168.1.14/ganglia` and you'll see the monitoring inforamtions.
