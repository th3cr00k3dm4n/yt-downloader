#!/bin/bash
#setup
#install

run_setup()
{
 sleep 2 ;
 cd $HOME 
 echo "+++ Settings up directory +++" && mkdir /sdcard/Download/yt-downloader && mkdir /sdcard/Download/yt-downloader/video && mkdir /sdcard/Download/yt-downloader/audio || run_install 
 }
 run_install()
 {
clear && echo " +++ installing dependency +++" && sleep 2
 apt update && apt upgrade && pkg install ffmpeg -y && pkg install python3 -y && pkg install python2 -y && pip3 install youtube-dl || run_install
  }
cd $HOME
ls /sdcard || termux-setup-storage && sleep 3 && run_setup && run_install && clear && cd $HOME/yt-downloader && ./ytd.sh || echo "something went wrong please try again ×︵×"
