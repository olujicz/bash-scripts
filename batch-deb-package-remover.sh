#!/bin/bash
# This script remove all installed packages which contains word you enter

if [ -z "$1" ];
    then
        echo "Type the word which you want to remove all package containing it, followed by [ENTER]:"
        read package_name
            if [ -z "$package_name" ]; then
                echo "You have to type someting if you want to remove it :). "
                exit 1
            else
                sudo apt-get purge $(dpkg --get-selections | grep $package_name | sed s/'\w*$'//)
            fi
    else
                sudo apt-get purge $(dpkg --get-selections | grep $1 | sed s/'\w*$'//)
fi

exit 0
