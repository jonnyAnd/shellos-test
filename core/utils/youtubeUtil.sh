#!/bin/bash

youtubeUtil_youtubeVideoSearchResultsToFile(){
	SEARCH_TERM=$1
	FILE_PATH=$2

	##clear old output
	rm $FILE_PATH

	YOUTUBE_SEARCH_RESULT=$(youtubeUtil_returnRawYoutubeSearch $SEARCH_TERM)

	##awk out quotes
	myarr=($(echo $YOUTUBE_SEARCH_RESULT | awk -F\" '{print $0}'))

	# Or loop through every element in the array
	for i in "${myarr[@]}"
	do
	   :
	  youtubeUtil_filterForValidResultsAndOutPut $i $FILE_PATH
	done
}

youtubeUtil_filterForValidResultsAndOutPut(){

	UNFILTERED_LINE=$1
	FILE_PATH=$2

	MATCH_STRING="watch?v="

	REMOVE_PREFIX="href=\"\/watch?v=";
	REMOVE_SUFFIX="\"";


	if [[ $UNFILTERED_LINE == *$MATCH_STRING* ]]
	then
	  ##echo $UNFILTERED_LINE	
	  ##echo $UNFILTERED_LINE | sed "s/^$REMOVE_PREFIX//" | sed "s/$REMOVE_SUFFIX$//" 

	  echo $UNFILTERED_LINE | sed "s/^$REMOVE_PREFIX//" | sed "s/$REMOVE_SUFFIX$//" >> $FILE_PATH

	fi
}

youtubeUtil_returnRawYoutubeSearch(){
	echo "Searching youtube for "$1
	RESULT="`wget -qO- http://www.youtube.com/results?search_query=$1`"
	echo $RESULT
}


youtubeUtil_youtubeVideoSearchResultsToFile "baa" resssssssult.txt