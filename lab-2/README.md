# TL;DR

This script simulates a **backup** system for a **single** directory.
The script examines the directory for changes, and if any are found, it creates a new copy in the backup location specified by the user.

## How to Use

### Using make

```bash
# to run with makefile
make DIR=. BACKUPDIR=~/.bak INTERVAL-SECS=1 MAX-BACKUPS=3

# to delete BACKUPDIR
make clean BACKUPDIR=YOUR_BACKUP_DIRECTORY
```

### Using backupd.sh

```bash
./backupd DIR BACUPDIR INTERVAL-SECS MAX-BACKUPS
```

## Bonus Part

### Cron Jobs

```text
* * * * * command to be executed
- - - - -
| | | | |
| | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
| | | ------- Month (1 - 12)
| | --------- Day of month (1 - 31)
| ----------- Hour (0 - 23)
------------- Minute (0 - 59)
```

### How to Setup a Crone Job on Linux

1. Insert the following command in the terminal

```bash
crontab -e
```

1. After choosing a suitable text editor(prefering vim if you have experience - nano if you do not - and then you are going to be persented with a text file)
1. Adding the following to the end of the file

```bash
* * * * * /bin/bash SCRIPT_PATH ARGS
```

- ~This is going to run the script every 1 hour at 23rd minute~
- This is going to run the script every 1 minute

### Questions

1. What should be the cron expression if I need to run this backup every 3rd Friday
   of the month at 12:31 am.

```bash
31 0 15-21 * 5 /usr/bash SCRIPT_PATH ARGS
```
