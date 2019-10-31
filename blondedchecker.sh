#!/bin/sh

# THIS IS THE MAIN SCRIPT THAT RUNS, IT REFERENCES filter.sh and sizechecker.sh
# CHANGE THE operable_directory to the directory in which you have this project

operable_directory="/home/pi/publicblondedchecker/BlondedChecker/"			# change this to the base directory where all this program's scripts are stored(with the last "/" included in the path

#rm index.html	# if you wnat to make sure there isn't already an index.html file, uncomment this line

wget https://blonded.co -O $operable_directory"index.html"	# get the html from the website

$operable_directory"filter.sh"         # run filter script, removing dumb lines that trip this program (edit this script as problems come up)

diff -c $operable_directory"prev.index.html" $operable_directory"index.html" > $operable_directory"diff"	# record difference between previous index.html and just gotten one

mv $operable_directory"index.html" $operable_directory"prev.index.html"		# set recent html to the old one, to check later

$operable_directory"sizechecker.sh"		# run sizechecker script, to check if there has been a website change and notify me

# you can add a webhook url here if you want to get notified by slack, pushbullet ,etc. every time the script runs
# echo 'the main script has run'	# uncomment this line to troubleshoot where problems are occuring
