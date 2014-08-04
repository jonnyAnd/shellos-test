#!/bin/bash

. ./core/utils/*.sh


testme(){



	youtubeUtil_youtubeVideoSearchResultsToFile "hello" 
	
	TEST=$(dictionaryUtil_getRandomWordFromFile "./precache/youtubeSearchList.txt")

	echo "--"
	echo $TEST
}


testme 

