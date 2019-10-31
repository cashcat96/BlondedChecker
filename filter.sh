#!/bin/sh

# THIS SCRIPT FILTERS OUT LINES THAT CHANGE FREQUENTLY ON BLONDED.CO
# if you find another line that comes up constantly, simply add another line, using the other lines as  examples

operable_indexhtml="/home/pi/publicblondedchecker/BlondedChecker/index.html"		# set the path to index.html, so we can remove troublesome lines

sed -i '/token/d' $operable_indexhtml	# remove all lines with the word 'token' in them
sed -i '/reqid/d' $operable_indexhtml	# remove all lines with the word 'reqid' in them
sed -i '/Token/d' $operable_indexhtml	# remove all lines with the word 'Token' in them

#echo 'filter.sh has run'	# uncomment this line to help figure out where problems are occuring
