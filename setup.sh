#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo -e "[ ${red}WARNING${NC} ] OpenVZ is not Longer supported"
                sleep 5
                echo -e "[ ${red}WARNING${NC} ] THIS IS BETA TESTER ONLY "
		sleep 5
fi
# ==========================================
echo -e "[ ${red}MAIN DEV${NC} ] BIG THANKS TO FSIDVPN "
sleep 3
echo -e "[ ${red}INFORMATION${NC} ] THIS IS AUTOSCRIPT TESTING "
sleep 4
echo -e "[ ${red}WARNING${NC} ] FOR VPS IPV6 & NAT ONLY "
sleep 3
echo -e "[ ${red}WARNING${NC} ] SSH WEBSOCKET IS NOT WORKING PROPERLY "
sleep 1
echo -e "[ ${red}WARNING${NC} ] AND STILL UNDER REPAIRING FOR WORK "
sleep 5
# ==========================================
# Getting
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
fsidvpn="autosc.me/s/ssh"
# Link Hosting Kalian Untuk Xray
fsidvpnn="autosc.me/s/xray"
# Link Hosting Kalian Untuk Backup
#fsidvpnnn="autosc.me/s/backup"
# Link Hosting Kalian Untuk Websocket
fsidvpnnnn="autosc.me/s/websocket"
# Link Hosting Kalian Untuk Ohp
#fsidvpnnnnn="autosc.me/s/ohp"
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/fsidvpn;
echo "IP=" >> /var/lib/fsidvpn/ipvps.conf
wget https://${fsidvpn}/cf.sh && chmod +x cf.sh && ./cf.sh
#install v2ray
wget https://${fsidvpnn}/ins-xrayy.sh && chmod +x ins-xrayy.sh && ./ins-xrayy.sh
#install ssh ovpn
wget https://${fsidvpn}/ssh-vpnn.sh && chmod +x ssh-vpnn.sh && ./ssh-vpnn.sh
wget https://${fsidvpnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
wget https://${fsidvpnnnn}/edu.sh && chmod +x edu.sh && ./edu.sh
# Ohp Server
wget https://${fsidvpnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh

rm -f /root/ssh-vpnn.sh
rm -f /root/ins-xrayy.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -r -f domain
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/fer1dev

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${fsidvpn}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-AutoScript By Fsidvpn Project-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 8443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - Websocket TLS           : 8443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - Tr Go                   : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [ON]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Awaludin Feriyanto"  | tee -a log-install.txt
echo "   - Recode                  : Fsid Vpn" | tee -a log-install.txt
echo "   - Telegram                : https://t.me/FER1DEV"  | tee -a log-install.txt
echo "   - Instagram               : ~"  | tee -a log-install.txt
echo "   - Whatsapp                : 088228877739"  | tee -a log-install.txt
echo "   - Facebook                : https://m.facebook.com/edoy.caquarius" | tee -a log-install.txt
echo "----------------------AutoScript By FsidVPN Project----------------------" | tee -a log-install.txt
echo ""
echo " Please!! Reboot Manual !!!"
rm -f setup.sh


