#!/bin/bash

##TODO:


## - IMPORTS - ##
. ./core/utils/*.sh
. ./settings/*.sh





##-------------##

startShellOs(){

	##check for net connection
	##if getIsConnectedToInternet; then 
		updateApp
		updateInstanceFiles
	##else 
		##sh ./smartReconnect.sh
	##fi

	## continue to app
	##sh ./core/coreScript.sh
}

## starting
startShellOs


