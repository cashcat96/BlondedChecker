#!/bin/sh

# THIS SCRIPT DOES THE WORK OF FIGURING OUT IF THERE HAVE BEEN CHANGES TO THE WEBSITE
# all it does is look at the size of the 'diff' file, and checks to see if it is zero or not.
# if it is zero, that means there have been no changes, and nothing happens.
# if it is not zero, it checks to see if there is new text that says 'Listen to' which would mean there is new music, and it sends a new music notification
# if it is not zero and it doesnt have 'listen to' text, it sends a different notification

diff_file="/home/pi/publicblondedchecker/BlondedChecker/diff"			# store the name of the diff file in diff _file
new_file="/home/pi/publicblondedchecker/BlondedChecker/$(date "+%F-%T")"	# store the name of the new file in new_file

c="$(stat -c%s $diff_file)"		# store the size of the diff file in the variable c

if [ 1 -gt $c ] >/dev/null		# checks to see if the size of 'diff' is zero by seeing if it  is less than 1

then
        echo "there is no website change" >/dev/null		# if the size of diff is zero, this means that there has been no website change ( the >/dev/null suppresses the terminal output)

else
	# if you don't care about differentiating between new music being released and website changes, simply remove everything between the # Channel Orange and # Endless comments, as well as the fi statement right before the # Blonde comment
	# Channel Orange

	if cat $diff_file | grep 'Listen to' >/dev/null		# checks to see if in the difference file there is the text Listen to, meaning there is new music on blonded.co (the >/dev/null suppresses the terminal output)

	then
		echo "FRANK HAS RELEASED NEW MUSIC!!!">/dev/null	# this echo command is just here because their needs to be something after the 'then' statement and before the 'else' statement, but if you add a webhook url below, you can comment this line out
		# if you want to get notified, add webhook commands below to get notified by whatever you want (slack, pushbullet etc.)
		# i have already included below the pushbullet webhook url, just add your pushbullet api token(found in settings online), and you're good to go
		#curl --silent -u """<your pushbullet api token>"":" -d type="note" -d body="Frank has released new music on www.blonded.co!" -d title="Blonded Checker" 'https://api.pushbullet.com/v2/pushes'
	else
	# Endless
		#echo "there has been a website change"		# displays there has been a website change in the terminal, uncomment if you want it to do this
		cp $diff_file $new_file				# copies the diff file to a text file named after the date and time at that moment, preserving it as a log
		# i have already included below the pushbullet webhook url, just add your pushbullet api token(found in settings online), and you're good to go
		#curl --silent -u """<your pushbullet api token>"":" -d type="note" -d body="There has been an update to www.blonded.co!" -d title="Blonded Checker" 'https://api.pushbullet.com/v2/pushes'
	fi # Blonde
fi

# echo 'sizechecker.sh has run'		#uncomment this line to help figure out where problems are occuring
