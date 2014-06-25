#!/bin/bash

## - IMPORTS - ##
##. ./core/utils/*.sh
. ./core/utils/*.sh
. ./instance/onMinute.sh

##-------------##


echo "MINUTE"


startActions(){
    doActions
}

##doActions(){

	## this should be in the instance file

##}

allActionsComplete(){

	## Clean up

	## Stat the whole lot again!
	returnToMain
}

startActions;



