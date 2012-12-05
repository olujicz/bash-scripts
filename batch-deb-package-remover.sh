#!/bin/bash
# This script remove all installed packages wich contains word you enter

if [ -z "$1" ];
    then
        echo "Type the word wich you want to remove all package containing it, followed by [ENTER]:"
        read package_name
            if [ -z "$package_name" ]; then
                echo "You need to type word"
                exit 1
            else
                sudo apt-get purge $(dpkg --get-selections | grep $package_name | sed s/'\w*$'//)
            fi
    else
                sudo apt-get purge $(dpkg --get-selections | grep $1 | sed s/'\w*$'//)
fi

exit 0
