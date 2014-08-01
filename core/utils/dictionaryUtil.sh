#!/bin/bash


dictionaryUtil_getRandomWordFromFile(){

	SOURCE_FILE=$1


	##head -$((${RANDOM} % `wc -l < $SOURCE_FILE` + 1)) $SOURCE_FILE | tail -1

	echo $(head -n 1 $SOURCE_FILE)

	

	##echo $RANDOM


}