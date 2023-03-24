#!/usr/bin/bash
# author : ouldevloper

if [ "$EUID" -ne 0 ]
  then echo -e "\e[34mPlease run the script as root.\e[0m"
  exit
fi

LINK=https://raw.githubusercontent.com/ouldevloper/Wireguard_client_gui_linux/main/gui_wireguard.deb
FILE=gui_wireguard.deb
echo -e "\e[31mSetup Wireguard.\e[0m"
echo -e "\e[32mDownloading wireguard Clinet GUI.\e[0m"
rm "$FILE"
wget  "$LINK"
if [ -f "$FILE" ];
then
	echo -e "\e[33mInstalling Wireguard.\e[0m"
	dpkg -i $FILE
	echo -e "\e[34mClearing...\e[0m"
	rm "$FILE"
	echo -e "\e[34mDone.\e[0m"
	wireguird
else
	echo -e "\e[34mFile Not Found ! \nplease check your internet!\e[0m"
fi
