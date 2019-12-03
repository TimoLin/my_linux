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

    wget https://gist.githubusercontent.com/TimoLin/47bca826b66801c3cc391b66622b7876/raw/6c5057c0076518f08ba5807ee057687bae55d9e9/config.json

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
        -e "s/@PORT4/$port4/g" -e "s/@PASS4/$pass4/g" config.json > ssr.json
    cat ssr.json
    python ~/shadowsocksr/shadowsocks/server.py -c ~/ssr.json -d start

}

deploy_v2ray(){
    # To be continued
    bash <(curl -L -s https://install.direct/go.sh)
}

main(){
    apt update
    apt install -y libsodium-dev python
    
    enable_bbr

    deploy_ssr

    #deploy_v2ray
}

echo "Deploying..."
main
echo "Done..."
