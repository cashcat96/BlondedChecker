#!/bin/sh

# THIS IS THE MAIN SCRIPT THAT RUNS, IT REFERENCES filter.sh and sizechecker.sh

cd /your/project/directory/here	# change this to the base directory where all this program's scripts are stored

#rm index.html	# if you want to make sure there isn't already an index.html file, uncomment this line

wget https://blonded.co		# get the html from the website

./filter.sh         # run filter script, removing dumb lines that trip this program (edit this script as problems come up)

diff -c prev.index.html index.html > diff	# record difference between previous index.html and just gotten one

mv index.html prev.index.html		# set recent html to the old one, to check later

./sizechecker.sh		# run sizechecker script, to check if there has been a website change and notify me

#echo "blondedchecker.sh has run"
