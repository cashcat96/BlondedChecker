#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: ./pushover <message> [title]"
	exit
fi

MESSAGE=$1
TITLE=$2

if [ $# -lt 2 ]; then
	TITLE="`whoami`@${HOSTNAME}"
fi

APP_TOKEN="YOUR APP TOKEN HERE"
USER_TOKEN="YOUR USER TOKEN HERE"

wget https://api.pushover.net/1/messages.json --post-data="token=$APP_TOKEN&user=$USER_TOKEN&message=$MESSAGE&title=$TITLE" -qO- > /dev/null 2>&1 &
