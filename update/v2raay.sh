#!/bin/bash
clear


x="ok"
cekray=`cat /root/log-install.txt | grep -ow "XRAYS" | sort | uniq`
if [ "$cekray" = "XRAYS" ]; then
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                  ⇱ XRAY MENU ⇲                   \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

rekk='XRAYS'
kjj='xray'
else
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                  ⇱ V2RAY MENU ⇲                  \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

rekk='V2RAY'
kjj='v2ray'
fi
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
chck_pid(){
	PID=`ps -ef |grep -v grep | grep $kjj |awk '{print $2}'`
}
menu_sts(){
	if [[ -e /usr/bin/$kjj ]]; then
		chck_pid
		if [[ ! -z "${PID}" ]]; then
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"
		else
			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"
		fi
	#	cd "${ssr_folder}"
	else
		echo -e "Current status: ${Red_font_prefix}Not Installed${Font_color_suffix}"
	fi
}

while true $x != "ok"
do
cek=/home/shws
if [[ -f "$cek" ]]; then
sts="\033[1;32m◉ \033[0m"
else
sts="\033[1;31m○ \033[0m"
fi

menu_sts
echo -e "
[\033[0;32m01\033[0m] • Create $rekk Vmess Websocket Account
[\033[0;32m02\033[0m] • Deleting $rekk Vmess Websocket Account
[\033[0;32m03\033[0m] • Extending $rekk Vmess Account Active Life
[\033[0;32m04\033[0m] • Check User Login $rekk

\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m

[\033[0;32m05\033[0m] • Create $rekk Vless Websocket Account
[\033[0;32m06\033[0m] • Deleting $rekk Vless Websocket Account
[\033[0;32m07\033[0m] • Extending $rekk Vless Account Active Life
[\033[0;32m08\033[0m] • Check User Login $rekk

\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m

[00] • Back to Main Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   addvmess
   break
   ;;
   2 | 02)
   clear
   delvmess
   break
   ;;
   3 | 03)
   clear
   renewvmess
   break
   ;;
   4 | 04)
   clear
   cekvmess
   break
   ;;
   5 | 05)
   clear
   addvless
   break
   ;;
   6 | 06)
   clear
   delvless
   break
   ;;
   7 | 07)
   clear
   renewvless
   break
   ;;
   8 | 08)
   clear
   cekvless
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
