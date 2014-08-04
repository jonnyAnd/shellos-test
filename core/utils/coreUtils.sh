#!/bin/bash

## - IMPORTS - ##
. ./settings/*.sh
##-------------##

returnToMain(){
	./core/coreScript.sh;
}

restartApp(){
	./shellos.sh;
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

	mplayer $1 -fs -zoom
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



dictionaryUtil_getRandomWordFromFile(){
	SOURCE_FILE=$1
 	echo $(awk NR==$((${RANDOM} % `wc -l < $SOURCE_FILE` + 1)) $SOURCE_FILE)
}

###### you tube stuff
youtubeUtil_youtubeVideoSearchResultsToFile(){
	SEARCH_TERM=$1
	FILE_PATH="./precache/youtubeSearchList.txt"

	##clear old output
	rm $FILE_PATH

	YOUTUBE_SEARCH_RESULT=$(youtubeUtil_returnRawYoutubeSearch $SEARCH_TERM)

	IFS=\"
	set -- $YOUTUBE_SEARCH_RESULT
	for i; do youtubeUtil_filterForValidResultsAndOutPut $i ; done
}

youtubeUtil_filterForValidResultsAndOutPut(){

	##echo $UNFILTERED_LINE	

	UNFILTERED_LINE=$1


	MATCH_STRING="watch?v="

	REMOVE_PREFIX="href=\"\/watch?v=";
	REMOVE_SUFFIX="\"";


	if [[ $UNFILTERED_LINE == *$MATCH_STRING* ]]
	then
		if [[ ${#UNFILTERED_LINE} == 20 ]]
		then
		##	echo $UNFILTERED_LINE

			##echo $UNFILTERED_LINE | sed -r 's/^.{5}//' >> "./precache/youtubeSearchList.txt"
			echo ${UNFILTERED_LINE:9} >> "./precache/youtubeSearchList.txt"

		fi
	fi
}

youtubeUtil_returnRawYoutubeSearch(){
	##echo "Searching youtube for "$1
	RESULT="`wget -qO- http://www.youtube.com/results?search_query=$1`"
	echo $RESULT
}