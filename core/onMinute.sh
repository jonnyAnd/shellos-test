#!/bin/bash

## - IMPORTS - ##
. ./core/utils/*.sh





##-------------##


echo "MINUTE"


startActions(){
    doActions
}

doActions(){
	## Put actions here

	playMedia "http://i.imgur.com/dAtcCfH.gif"

	##playMedia "http://media2.giphy.com/media/XNzYBOhw7C3mw/giphy.gif"
	##wait 5
	##playMedia "http://media.giphy.com/media/x5aebCMe2PUCA/giphy.gif"
	

	## when done go home
	allActionsComplete
}

allActionsComplete(){

	## Clean up

	## Stat the whole lot again!
	returnToMain
}

startActions;



