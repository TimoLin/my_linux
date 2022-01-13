# get sssr

random(){
    shuf -i 10000-60000 -n 1
}
enable_bbr() {
    sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
    sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
    echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf
    sysctl -p >/dev/null 2>&1
}

deploy_ssr(){
    git clone https://github.com/shadowsocksr-backup/shadowsocksr

    wget https://raw.githubusercontent.com/TimoLin/my_linux/master/ssr.json

    wget https://raw.githubusercontent.com/TimoLin/my_linux/master/startSSR.sh

    port1=`random`
    pass1=`openssl rand -hex 10`
    port2=`random`
    pass2=`openssl rand -hex 10`
    port3=`random`
    pass3=`openssl rand -hex 10`
    port4=`random`
    pass4=`openssl rand -hex 10`
    sed -e "s/@PORT1/$port1/g" -e "s/@PASS1/$pass1/g" \
        -e "s/@PORT2/$port2/g" -e "s/@PASS2/$pass2/g" \
        -e "s/@PORT3/$port3/g" -e "s/@PASS3/$pass3/g" \
        -e "s/@PORT4/$port4/g" -e "s/@PASS4/$pass4/g" ssr.json > do.json
    cat do.json
    python ~/shadowsocksr/shadowsocks/server.py -c ~/do.json -d start
}

deploy_v2ray(){
    # To be continued
    bash <(curl -L -s https://install.direct/go.sh)
}

main(){
    apt update
    apt install -qq -y libsodium-dev python
    
    enable_bbr

    deploy_ssr

    #deploy_v2ray
}

echo "Deploying..."
main
echo "Done..."
