#!/bin/bash

xarg='x'
carg='c'
varg='v'
count=1

tmp=~/.config/SimplePaste/tmp
Temp_Dir=$tmp/Dir
Temp_File=$tmp/File
Pwd=$(pwd)/

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
	Dir=`cat $Temp_Dir`
	read line < "$Temp_File"
	
	if [[ "$line" == "$xarg" ]]; then
		{
		read
		while read line; 
		do
			mv  "$Dir"/"$line" "$Pwd"
		done
		} < "$Temp_File"
		echo "" > $Temp_Dir
		echo "" > $Temp_File
	else 
		{
		read
		while read line; 
		do
			cp  "$Dir"/"$line" "$Pwd"
		done
		} < "$Temp_File"
	fi
	
else echo "script usage: $(basename $0) [-x name] [-c name] [-v]"
exit 1
fi
