#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
#GREEN='\033[0;32m'
#ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
#CYAN='\033[0;36m'
LIGHT='\033[0;37m'
off='\x1b[m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
clear
echo start
sleep 0.5
source /var/lib/fsidvpn/ipvps.conf
domain=$(cat /etc/xray/domain)
echo -e "[ ${green}INFO${NC} ] Start " 
sleep 1
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
echo -e "[ ${green}INFO$NC ] Getting acme for cert"
wget autosc.me/acme.sh >/dev/null 2>&1
bash acme.sh --install >/dev/null 2>&1
bash acme.sh --register-account -m admin@fsidvpn.live
wget https://get.acme.sh >/dev/null 2>&1 | sh -s email=admin@fsidvpn.live
/root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
/root/.acme.sh/acme.sh --issue -d $domain --standalone --force --keylength ec-256 --server letsencrypt --listen-v6
/root/.acme.sh/acme.sh --installcert -d $domain --ecc --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
echo -e "[ ${green}INFO${NC} ] Renew cert done... "
sleep 5
rm acme.sh >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Renew cert done... "
restart
