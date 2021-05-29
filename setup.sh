#!/bin/bash
#codded by : th3cr00k3dm4n
#setup
#install

run_setup()
{
sleep 2 ;
ls /sdcard >/dev/null 2>&1 || termux-setup-storage && echo "[%] Settings up directory" && sleep 7 && mkdir -p /sdcard/Download/yt-downloader/{video,audio} && run_install 
}


run_install()
{
echo " +++| installing dependency |+++" &&
pkg install python2 ffmpeg -y && pip2 install youtube-dl  && echo "[✓] finished installation" && exit  || echo "[*] failed to install "  
}


echo "[*] Updating "
apt update && apt upgrade
cd $HOME
run_setup && run_install && clear && echo "[✓] installation finished please run ytd.sh" || echo "something went wrong please try again ×︵×"
