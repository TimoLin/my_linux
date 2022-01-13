#!/bin/sh
cd /root/MTProxy/objs/bin
./mtproto-proxy -u nobody -p 8888 -H 5432 -S a2a0bb68ac98c5139d687514fd53a4f1 --aes-pwd proxy-secret proxy-multi.conf -M 1 &
