#!/bin/bash


getRandomWordFromFile(){

	SOURCE_FILE=$1


	cat $SOURCE_FILE| sort --random-sort | head -n 1




}