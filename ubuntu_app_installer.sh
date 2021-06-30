
#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

apt update && apt upgrade

#installing snap
apt install -y snapd

#installing git

add-apt-repository ppa:git-core/ppa
apt update; apt install -y git

#installing packages from snap

snap install code --classic
snap install webstorm --classic
snap install goland --classic
snap install gitkraken --classic
snap install notepad-plus-plus
snap install bpytop
snap install discord-canary
snap install postman

#installing brave

sudo apt install -y apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install -y brave-browser

#installing mongodb

curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

apt-key list

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

sudo apt update

sudo apt install -y mongodb-org

sudo systemctl start mongod.service

sudo systemctl status mongod

sudo systemctl enable mongod

#installing nodejs
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

#npm global packages

npm i -g nodemon yarn

#installing other packages

#neofetch
apt install -y neofetch

#cleaning
apt autoremove
apt clean
