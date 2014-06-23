#!/bin/bash




startReconnect(){
	clear
	echo "You arent connected to the internet!"
	echo "So we are going to try a cunning way to do that"
	echo "This app gets its wifi connection details from your private repo."
	echo "Please check these!"
	sleep 2
	clear
	echo "In 5 minutes, this app will try and connect to a wifi with the following details"
	echo "Share a wifi hotspot from your phone with these details and the app will fix itself"
	sleep 2

	RANDOM_WORD=$(setRandomWord)

	echo "SSID - "$RANDOM_WORD
	echo "Password -" $RANDOM_WORD

	## Now wait for people to get setup. 
	sleep 300

	connectToSharedWifi

}

setRandomWord(){
	echo $(awk NR==$((${RANDOM} % `wc -l < dictionary.txt` + 1)) dictionary.txt)
}

connectToSharedWifi(){
	clear
	echo "Attempting To Connect To \""$RANDOM_WORD"\""

	## We have a lot of assumptions in this function

	##Commenting out as i dont want it to mess with me when i am dvelopeing
	#ifconfig wlan0
	#iwconfig wlan0 essid $RANDOM_WORD key s:$RANDOM_WORD
	#dhclient wlan0

	sleep 5 

	if getIsConnectedToInternet; then 
		echo "SUCCESS!!!!";
		echo "Restarting app to get correct wifi details" 

		sh ./shellos.sh
	
	else 
		echo "FAIL FAIL FAIL"; 
	fi
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


startReconnect
