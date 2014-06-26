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

playMedia(){

	##precache
	FULL_URL=$1
	FILE_NAME=${FULL_URL##*/}
	DO_PRECACHE=$2

	if $DO_PRECACHE; then
		if isPreCached $FILE_NAME; then 
			echo "precashed"
		else
			preCacheFile $FILE_NAME $FULL_URL
		fi
		
		sendToMplayer ./precache/$FILE_NAME
		
	else
		sendToMplayer $FULL_URL
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
