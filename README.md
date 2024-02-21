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

To add a useful description to the file name you can use the `-t` argument: 
```
gwdb -bt "Some descriptive text"
```
This will create a folder named using the date and time, as above, with your description
added as a suffix.

## Installation
To Do: Determine installation instructions

## Setup
To Do: Determine setup instructions
