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

### Using backupd.sh
```bash
./backupd DIR BACUPDIR INTERVAL-SECS MAX-BACKUPS
```

| Argument Name |                    Description                    |      Default      |
| ------------- | :-----------------------------------------------: | :---------------: |
| DIR           |         Directory thet will be backed up          | Current directory |
| BACUPDIR      |        Location of the backed up directory        |     `~/.bak`      |
| INTERVAL-SECS | Delay between each scan for any chaanges in `dir` |         1         |
| MAX-BACKUPS   |     Maximum number of backups in `BACKUPDIR`      |         5         |


# Bonus Part

