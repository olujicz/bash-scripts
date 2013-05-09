#!/bin/bash
mkdir ~/git
cd ~/git
sudo apt-get -y install git-core
sudo apt-get -y install exuberant-ctags
git clone https://github.com/mekanix/vim.git
~/git/vim/bin/init.sh
