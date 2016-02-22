#!/bin/bash

while true
do

BUTTON=`gpio read 29`
PIR=`gpio read 27`
RES=$PIR$BUTTON
if [ $RES == 11 ]
    then
        echo loop

        /home/pi/midioutput/install/inputscripts/reset.sh
        FNAME=$( ls /home/pi/midi | sort -R | tail -1 )
        if [ $(pidof aplaymidi) ]
        then
            killall aplaymidi
            sleep 5
        fi
        aplaymidi -p 14 /home/pi/midi/$FNAME ; sleep 1; killall aplay
        touch /home/pi/a
        /home/pi/midioutput/install/inputscripts/reset.sh
        echo stop
    fi
sleep 1
done
