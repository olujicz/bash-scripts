#!/bin/bash
# -*- coding: UTF-8 -*-
# Script for dumping MySQL base automaticly using cron.

# exec test
exec_test () {
[ $? -eq 0 ] && echo "-- Command successfully executed" || echo "-- Command failed; exit 1"
}

# Filenames
database_name="test"
backup_folder="/path/to/backup/folder/"
mydate=`date '+%m%d%y'`
mytime=`date '+%T %m.%d.%y.'`
filename1="$backup_folder/$database_name_$mydate.bck.sql"
username="some"
password="emos"


# Logging
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>>$backup_folder/$database_name.log 2>&1
# Everything below will go to the log file:


dump_base () {
		echo "###########################"
		echo "STARTING on: $mytime"
		echo "Base dumping..."
	mysqldump -u$username -p$password $database_name > $filename1
}

compress_base () {
	echo "Compressing base..."
gzip -f9 $filename1
}


dump_base ; exec_test
compress_base ; exec_test

	echo "Done, quit!"
