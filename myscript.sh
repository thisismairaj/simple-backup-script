#!/bin/bash
# Backups 'hello' folder to hellobackups
# root 20/6/2017

if [ $# != 1 ]
then
	echo Usage: a single parameter of directory/file is must
	exit
fi
# does the directory exist?
if [ ! -d ~/$1 ]
then
	echo 'The given directory does not exist'
	exit
fi
date=`date +%F`
# do we already have the backup for today's date?
if [ -d ~/projectbackups/$1_$date ]
then
	echo 'This folder has already been backed up for today, overwrite?'
	read answer
	if [ $anaswer != 'y' ]
	then
		exit
	fi
else
	mkdir ~/projectbackups/$1_$date
cp -R ~/$1_$date ~/projectbackups/
tar -czvf ~/projectbackups/archive_$1_$date.tar.gz ~/projectbackups/$1_$date
rm -vr ~/projectbackups/$1_$date
echo Compressed, zipped and made backup of $1.
echo Bcakup of $1 completed
fi
