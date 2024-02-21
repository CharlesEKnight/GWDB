# GWDB Script
GWDB is a simple script to assist with frequently backing up and restoring h2 databases during the InsuranceSuite configuration process.

## Usage
To Do: Continue Fleshing out usage.

### Creating a Backup of the Current H2 Database

To backup the current H2 database run the following command:
```
gwdb -b
```
This will create a copy of pc.mv.db and pc.trace.db and the configured backup directory. A directory will be created here using the date and time as the file name and the two files will be stored inside of it.

#### Example
```
$ ./gwdb.sh -b
Creating Backup...
Completed.
```

To add a useful description to the file name you can use the `-t` flag: 
```
gwdb -bt "Some descriptive text"
```
#### Example
```
$ ./gwdb.sh -bt "Before my big changes"
Creating Backup...
Completed.
```
This will create a folder named using the date and time, as above, with your description
added as a suffix.

### Listing Backups

You can list all of the backups in your backup directory using the `-l` flag:
```
gwdb -l
```

#### Example
```
$ ./gwdb.sh -l
-- Existing Backups --
'02212024.0301 - Before my big changes'
02212024.0301
```

### Restoring Backups
Backups can be restored using the `-r` flag. The `-r` flag requires the backup folder of the backup you wish to restore as an argument:
```
gwdb -r 02212024.0301 
```

#### Example
To Do: Add example after feature is implemented.

## Installation
To Do: Determine installation instructions

## Setup
To Do: Determine setup instructions
