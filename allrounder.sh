#!/bin/bash

FILE=$1

echo "found $FILE"

AR=($(cat $FILE | grep -n "#!"))
TL=($(wc -l $FILE))https://github.com/v-nightwolf/automation
for i in ${!AR[@]}; do
	COMP=$(echo ${AR[$i]}| awk -F ":" '{print $2}'|sed 's/\#!//g')
	IL=$(echo ${AR[$i]}| awk -F ":" '{print $1}')
        EL=$(echo ${AR[$i+1]}| awk -F ":" '{print $1}')
	[ -z $EL ] && EL=${TL[0]} || EL=$(($EL-1))  
	#cat $FILE | sed -n "$(($IL+1)),$EL"p | $COMP
	cat $FILE | sed -n "$IL,$EL"p | $COMP
	#echo $COMP $IL $EL
done 
