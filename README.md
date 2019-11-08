# Blonded Checker
Hey everybody, here is something that I wrote in a couple days.  Just a super simple set of three shell scripts that run to check if there have been updates to www.blonded.co.

To get this up and running on your system, you only need to do two things:
1. In blondedchecker.sh, edit ```PATH1``` and ```PATH2``` so that they give the paths to where you cloned this repository and where you cloned https://github.com/jacobtender/blondedchecker
2. To schedule this program to run, you will need to edit your crontab ```crontab -e``` to point to the blondedchecker.sh script, and tell crontab how often to run it. An example crontab line (the one I use) is below, which runs the script every five minutes:
```
*/5 * * * * /home/pi/blondedchecker/blondedchecker.sh
```
To help figure out other frequencies to run the script, check out https://crontab.guru

## Some exciting news
We now have a twitter account that gets automatically updated using this script, so you don't have to install this for yourself. Check it out! https://twitter.com/blondedalerts (we are still ironing out some bugs with the twitter account, so it is still under active development)

## Super Simple Install Tutorial on Linux
- Install git ```sudo apt install git```
- Make a directory where you want to house the project ```mkdir <name your directory>```
- Enter that directory ```cd <name of your directory>```
- Clone the project so you have all the files ```git clone git@github.com:cashcat96/BlondedChecker.git``` or ```git clone https://github.com/cashcat96/BlondedChecker.git```
- Enter the project folder ```cd BlondedChecker```
- Get your current directory path ```pwd``` and copy that directory
- Open blondedchecker.sh ```nano blondedchecker.sh``` and change ```PATH1``` by pasting in the path you copied in the previous step
  - Do the same with https://github.com/jacobtender/blondedchecker except edit ```PATH2``` to the location of where you cloned his repo
- Add the script to your crontab ```crontab -e``` and add ```*/5 * * * * /your/path/to/blondedchecker.sh``` (with your computer's specific directory) to the end of the file
  - this will run the script every 5 minutes
  - feel free to change the interval by referencing www.crontab.guru
- You can test if the scripts run by running the command ```/your/path/to/blondedchecker.sh```
- You should be good to go!

## Reminders:
- I have taken very few legit coding classes, so I apologize if my code breaks some cardinal coding rules that I am unaware of
- This is my first public github repository and I am fairly new to the ins and outs of github, so bear with me
- As always, have fun and be grateful that you are alive at the same time as Frank Ocean
