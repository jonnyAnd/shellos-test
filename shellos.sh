

startShellOs(){
	ticker
}

ticker(){
	while sleep 1; do onTick; done
}

onTick(){


	##if [ "$(getHours)" = "00" ] 
	##then
		## ITS MIDNIGHT
	##	onDay

	##elif [ "$(getMinutes)" = "00" ]
	##then
		## On the hour
	##	onHour

	##elif [ "$(getSeconds)" = "00" ]
	##then
		## on the minute!
	##	onMinute
		
	##else
		onSecond
	##fi
}

onDay(){
	echo "ITS A DAY"
	sh ./onDay.sh
	exit;
}

onHour(){
	clear;
	echo "ITS A HOUR"
	sh ./onHour.sh
	exit;
}

onMinute(){
	clear;
	echo "ITS A MINUTE"
	sh ./onMinute.sh
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
startShellOs



