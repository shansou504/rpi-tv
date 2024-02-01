#!/bin/bash

sudo raspi-config
sudo apt update
sudo apt upgrade -y
sudo apt install -y xinit openbox obsession tint2 vim pulseaudio pavucontrol pasystray network-manager-gnome blueman lxpolkit lxterminal lxappearance gnome-themes-extra papirus-icon-theme feh rpd-plym-splash git suckless-tools onboard antimicro retroarch libretro-mgba libretro-gambatte kodi kodi-inputstream-adaptive kodi-peripheral-joystick unattended-upgrades motion nginx php php8.2-fpm ffmpeg ranger
cd
git clone https://github.com/shansou504/raspberry-pi-tv
cd raspberry-pi-tv/
echo "Setting up streaming server"
sudo cp -r var/www/stream/ /var/www/
sudo rm /etc/nginx/sites-enabled/default
sudo cp etc/nginx/sites-available/stream /etc/nginx/sites-available/
sudo chown root:root /etc/sites-available/stream
sudo ln -s /etc/nginx/sites-available/stream /etc/nginx/sites-enabled/stream
sudo cp lib/systemd/system/stream.service /lib/systemd/system/
sudo cp usr/local/bin/stream /usr/local/bin/
sudo chown root:root /usr/local/bin/stream
sudo chmod 755 /usr/local/bin/stream
sudo chown root:root /lib/systemd/system/stream.service
sudo usermod -aG audio,video,sudo www-data
echo "Copying autostart into ~/.config/openbox/"
mkdir -p ~/.config/openbox
cp config/openbox/* ~/.config/openbox/
echo "Copying scripts into ~/.local/bin/"
mkdir -p ~/.local/bin/
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
