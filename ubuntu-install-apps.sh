#!/bin/bash

# Start with upgrading to latest versions
sudo apt-get update
sudo apt-get dist-upgrade

# The following commands will test for required packages install them.
dpkg -l synaptic | grep -qw synaptic || sudo apt-get install -yyq synaptic
dpkg -l htop | grep -qw htop || sudo apt-get install -yyq htop
dpkg -l gufw | grep -qw gufw || sudo apt-get install -yyq gufw
dpkg -l grsync | grep -qw grsync || sudo apt-get install -yyq grsync
dpkg -l openssh-server | grep -qw openssh-server || sudo apt-get install -yyq openssh-server
dpkg -l ubuntu-restricted-extras | grep -qw ubuntu-restricted-extras || sudo apt-get install -yyq ubuntu-restricted-extras
dpkg -l vlc | grep -qw vlc || sudo apt-get install -yyq vlc
dpkg -l gnome-tweak-tool | grep -qw gnome-tweak-tool || sudo apt-get install -yyq gnome-tweak-tool

# Enable firewall and allow SSH
sudo ufw allow proto tcp to 0.0.0.0/0 port 22 > /dev/null
sudo ufw enable

# Remove Firefox and replace with Google Chrome.
sudo apt-get purge -yyqq firefox*

dpkg -l | grep -qw google-chrome-stable || wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
if [ -f google-chrome-stable_current_amd64.deb ]; then
	sudo dpkg -i google-chrome-stable_current_amd64.deb 
	rm google-chrome-stable_current_amd64.deb
fi 

# Install Spotify from snap
snap list | grep -qw spotify || sudo snap install spotify








