#!/bin/bash

echo "HOUR????"
## - IMPORTS - ##
##. ./core/utils/*.sh
. ./core/utils/*.sh
. ./instance/onHour.sh

##-------------##


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



