#!/bin/bash

echo "MINUTE"


startActions(){
    doActions
}

doActions(){
	## Put actions here


	## when done go home
	allActionsComplete
}

allActionsComplete(){

	## Clean up

	## Stat the whole lot again!
	returnToMain
}

returnToMain(){
	sh ./coreScript.sh;
}




startActions;



