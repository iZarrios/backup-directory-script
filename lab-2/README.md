# TL;DR
This script simulates a <strong>backup</strong> system for a <strong>single</strong> directory.
The script examines the directory for changes, and if any are found, it creates a new copy in the backup location specified by the user.

## How to Use
### Using make
```bash
# to run with default values
make

# to delete BACKUPDIR
make clean
```
| Argument Name |                    Description                    |      Default      |
| ------------- | :-----------------------------------------------: | :---------------: |
| DIR           |         Directory thet will be backed up          | Current directory |
| BACUPDIR      |        Location of the backed up directory        |     `~/.bak`      |
| INTERVAL-SECS | Delay between each scan for any chaanges in `dir` |         1         |
| MAX-BACKUPS   |     Maximum number of backups in `BACKUPDIR`      |         5         |

### Using backupd.sh
```bash
./backupd DIR BACUPDIR INTERVAL-SECS MAX-BACKUPS
```
# Bonus Part
## Cron Jobs
```
* * * * * command to be executed
- - - - -
| | | | |
| | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
| | | ------- Month (1 - 12)
| | --------- Day of month (1 - 31)
| ----------- Hour (0 - 23)
------------- Minute (0 - 59)
```
## How to Setup a Crone Job on Linux
1. Insert the following command in the terminal
```
crontab -e
```
1. After choosing a suitable text editor(prefering vim if you have experience - nano if you do not - and then you are going to be persented with a text file)
1. Adding the following to the end of the file (TO BE CONFIRMED)
```
* * * * * sleep 23; /bin/bash SCRIPT_PATH
```
1. This is going to run the script every 1 minute at 23 second?

### Question:
What should be the cron expression if I need to run this backup every 3rd Friday
of the month at 12:31 am.
### Answer
```
31 12 15-22 * 5 /usr/bash SCRIPT_PATH
```


