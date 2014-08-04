#!/bin/bash

echo "OnLoad"

## - IMPORTS - ##
. ./core/utils/*.sh
. ./settings/*.sh

. ./instance/onLoad.sh
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



