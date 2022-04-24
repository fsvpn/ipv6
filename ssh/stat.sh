#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

clear

x="ok"

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"

chck_pid(){

	PID=`ps -ef |grep -v grep | grep accel-ppp |awk '{print $2}'`	if [[ ! -z "${PID}" ]]; then

			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"

		else

			echo -e "Current status: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"

		fi

}

while true $x != "ok"

do

 echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

 echo -e "\E[44;1;39 m                    ⇱ BANWIDTH MENU ⇲                        \E[0m"

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "

[\033[0;32m01\033[0m] • Lihat Total Bandwith Tersisa

[\033[0;32m02\033[0m] • Tabel Penggunaan Setiap 5 Menit

[\033[0;32m03\033[0m] • Tabel Penggunaan Setiap Jam

[\033[0;32m04\033[0m] • Tabel Penggunaan Setiap Hari

[\033[0;32m05\033[0m] • Tabel Penggunaan Setiap Bulan

[\033[0;32m06\033[0m] • Tabel Penggunaan Setiap Tahun

[\033[0;32m07\033[0m] • Tabel Penggunaan Tertinggi

[\033[0;32m08\033[0m] • Statistik Penggunaan Setiap Jam

[\033[0;32m09\033[0m] • Lihat Penggunaan Aktif Saat Ini

[\033[0;32m10\033[0m] • Lihat Trafik Penggunaan Aktif Saat Ini [5s]

[00] • Back to Main Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"

echo ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo ""

echo -ne "Select menu : "; read x

case "$x" in 

   1 | 01)

   clear

echo -e "\033[0;34m⇱ TOTAL BANDWITH SERVER TERSISA"

echo -e ""

vnstat

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   2 | 02)

   clear

echo -e "\033[0;34m⇱ PENGGUNAAN BANDWITH SETIAP 5 MENIT ⇲ \033[0m"

echo -e ""

vnstat -5

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   3 | 03)

   clear

echo -e "\033[0;34m⇱ PENGGUNAAN BANDWITH SETIAP JAM"

echo -e ""

vnstat -h

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   4 | 04)

   clear

echo -e "\033[0;34m⇱ PENGGUNAAN BANDWITH SETIAP HARI ⇲ \033[0m"

echo -e ""

vnstat -d

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   5 | 05)

   clear

echo -e "\033[0;34m⇱ PENGGUNAAN BANDWITH SETIAP BULAN ⇲ \033[0m"

echo -e ""

vnstat -m

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   6 | 06)

   clear

echo -e "\033[0;34m⇱ PENGGUNAAN BANDWITH SETIAP TAHUN ⇲ \033[0m"

echo -e ""

vnstat -y

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   7 | 07)

   clear

echo -e "\033[0;34m⇱ PENGGUNAAN BANDWITH TERTINGGI ⇲ \033[0m"

echo -e ""

vnstat -t

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   8 | 08)

   clear

echo -e "\033[0;34m⇱ GRAFIK BANDWITH TERPAKAI SETIAP JA m⇲ \033[0m"

echo -e ""

vnstat -hg

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   9 | 09)

   clear

echo -e "\033[0;34m⇱ LIVE PENGGUNAAN BANDWITH SAAT INI ⇲ \033[0m"

echo -e " ${white}CTRL+C Untuk Keluar!${off}"

echo -e ""

vnstat -l

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   10 | 10)

   clear

echo -e "\033[0;34m⇱ LIVE TRAFIK PENGGUNAAN BANDWITH ⇲ \033[0m"

echo -e ""

vnstat -tr

echo -e ""

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$baris2"

   break

   ;;

   0 | 00)

   clear

   menu-tools

   break

   ;;

   *)

   clear

esac

done

#fim
