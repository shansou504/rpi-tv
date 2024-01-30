#!/bin/bash

sudo raspi-config
sudo apt update
sudo apt upgrade -y
sudo apt install -y xinit openbox obsession tint2 vim pulseaudio pavucontrol pasystray network-manager-gnome blueman lxpolkit lxterminal lxappearance gnome-themes-extra papirus-icon-theme feh rpd-plym-splash git suckless-tools onboard antimicro retroarch libretro-mgba libretro-gambatte kodi kodi-inputstream-adaptive kodi-peripheral-joystick unattended-upgrades motion
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
echo "Fixing error with motion permissions and disabling service"
sudo mkdir -p /var/log/motion/
sudo touch /var/log/motion/motion.log
sudo chown motion:motion -R /var/log/motion
sudo systemctl disable motion
mkdir ~/roms/
echo "Adding startx to ~/.profile"
cat autostartx >> ~/.profile
