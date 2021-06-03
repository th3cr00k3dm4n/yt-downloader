#!/bin/bash
#codded by : th3cr00k3dm4n
#setup
#install

run_setup()
{
sleep 2 ;
ls $EXTERNAL_STORAGE/ >/dev/null 2>&1 || echo "[%] Settings up" && termux-setup-storage && sleep 7 && run_install 
}


run_install()
{
echo " +++| installing dependency |+++" &&
pkg install python2 ffmpeg -y && pip2 install youtube-dl  && echo "[✓] finished installation"; echo "[✓] installation finished please run ytd.sh" && exit  || echo "[*] failed to install "  
}

clear
echo "[*] Updating "
apt update && apt upgrade
cd $HOME
run_setup && run_install  || echo "something went wrong please try again ×︵×"
