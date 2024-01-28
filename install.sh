#!/bin/bash

sudo raspi-config
sudo apt update
sudo apt upgrade -y
sudo apt install -y xinit openbox obsession tint2 vim pulseaudio pavucontrol pasystray network-manager-gnome blueman lxpolkit lxterminal lxappearance gnome-themes-extra papirus-icon-theme feh rpd-plym-splash git suckless-tools onboard antimicro retroarch libretro-mgba libretro-gambatte kodi kodi-inputstream-adaptive kodi-peripheral-joystick cmake libjpeg-dev unattended-upgrades
cd
git clone https://github.com/shansou504/raspberry-pi-tv
cd raspberry-pi-tv/
mkdir -p ~/.config/openbox
echo "Copying autostart into ~/.config/openbox/"
cp config/openbox/* ~/.config/openbox/
mkdir -p ~/.local/bin/
echo "Copying scripts into ~/.local/bin/"
cp -r local/bin/* ~/.local/bin/
chmod 755 ~/.local/bin/*
cd
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer-experimental
echo "Making mjpg_streamer"
make
echo "Installing mjpg_streamer"
sudo make install
cd ~/raspberry-pi-tv/
sudo cp mjpg_streamer.service /lib/systemd/system/
sudo chown root:root /lib/systemd/system/mjpg_streamer.service
mkdir ~/roms/
echo "Adding startx to ~/.profile"
cat autostartx >> ~/.profile
