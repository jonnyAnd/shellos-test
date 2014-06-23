#!/bin/bash

echo "DAY"


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


	## restart app (and hopfully cause and update!)
	restartApp
}

restartApp(){
	sh ./shellos.sh;
}

startActions;



