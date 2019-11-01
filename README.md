# Blonded Checker
Hey everybody, here is something that I wrote in the last couple days.  Just a super simple set of three shell scripts that run to check if there have been updates to www.blonded.co.

To get this up and running on your system, you only need to do two things:
1. In blondedchecker.sh, edit ```change/this/directory``` so that it is the location of the directory in which the scripts are located
2. To schedule this program to run, you will need to edit your crontab ```crontab -e``` to point to the blondedchecker.sh script, and tell crontab how often to run it. An example crontab line (the one I use) is below, which runs the script every five minutes:
```
*/5 * * * * /home/pi/blondedchecker/blondedchecker.sh
```
To help figure out other frequencies to run the script, check out https://crontab.guru
## There are three important scripts:
- blondedchecker.sh
  - This the main script that downloads the new index.html for blonded.co, calculates the difference between it and a previous index.html and calls the other two scripts
- filter.sh
  - This removes lines that I have relalized change often on blonded.co (mainly lines that include tokens)
- sizechecker.sh
  - checks to see if there have been any changes between older and newer versions of blonded.co, and takes care of when and how you will be notified of those changes

## Super Simple Install Tutorial on Linux
- Install git ```sudo apt install git```
- Make a directory where you want to house the project ```mkdir <name your directory>```
- Enter that directory ```cd <name of your directory>```
- Clone the project so you have all the files ```git clone git@github.com:cashcat96/BlondedChecker.git``` or ```git clone https://github.com/cashcat96/BlondedChecker.git```
- Enter the project folder ```cd BlondedChecker```
- Get your current directory path ```pwd``` and copy that directory
- Open blondedchecker.sh ```nano blondedchecker.sh``` and change ```change/this/directory``` by pasting in the path you copied in the previous step
- Add the script to your crontab ```crontab -e``` and add ```*/5 * * * * /your/path/to/blondedchecker.sh``` (with your computer's specific directory) to the end of the file
  - this will run the script every 5 minutes
  - feel free to change the interval by referencing www.crontab.guru
- You can test if the scripts run by running the command ```./your/path/to/blondedchecker.sh```
- You should be good to go!

## Reminders:
- I have taken very few legit coding classes, so I apologize if my code breaks some cardinal coding rules that I am unaware of
- This is my first public github repository and I am fairly new to the ins and outs of github, so bear with me
