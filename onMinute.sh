#!/bin/bash

echo "MINUTE"


startActions(){
    doActions
}

doActions(){
	## Put actions here
	playMedia "http://31.media.tumblr.com/tumblr_kpd8q993Cd1qa26qlo1_500.gif"

	## when done go home
	allActionsComplete
}

allActionsComplete(){

	## Clean up

	## Stat the whole lot again!
	returnToMain
}

returnToMain(){
	sh ./coreScript.sh;
}


####UTILS

playMedia(){

	##precache
	FULL_URL=$1
	FILE_NAME=${FULL_URL##*/}

	if isPreCached $FILE_NAME; then 
		echo "precashed"
	else
		preCacheFile $FILE_NAME $FULL_URL
	fi

	##Play
	mplayer -loop 3 ./precache/$FILE_NAME -fs 
}

isPreCached(){

	PRE_CACHE_FILE="./precache/"$1

	if [ -a "$PRE_CACHE_FILE" ]; then
	    echo "File already on system"
	    return 0;
	else
	    echo "Not Precached"
	    return 1;
	fi
}

preCacheFile(){
	## do we have a precachefolder
	if [ ! -d "./precache" ]; then
		mkdir precache;   
	fi

	echo "PreCaching "$1" from "$2

	wget -O ./precache/$1 $2;
}



######

startActions;



