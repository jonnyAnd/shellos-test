#!/bin/bash

## - IMPORTS - ##
. ./core/utils/*.sh





##-------------##


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
	bash ./core/onDayCore.sh

	exit;
}

onHour(){
	clear
	bash ./core/onHourCore.sh
	exit;
}

onMinute(){
	clear;
	bash ./core/onMinuteCore.sh
	exit;
}

onSecond(){
	clear;
	figOut $(getDateString);
}

## starting
startCore



