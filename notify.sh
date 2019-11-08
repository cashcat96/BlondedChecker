#!/bin/bash

# put whatever notifications you want to send yourself here
# This command is run by ./notify.sh "whatever you want to say in your notification"
# that argument (your notification phrase) will be passed into any notification agent by putting $1 into the message box
# I have included pre-built notification scripts for pushbullet and pushover that you need to add user keys and/or api keys to get them working

#curl --silent -u """api key"":" -d type="note" -d body="$1" -d title="Blonded Checker" 'https://api.pushbullet.com/v2/pushes'     #pushbullet notification

#./pushover.sh "$1 $(curl -F "file=@diff.txt" https://file.io)" "Blonded Alerts"	# sends notification via pushover with the link to the change file (edit the pushover.sh file with you app and user token)
