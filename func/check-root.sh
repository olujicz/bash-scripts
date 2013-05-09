#!/bin/bash

checkroot () {
	# We need root permisions
	if [[ $EUID -ne 0 ]]; then
		echo "This script must be run as root or:" 1>&2
		echo "\$ sudo $0"
		exit 1
	fi
}
