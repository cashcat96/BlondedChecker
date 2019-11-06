#!/bin/sh

# THIS SCRIPT FILTERS OUT LINES THAT CHANGE FREQUENTLY ON BLONDED.CO
# if you find another line that comes up constantly, simply add another line, using the other lines as  examples

sed -i '/token/d' index.html	# remove all lines with the word 'token' in them
sed -i '/reqid/d' index.html	# remove all lines with the word 'reqid' in them
sed -i '/Token/d' index.html	# remove all lines with the word 'Token' in them
sed -i '/sha256/d' index.html   # remove all lines with the word 'sha256' in them

#echo "the filter script has run"
