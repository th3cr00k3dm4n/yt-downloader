#!/bin/bash
#title           :yt-downloder.sh
#description     :download videos from youtube
#author          :th3cr00k3dm4n
#date            :25-5-2021
#version         :0.1
#notes           :don't copy script without giving credit


run_menu()
{
    banner
    echo   "╠═[Select an option]"
    echo   "╠═[ 1. Download as video"
    echo   "╠═[ 2. Download as audio"
    echo   "╠═[ 3. About"
    echo   "╠═[ 4. Exit"
    read -p "╚══[ " n
    case $n in
      1) clear && run_video ;;
      2) clear && run_audio ;;
      3) clear
         banner
         echo "Yt-downloader"
         echo ""
         echo "Yt-downloader is a simple shell to download youtube videos using YOUTUBE-DL "
         echo "Codded by : th3cr00kedm4n"
         echo "visit https://bit.ly/th3cr00k3dm4n for more"
         echo "thanks for your support and don't forget to give a star on github"
         echo "GitHub : https://github.com/th3cr00k3dm4n" && run_menu ;;
      4) echo "thanks for using this tool"
         echo "for more visit bit.ly/th3cr00k3dm4n"
         echo "exiting ...." ;;
      *) echo "invalid option" ;;
    esac
}

run_video()
{
    clear
    banner
    read -p "╚══[ Enter url : " url
    youtube-dl -F $url | awk '{print $1" | " $2 " | " $3}'
    echo ""
    echo "Select a format by choosing the fomat code "
    echo " *format code is the first set of numbers"
    read -p "Enter the number : " frmt
    youtube-dl -f $frmt  -o "/sdcard/Download/yt-downloader/video/%(title)s.%(ext)s"  $url && clear && echo "+++ Download complete +++ " && echo "file stored in download folder " && run_menu || echo " ×︵× failed to download "  && run_menu
}

run_audio()
{
    clear
    banner
    read -p "╚══[ Enter url : " url
    youtube-dl   -o "/sdcard/Download/yt-downloader/audio/%(title)s.%(ext)s" --extract-audio --audio-format mp3 $url && clear && echo "+++ Download complete +++ " && echo "file stored in download folder " && run_menu || echo " ×︵× failed to download " && run_menu
}

banner()
{
    echo "╔═══════════════╗"
    echo "•   YT-Downloader ↓↓"
    echo "╠═══════════════╝"
    echo "╠══[version 0.1]"
    echo "╠══[coded by th3cr00k3dm4n]"
    echo "╠══[https://github.com/th3cr00k3dm4n]"
    echo "║"
    echo "║"
    echo "║"
}
run_check()
{
dpkg -s python2  >/dev/null 2>&1 && pip2 show youtube-dl >/dev/null 2>&1 || echo "[×] Some packages aren't installed please run setup.sh" 
}
clear
run_check && sleep 3 && run_menu || echo "something went wrong.Make sure you have run setup.sh or check your internet connection " && echo "please report any bugs or issues on GitHub"


