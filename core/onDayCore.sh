#!/bin/bash

echo "DAY"
## - IMPORTS - ##
. ./core/utils/*.sh
. ./settings/*.sh

. ./instance/onDay.sh
##-------------##



startActions(){
    doActions
}

##doActions(){

	## this should be in the instance file



##}

allActionsComplete(){
	## Clean up

	## restart app (and hopfully cause a update!)
	restartApp
}



startActions;



