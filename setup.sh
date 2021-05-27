#!/bin/bash
#codded by : th3cr00k3dm4n
#setup
#install

run_setup()
{
sleep 2 ;
ls /sdcard >/dev/null 2>&1 || termux-setup-storage && echo "[%] Settings up directory" && sleep 8 && mkdir -p /sdcard/Download/yt-downloader/{video,audio} && run_install 
}


run_install()
{
clear && echo " +++ installing dependency +++" &&
pkg install python2 python3 ffmpeg -y && pip install youtube-dl  && echo "[+] finished installation"  || echo "[*] failed to install "  && run_install
}


echo "[*] Updating "
apt update && apt upgrade
cd $HOME
run_setup && run_install && clear && echo "[✓] installation finished please run ytd.sh" || echo "something went wrong please try again ×︵×"
