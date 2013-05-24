#!/bin/bash
# Detects Linux Distribution, version, codename ...

if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    DISTRO=$DISTRIB_ID
elif [ -f /etc/debian_version ]; then
    DISTRO=Debian
    # XXX or Ubuntu
elif [ -f /etc/redhat-release ]; then
    DISTRO="Red Hat"
    # XXX or CentOS or Fedora
else
    DISTRO=$(uname -s)
fi

# echo "$DISTRO"
# echo "$DISTRIB_RELEASE"
# echo "$DISTRIB_CODENAME"
# echo "$DISTRIB_DESCRIPTION"

## Example for DISTRO
# if [[ $DISTRO == Ubuntu ]]; then
# 	echo "This is Ubuntu!"
# else
# 	echo "This is not Ubuntu!"
# fi

## Example for RELEASE
# if [[ $DISTRIB_RELEASE == 12.04 ]]; then
# 	echo "This is 12.04!"
# else
# 	echo "This is not 12.04!"
# fi
