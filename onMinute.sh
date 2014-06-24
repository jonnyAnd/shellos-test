#!/bin/bash

echo "MINUTE"


startActions(){
    doActions
}

doActions(){
	## Put actions here
	playMedia "http://31.media.tumblr.com/tumblr_kpd8q993Cd1qa26qlo1_500.gif"

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

playMedia(){
	mplayer -loop 3 $1 -fs 

}


startActions;



