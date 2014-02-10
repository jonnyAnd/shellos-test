echo "DAY"


startActions(){
	## check if already run in 

	##  if time stamp file exits
	if [ ! -f ./logfiles/dayStamp.txt ]; then
    	## no stamp found so we can get going!
    	stampFile
    	doActions
    else
    	echo $(getStampContent)
    	echo $(getStampFromFile)



    	if ["$(getStampFromFile)" == "$(getStampContent)"] ;then
    		## Already run Exit 
    		returnToMain
    	else
    		## we are allowed to run this

    		## update time stamp
    		stampFile
    		## run actions
    		doActions
    	fi
	fi

	## get time stamp
	## if 


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

stampFile(){
	$(getStampContent) > ./logfiles/dayStamp.txt
}

getStampContent(){
	echo $(date +"%Y/%m/%d");
}

getStampFromFile(){
	echo $(cat ./logfiles/dayStamp.txt);
}



startActions;



