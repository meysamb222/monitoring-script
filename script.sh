#!/bin/bash

SERVER="URL_TO_MONITOR"
SMS_API="SMS_WEBHOOK_URL"


alerting(){
while [ $status -ne 200 ]
do   curl "$SMS_API,down" && echo "sms-down sent"  && status=$(curl -L -o /dev/null --silent --head --write-out '%{http_code}\n' $SERVER) && if [ $status -eq 200 ]; then curl "$SMS_API,up-again" && echo "sms-up-again sent"; fi
	sleep 600
done
}




while true
do
status=$(curl -L -o /dev/null --silent --head --write-out '%{http_code}\n' $SERVER)
if [ $status -eq 200 ]
then 
	echo "$SERVER is up"
elif [ $status -ne 200 ]
then echo "$SERVER is down"
	if [ $status -ne 200 ]
	then alerting
	fi
fi
sleep 180
done
