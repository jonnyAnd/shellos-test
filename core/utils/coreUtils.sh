#!/bin/bash




## - IMPORTS - ##
. ./settings/*.sh



##-------------##


returnToMain(){
	sh ./core/coreScript.sh;
}

restartApp(){
	sh ./shellos.sh;
}

getIsConnectedToInternet(){
	if [[ $(ping -c1 google.com) ]]
	then 
	    echo "You are connected to the intertubes!"
	    return 0;
	else
	    echo "No interwebs!!"
	    return 1;
	fi
}

updateApp(){
	echo "Updateing from github"
	git pull;
	git checkout develop
}

updateInstanceFiles(){	
	rm -rf ./$INSTANCE_FOLDER_NAME
	git clone $INSTACE_REPO ./$INSTANCE_FOLDER_NAME
	cd $INSTANCE_FOLDER_NAME
	git checkout $INSTANCE_BRANCH
	cd ..
}

figOut(){
	figlet ${@}
}

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

playGif(){
	playMedia $1 $2
}

playYouTube(){
	VIDEO_CODE=$1

	if isPreCached $VIDEO_CODE; then 
		echo "precashed"
	else
		echo "not precached"

		preCacheYouTube $VIDEO_CODE
	fi
	sendToMplayer ./precache/$1
}

playMedia(){

	##precache
	FULL_URL=$1
	FILE_NAME=${FULL_URL##*/}
	NO_PRECACHE=$2

	if $NO_PRECACHE; then
		sendToMplayer $FULL_URL
	else
		if isPreCached $FILE_NAME; then 
			echo "precashed"
		else
			preCacheFile $FILE_NAME $FULL_URL
		fi
		
		sendToMplayer ./precache/$FILE_NAME
	fi
}

sendToMplayer(){

	mplayer $1 -fs
}

isPreCached(){

	PRE_CACHE_FILE="./precache/"$1

	if [ -f "$PRE_CACHE_FILE" ]; then
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

preCacheYouTube(){
	echo "preCacheYouTube-->http://www.youtube.com/watch?v="$1
	## do we have a precachefolder
	if [ ! -d "./precache" ]; then
		mkdir precache;   
	fi

	

	echo "PreCaching YouTube "$1
	##youtube-dl -f worst -o ./precache/$1 "http://www.youtube.com/watch?v="$1
	youtube-dl -f 17 -o ./precache/$1 "http://www.youtube.com/watch?v="$1
}
