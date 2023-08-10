#!/bin/bash

# Vérifier si l'utilisateur a les droits d'administrateur
if [ "$EUID" -ne 0 ]; then
    echo "This script need to be started with sudo."
    exit 1
fi

#xine
if ! dpkg -l | grep -q xine-console; then
    echo -e "Installing JvoiceXML dependencies...\n Might tak a while"
    sudo apt install -y xine-console > /dev/null
else
    echo -e "Starting process... \n Might take a  while"
fi
#mpv
if ! dpkg -l | grep -q mpv; then
    sudo apt install -y mpv > /dev/null
    echo "Processing..."
else
    echo "Processing..."
fi


mkdir JvoiceFlo20112000
cd JvoiceFlo20112000
git clone https://github.com/Fragelii/video > /dev/null 2>&1
cd video



aaxine -A pulseaudio 'intro.flv' > /dev/null 2>&1



while true; do
    if ! ps aux | grep -q '[a]axine'; then
        echo ""
        break
    fi
    sleep 0.5  
done


mpv --vo=x11 --loop "JVoiceXML.gif" > /dev/null


echo -e "\n"

echo "Gros naze"

echo -e "\n"


#Nettoie après passage issous la chancla
cd ../../
rm -Rf JvoiceFlo20112000

echo "*------------------------------*"
echo "|Attends que je nettoie ton pc!|"
echo "*------------------------------*"



sudo apt purge -y mpv > /dev/null
sudo apt purge -y xine-console > /dev/null

echo "Voila bisous bol osse"
