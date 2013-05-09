#!/bin/bash

# Install fish
sudo apt-get -y install python-software-properties
audo apt-get -y install software-properties-common
sudo add-apt-repository ppa:zanchey/fishfish-snapshot
sudo aptitude update
sudo aptitude -y install fishfish

# Install git
sudo apt-get install git-core

# configuration
mkdir ~/.config
cd ~/.config
git clone https://github.com/mekanix/fish.git

# change shell
chsh -s /usr/bin/fish

