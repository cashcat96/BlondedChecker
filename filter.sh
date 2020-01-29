#!/bin/sh

# THIS SCRIPT FILTERS OUT LINES THAT CHANGE FREQUENTLY ON BLONDED.CO
# if you find another line that comes up constantly, simply add another line, using the other lines as  examples

sed -i '/android/d' index.html
sed -i '/favicon/d' index.html
sed -i '/index.js/d' index.html
sed -i '/ms-icon/d' index.html
sed -i '/themeCityHash/d' index.html
sed -i '/token/d' index.html
sed -i '/reqid/d' index.html
sed -i '/Token/d' index.html
sed -i '/sha256/d' index.html
sed -i '/font/d' index.html
sed -i '/apple-touch/d' index.html
sed -i '/og:/d' index.html	#the og: has to deal with what displays in the browser as the name of the site

#echo "the filter script has run"
