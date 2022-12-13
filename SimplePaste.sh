#!/bin/bash

xarg='-x'
carg='-c'
varg='-v'
count=1

Temp_Dir=~/.config/CopyUtils/tmp/Dir
Temp_File=~/.config/CopyUtils/tmp/File
touch $Temp_Dir
touch $Temp_File

if [ "$#" -lt 2 ]; then
	count=0
fi

if [[ "$xarg" == "$1" && "$count" -eq 1 ]]; then
	echo $(pwd) > $Temp_Dir
	echo "x" > $Temp_File
	for var in "${@:2}"
	do 	
		echo "$var" >> $Temp_File
	done

elif [[ "$carg" == "$1" && "$count" -eq 1 ]]; then
	echo $(pwd) > $Temp_Dir
	echo "c" > $Temp_File
	for var in "${@:2}"
	do 	
		echo "$var" >> $Temp_File
	done

elif [[ "$varg" == "$1" ]]; then


else echo "script usage: $(basename $0) [-x name] [-c name] [-v]"
exit 1
fi
