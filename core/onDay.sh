#!/bin/bash

## - IMPORTS - ##
. ./core/utils/*.sh





##-------------##

echo "DAY"


startActions(){
    doActions
}

doActions(){
	## Put actions here
	##clean up afer the day
	rm -rf ./precache

	## when done go home
	allActionsComplete
}

allActionsComplete(){

	## Clean up


	## restart app (and hopfully cause a update!)
	restartApp
}

restartApp(){
	sh ./shellos.sh;
}

startActions;



