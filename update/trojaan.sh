#!/bin/bash
clear

x="ok"
cekray=`cat /root/log-install.txt | grep -ow "XRAYS" | sort | uniq`
if [ "$cekray" = "XRAYS" ]; then
kjj='xray'
else
kjj='v2ray'
fi
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
chck_pid(){
	PID=`ps -ef |grep -v grep | grep $kjj |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"
		else
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"
		fi
}

chgck_pid(){
	PID=`ps -ef |grep -v grep | grep trojan-go |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"
		else
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"
		fi
}

while true $x != "ok"
do

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                 ⇱ TROJAN MENU ⇲                  \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
chck_pid
echo -e "
[\033[0;32m01\033[0m] • Create Trojan-GFW Account
[\033[0;32m02\033[0m] • Deleting Trojan-GFW Account
[\033[0;32m03\033[0m] • Extending Trojan-GFW Account Active Life
[\033[0;32m04\033[0m] • Check User Login Trojan-GFW

\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
chgck_pid
echo -e "
[\033[0;32m05\033[0m] • Create Trojan-GO Account
[\033[0;32m06\033[0m] • Deleting Trojan-GO Account
[\033[0;32m07\033[0m] • Extending Trojan-GO Account Active Life
[\033[0;32m08\033[0m] • Check User Login Trojan-GO

[00] • Back to Main Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   addtrojan
   break
   ;;
   2 | 02)
   clear
   deltrojan
   break
   ;;
   3 | 03)
   clear
   renewtrojan
   break
   ;;
   4 | 04)
   clear
   cektrojan
   break
   ;;
   5 | 05)
   clear
   addtrgo
   break
   ;;
   6 | 06)
   clear
   deltrgo
   break
   ;;
   7 | 07)
   clear
   renewtrgo
   break
   ;;
   8 | 08)
   clear
   cektrgo
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
