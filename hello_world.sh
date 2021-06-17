#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

zypper refresh && zypper update


#installing snapd
sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed snappy
sudo zypper --gpg-auto-import-keys refresh
sudo zypper dup --from snappy
sudo zypper install snapd
source /etc/profile
sudo systemctl enable --now snapd
sudo systemctl enable --now snapd.apparmor


#installing packages available from snap
snap install code --classic
snap install webstorm --classic
snap install goland --classic
snap install gitkraken --classic
snap install notepad-plus-plus
snap install bpytop
snap install discord-canary
snap install postman

#packages from zypper
sudo zypper install curl

#installing brave
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser
sudo zypper install brave-browser

#installing mongodb
zypper addrepo https://download.opensuse.org/repositories/server:database/openSUSE_Tumbleweed/server:database.repo
zypper refresh
zypper install mongodb
mkdir -p /data/db

#install git 
zypper install git

