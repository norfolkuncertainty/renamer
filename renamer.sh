#!/bin/sh

FILE=$1

[ -z $FILE ] && { echo Please enter filename; exit 1; }

FILENAME=$(basename $FILE)
DIRNAME=$(dirname $FILE)
EPDET=$( echo $FILENAME | sed 's/[^0-9]//g')
EPDETCOR=$( echo $EPDET | sed -e 's/./&E/2' -e 's/^/S/g')
NEWNAME=$( echo $FILENAME | sed "s/$EPDET/$EPDETCOR/g") 

mv $FILE /upload/completetorrents/$NEWNAME
rmdir $DIRNAME
