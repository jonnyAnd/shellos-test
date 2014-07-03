


testme(){
	
	
	youtube-dl -o $1 "http://www.youtube.com/watch?v="$1
	
	mplayer $1".mp4"
	
}

testme "moZ4qoFIeUE"
