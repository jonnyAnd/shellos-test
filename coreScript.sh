#!/bin/bash

startCore(){
	ticker
}

ticker(){
	while sleep 1; do onTick; done
}

onTick(){

	if [ "$(getHours)" = "00" ] && [ "$(getMinutes)" = "00" ] && [ "$(getSeconds)" = "00" ];
	then
		## ITS MIDNIGHT
		onDay

	elif [ "$(getMinutes)" = "00" ] && [ "$(getSeconds)" = "00" ];
	then
		## On the hour
		onHour
	elif [ "$(getSeconds)" = "00" ]
	then
		## on the minute!
		onMinute	
	else
		onSecond
	fi
}

onDay(){
	clear
	bash ./onDay.sh
	exit;
}

onHour(){
	clear
	bash ./onHour.sh
	exit;
}

onMinute(){
	clear;
	bash ./onMinute.sh
	exit;
}

onSecond(){
	clear;
	figOut $(getDateString);
}


## UTILS
figOut(){
	figlet ${@}
}

##returning functions
getDateString(){
	echo $(date +"%H : %M : %S")
}

getSeconds(){
	echo $(date +"%S")
}

getMinutes(){
	echo $(date +"%M")
}

getHours(){
	echo $(date +"%H")
}


## starting
startCore



