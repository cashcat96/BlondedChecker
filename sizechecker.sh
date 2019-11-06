#!/bin/sh

# THIS SCRIPT DOES THE WORK OF FIGURING OUT IF THERE HAVE BEEN CHANGES TO THE WEBSITE
# all it does is look at the size of the 'diff' file, and checks to see if it is zero or not.
# if it is zero, that means there have been no changes, and nothing happens.
# if it is not zero, it sends a notification to whatever you set up in notify.xh (twitter, discord, pushbullet, pushover)
# this also checks if the word product shows up in the diff file, and it changes what notification this script will send

c="$(stat -c%s diff)"		# store the size of the diff file in the variable c

if [ 1 -gt $c ] >/dev/null		# checks to see if the size of 'diff' is zero by seeing if it  is less than 1

then
        echo "there is no website change" >/dev/null		# if the size of diff is zero, this means that there has been no website change
else
	if cat diff | grep product >/dev/null

	then
		echo "There has been a product-related change" >/dev/null	# displays there has been a website change in the terminal, and sends notifications below
		./notify.sh "We noticed a product-related change to blonded.co! We will update you further if anything of note has happened"	# uses notify.sh to send notifications
	else
		echo "there has been a website change" >/dev/null		# displays there has been a website change in the terminal, and sends notifications below
		./notify.sh "We noticed a change to blonded.co! We will update you further if anything of note has happened"	#uses notify.sh to send notifications
	fi

	cp diff $(date "+%F-%T")		 # copies the diff file to a text file named after the date and time at that moment, preserving it as a log

fi

#echo "sizechecker.sh has run"
