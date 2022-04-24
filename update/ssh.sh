#!/bin/bash

clear
IP=$(curl -sS ifconfig.me)
x="ok"

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
chck_pid(){
	PID=`ps -ef |grep -v grep | grep dropbear |awk '{print $2}'`
}
menu_sts(){
	if dpkg -s dropbear > /dev/null 2>&1; then
		chck_pid
		if [[ ! -z "${PID}" ]]; then
			echo -e "Current status dropbear: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"
		else
			echo -e "Current status dropbear: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"
		fi
	#	cd "${ssr_folder}"
	else
		echo -e "Current status dropbear: ${Red_font_prefix}Not Installed${Font_color_suffix}"
	fi
}

chck_sshwb(){
	PID=`ps -ef |grep -v grep | grep ws-nontls |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			echo -e "Current status ssh ws: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"
			sts="\033[0;32m◉ \033[0m"
		else
			echo -e "Current status ssh ws: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"
			sts="\033[1;31m○ \033[0m"
    fi
}
while true $x != "ok"
do

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                   ⇱ SSH MENU ⇲                   \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
menu_sts
chck_sshwb
echo -e "
[\033[0;32m01\033[0m] • Create SSH & OpenVPN Account
[\033[0;32m02\033[0m] • Extend SSH & OpenVPN Account Active Life
[\033[0;32m03\033[0m] • Delete SSH & OpenVPN Account
[\033[0;32m04\033[0m] • Check User Login SSH & OpenVPN
[\033[0;32m05\033[0m] • List of Member SSH & OpenVPN
[\033[0;32m06\033[0m] • Delete User Expired SSH & OpenVPN
[\033[0;32m07\033[0m] • Displays Users Who Do Multi Login SSH
[\033[0;32m08\033[0m] • Set AutoKill Mode
[\033[0;32m09\033[0m] • Restart SSH Websocket $sts

[00] • Kembali Ke Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   addssh
   break
   ;;
   2 | 02)
   clear
   renewssh
   break
   ;;
   3 | 03)
   clear
   delssh
   break
   ;;
   4 | 04)
   clear
   cekssh
   break
   ;;
   5 | 05)
   clear
   member
   break
   ;;
   6 | 06)
   clear
   delexp
   break
   ;;
   7 | 07)
   clear
   ceklim
   break
   ;;
   8 | 08)
   clear
   autokill
   break
   ;;
   9 | 09)
   clear
   systemctl restart ws-nontls
   systemctl restart ws-tls
   echo -e "restarting ssh websocket"
   sleep 3
   ssh
   break
   ;;
   0 | 00)
   clear
   menu
   break
   ;;
   *)
   clear
esac
done
#fim
