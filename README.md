# Blonded Checker
Hey everybody, here is something that I wrote in the last couple days.  Just a super simple set of three shell scripts that run to check if there have been updates to www.blonded.co.

To schedule this program to run, you will need to edit your crontab ```crontab -e``` to point to the blondedchecker.sh script, and tell crontab how often to run it. An example crontab line (the one I use) is below, which runs the script every five minutes:
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

## Reminders:
- Make sure to change the directories listed at the beginnings of these three scripts so they will run on your computer. Read through the other comments I have made in the code for other information about what does what and how make the code work for your specific use case
- I have taken very few legit coding classes, so I apologize if my code breaks some cardinal coding rules that I am unaware of
- This is my first public github repository and I am fairly new to the ins and outs of github, so bear with me
