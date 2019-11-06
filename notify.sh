#!/bin/bash

# put whatever notifications you want to send yourself here
# This command is run by ./notify.sh "whatever you want to say in your notification"
# that argument (your notification phrase) will be passed into any notification agent by putting $1 into the message box

curl --silent -u """api key"":" -d type="note" -d body="$1" -d title="Blonded Checker" 'https://api.pushbullet.com/v2/pushes'     #pushbullet notification
