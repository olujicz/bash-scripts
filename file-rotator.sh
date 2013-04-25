#!/bin/sh
#-----------------------------------------------------------------------
# FILE ROTATOR SCRIPT
#
# The purpose of this script is to rotate, compress and delete files
# - Files older than ARC_AGE are gzipped and rotated
# - Files bigger than SIZE_LIM are gzipped and rotated
# - Gzipped files older than DEL_AGE are deleted
#
#-----------------------------------------------------------------------
# Vars
DATE=`date +%F"-"%H:%M`
FILEDIR="/storage/logs/"
DEL_AGE="30"
ARC_AGE="1"
SIZE_LIM="20M"
# Diagnostics
echo "-= Rotation starting =-"
echo "    Directory to search: $FILEDIR"
echo "    File age to check for delition: $DEL_AGE"
echo "    File age to check for archive: $ARC_AGE"
echo "    File size to check for archive: $SIZE_LIM"
echo " "
# Compress all unconpressed files which last modification occured more than ARC_AGE days ago
echo "-= Looking for old files =-"
FILES=`find $FILEDIR -type f -mtime +$ARC_AGE -not \( -name '*.gz' \) -print`
echo "Files to be archived:"
echo $FILES
echo " "
for FILE in $FILES; do
    # Compress but keep the original file
    gzip -9 -c "$FILE" > "$FILE".$DATE.gz;
    # Check if file is beeing used:
    lsof $FILE
    ACTIVE=$?
    # Delete inactive files, truncate if active
    if [ $ACTIVE != 0 ]; then
        # Delete the file
        rm "$FILE";
    else
        # Truncate file to 0
        :>"$FILE";
    fi
done
# Compress all unconpressed files that are bigger than SIZE_LIM
echo "-= Looking for big files =-"
FILES=`find $FILEDIR -type f -size +$SIZE_LIM -not \( -name '*.gz' \) -print`
echo "Files to be archived:"
echo $FILES
echo " "
for FILE in $FILES; do
    # Compress but keep the original file
    gzip -9 -c "$FILE" > "$FILE".$DATE.gz;
    # Truncate original file to 0
    :>"$FILE";
done
echo "-= Deleting old archived files =-"
FILES_OLD=`find $FILEDIR -type f -mtime +$DEL_AGE -name '*.gz' -print`
echo "Archived files older than $DEL_AGE days to be deleted:"
echo $FILES_OLD
echo " "
# Deletes old archived files.
find $FILEDIR -type f -mtime +$DEL_AGE -name '*.gz' -exec rm -f {} \;
echo "-= Rotation completed =-"
echo " "
