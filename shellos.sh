#!/bin/bash

## todo :
## add string to connect to internet from stored pass

startShellOs(){

	##check for net connection
##	if getIsConnectedToInternet; then 
##		echo "Good to continue to app!"; 
		updateApp
	
		## continue to app
	##	sh ./coreScript.sh

##	else 
##		echo "nopes"; 
##		sh ./smartReconnect.sh
##		##here we can offer the smart reconnect
##	fi
}

getIsConnectedToInternet(){
	if [[ $(ping -c1 google.com) ]]
	then 
	    echo "You are connected to the intertubes!"
	    return 0;
	else
	    echo "No interwebs!!"
	    return 1;
	fi
}


updateApp(){
	echo "Updateing from github"
	git pull;
	git checkout develop
	git pull;
}


## starting
startShellOs


