#!/bin/bash

##TODO:
	## - Wait for internet connection to mone up before update
	## - add images play for duration
	## - add stream play for duration
	## - refactor to have instance implemented cleaner





## - IMPORTS - ##
. ./core/utils/*.sh
. ./settings/*.sh

##-------------##

startShellOs(){
	
	clear
	echo "Waiting for system to come up"
	##sleep 10;


	##check for net connection
	##if getIsConnectedToInternet; then 
		echo "system ready to go!"
	
		updateApp
		updateInstanceFiles
		## continue to app
		sh ./core/coreScript.sh
	##else 
		##sh ./smartReconnect.sh
		##echo "Internet connection issue"
		
		##((RECONNECT_COUNT+=1))
		##echo "Trying again! Attempt "RECONNECT_COUNT
		##startShellOs
	##fi
	
}

## starting
RECONNECT_COUNT=0;

startShellOs


