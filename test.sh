. ./core/utils/*.sh
. ./core/utils/youtubeUtil.sh
. ./core/utils/dictionaryUtil.sh


testme(){



##	youtubeUtil_youtubeVideoSearchResultsToFile "hello" 
	
	TEST=$(dictionaryUtil_getRandomWordFromFile "./precache/youtubeSearchList.txt")

	echo "--"
	echo $TEST
}


testme 

