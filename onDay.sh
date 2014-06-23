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

	## Stat the whole lot again!
	returnToMain
}

returnToMain(){
	sh ./shellos.sh;
}




startActions;



