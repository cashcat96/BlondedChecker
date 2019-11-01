#!/bin/sh

# This is the main script that runs, it references filter.sh and sizechecker.sh

# CHANGE THIS NEXT LINE:
cd /home/pi/BlondedChecker			# moves into the directory where all the rest of the scripts are (change this so it works with your system)

#rm index.html	# if you want to make sure there isn't already an index.html file, uncomment this line

wget https://blonded.co		# get index.html from the website

./filter.sh         # run filter script, removing dumb lines that trip this program (edit this script as problems come up)

diff -c prev.index.html index.html > diff	# record difference between previous index.html and just gotten one

mv index.html prev.index.html		# set recent html to the old one, to check later

./sizechecker.sh		# run sizechecker script, to check if there has been a website change and notify me

# you can add a webhook url here if you want to get notified by slack, pushbullet ,etc. every time the script runs
# echo 'the main script has run'	# uncomment this line to troubleshoot where problems are occuring
