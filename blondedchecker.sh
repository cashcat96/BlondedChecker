#!/bin/bash

PATH1="/path/to/cashcat96/BlondedChecker" # path where you have https://github.com/cashcat96/BlondedChecker cloned

PATH2="/path/to/jacobtender/blondedchecker"  # path where you have https://github.com/jacobtender/blondedchecker cloned

cd $PATH2

python3 productpuller.py > cps	# current product status (cps) gets calculated inside jacob's repo

cp cps $PATH1

cd $PATH1

diff cps pps > diff	# calculates difference between current product status and previous product status

c="$(stat -c%s diff)"           # store the size of the diff file in the variable c


if [ 1 -gt $c ] >/dev/null              # checks to see if the size of 'diff' is zero by seeing if it  is less than 1

then

        echo "there is no website change" >/dev/null            # if the size of diff is zero, this means that there has been no website change

else
	echo "there has been a website change" >/dev/null               # displays there has been a website change in the terminal, and sends notifications below
	sed '1s/^/THIS IS THE CURRENT STATUS\n/' cps > appendedcps	# adds lines to the beginning of the files to tell which one is old and which one is new
	sed '1s/^/THIS IS THE OLD STATUS\n/' pps > appendedpps		# adds lines to the beginning of the files to tell which one is old and which one is new
	diff -y appendedcps appendedpps > diff.txt	# make difference file
	sleep 1		# pause for one second (solved some problem i had)
	./notify.sh "We noticed a change to blonded.co! We will update you further if anything of note has happened"    # uses the new notify.sh to update whatever agents you have in the notify.sh file

fi

mv cps pps	# moves the current products status file to the previous product status file, to check later

# echo "blondedchecker.sh has run"
