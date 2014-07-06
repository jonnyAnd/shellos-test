. ./core/utils/*.sh
. ./instance/onMinute.sh


testme(){

	
	rtmpdump -v -r rtmp://cp103653.live.edgefcs.net/live/international_medium@36382 | mplayer -
	
}


testme 

