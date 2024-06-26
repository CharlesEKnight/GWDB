# GWDB Script
GWDB is a simple script to assist with frequently backing up and restoring h2 databases during the InsuranceSuite configuration process.

## Usage
To Do: Continue Fleshing out usage.

As currently written `gwdb.sh` should be run from within the directory that contains the h2 database files used by your local PolicyCenter server. This may change in the future.

### Creating a Backup of the Current H2 Database

To backup the current H2 database run the following command:
```
gwdb.sh -b
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
gwdb.sh -bt "Some descriptive text"
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
gwdb.sh -l
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
gwdb.sh -r 02212024.0301 
```

#### Example
```
$ ./gwdb.sh -r "02262024.1006 - First Edit"
Restore Backup: 02262024.1006 - First Edit
```

## Installation and Setup
To Do: Update installation with more detailed instructions 

1. Clone this repository to your local machine
2. Optionally, copy `gwdb.sh` to the directory in which you would like it installed
3. Make sure that the installation directory containing `gwdb.sh` is on your system PATH, or add it to the PATH
4. Create a directory where you would like your backups to be stored
5. Update the `backupDirectory` variable in the script with the aboslute path to your backup directory

