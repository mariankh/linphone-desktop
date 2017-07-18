#!/bin/bash
########################################
# play -t raw -r 16k -e signed -b 16 -c 1 message.pcm
#scp yiannos@10.15.120.207:/var/lib/asterisk/sounds/message.pcm /home/mariankh/$
#runs on linux
#calls and plays a pcm file at the begining of a call.
#play -t raw -r 16k -e signed -b 16 -c 1 message.pcm

#@author:mariankh
SIP_HOST='dispark.moo.com'
SIP_USER='6003'
SIP_PASS='6003'
CALL='500'
########################################
get_phone_state () {
./linphonecsh status register 2>/dev/null 1>&2
 if [ $? -eq $1 ]; then
  true
 else
  false
 fi
}

# ret code 255 = no daemon started
if get_phone_state 255; then
 echo "Starting Phone client ..."
./linphonecsh init
 while get_phone_state 255; do sleep 0.2; done
else echo "Phone client already started ..."
fi

# ret code 0 = unregistered
# ret code 1 = registered
if get_phone_state 0; then
 echo "Register Client on SIP Server ..."
./linphonecsh register --host ${SIP_HOST} --username ${SIP_USER} --password ${SIP_PASS}
else echo "Client already registered ..."
fi
while ! get_phone_state 1; do sleep 0.2; done

 
echo "using soundcard as file"
#linphonecsh soundcard use files

echo "Calling Number: ${CALL} ..."
./linphonecsh dial ${CALL}
while get_call_state 4; do sleep 10; done
echo "Ringing on remote site ..." # what the heck,.. no hook=ringing or stuff l$

#echo "play wav file"
#linphonecsh generic "play ${MSGWAV}"

#echo -n "Press any key to terminate the call ... "
#ABORT=false
#while [ "`linphonecsh status hook`" == "" ] && ! ${ABORT}; do
# read -n1 -s -t 1; ABORT=$?
# if [ ${ABORT} -eq 0 ];  then ABORT=true; else ABORT=false; fi
#doney
