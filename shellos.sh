#!/bin/bash

##TODO:
	## - Wait for internet connection to mone up before update
	## - add images play for duration
	## - add stream play for duration
	## - refactor to have instance implemented cleaner
	## - setup and install depemndnceies	





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
		./core/coreScript.sh true
	##else 
		##sh ./core/coreScript.sh



##		if [ "$RECONNECT_COUNT" = "$ATTEMPT_TRIES" ]; then
##			echo "NO INTERNET CONNECTION - proceed without update"
##			sh ./core/coreScript.sh
##		
##		else
##			((RECONNECT_COUNT+=1))
##			echo "Trying again! Attempt "RECONNECT_COUNT
##			startShellOs
##		fi

	##fi
	
}

## starting
RECONNECT_COUNT=0;
ATTEMPT_TRIES=10;

startShellOs
