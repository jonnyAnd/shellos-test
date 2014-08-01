#!/bin/bash

youtubeUtil_youtubeVideoSearchResultsToFile(){
	SEARCH_TERM=$1
	FILE_PATH="./precache/youtubeSearchList.txt"

	##clear old output
	rm $FILE_PATH

	YOUTUBE_SEARCH_RESULT=$(youtubeUtil_returnRawYoutubeSearch $SEARCH_TERM)

	##echo $YOUTUBE_SEARCH_RESULT


	##awk out quotes
	##SPLIT_RESLUTS_ARRAY=($(echo $YOUTUBE_SEARCH_RESULT | awk -F\" '{print $0}'))
	
	##IFS="\"" read -ra SPLIT_RESLUTS_ARRAY <<< "$YOUTUBE_SEARCH_RESULT"

	###loop through every element in the array
	##for element in "${SPLIT_RESLUTS_ARRAY[@]}"
	##do
	    ##echo "$element"
	 ##   youtubeUtil_filterForValidResultsAndOutPut $element $FILE_PATH
	##done


	##b=12:34:56
	IFS=\"
	set -- $YOUTUBE_SEARCH_RESULT
	for i; do youtubeUtil_filterForValidResultsAndOutPut $i ; done



	# Or loop through every element in the array
	##for i in "${SPLIT_RESLUTS_ARRAY[@]}"
	##do
	  ## :

	 ##  echo "moo"
	  ##youtubeUtil_filterForValidResultsAndOutPut $i $FILE_PATH
	##done
}

youtubeUtil_filterForValidResultsAndOutPut(){

	##echo $UNFILTERED_LINE	

	UNFILTERED_LINE=$1


	MATCH_STRING="watch?v="

	REMOVE_PREFIX="href=\"\/watch?v=";
	REMOVE_SUFFIX="\"";


	if [[ $UNFILTERED_LINE == *$MATCH_STRING* ]]
	then
		if [[ ${#UNFILTERED_LINE} == 20 ]]
		then
			##echo $UNFILTERED_LINE >> "./precache/youtubeSearchList.txt"

			##echo $UNFILTERED_LINE | sed -r 's/^.{5}//' >> "./precache/youtubeSearchList.txt"
			echo ${UNFILTERED_LINE:9} >> "./precache/youtubeSearchList.txt"

		fi



	 ## echo $UNFILTERED_LINE >> "./precache/youtubeSearchList.txt"
	  ##echo $UNFILTERED_LINE | sed "s/^$REMOVE_PREFIX//" | sed "s/$REMOVE_SUFFIX$//" 

	  ##echo $UNFILTERED_LINE | sed "s/^$REMOVE_PREFIX//" | sed "s/$REMOVE_SUFFIX$//" >> "./precache/youtubeSearchList.txt"

	fi
}

youtubeUtil_returnRawYoutubeSearch(){
	##echo "Searching youtube for "$1
	RESULT="`wget -qO- http://www.youtube.com/results?search_query=$1`"
	echo $RESULT
}


youtubeUtil_youtubeVideoSearchResultsToFile "baa"
