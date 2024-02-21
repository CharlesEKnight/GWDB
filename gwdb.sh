#!/bin/bash

backupDirectory="./testBackupDir"
dbFileName="pc.mv.db"
traceFileName="pc.trace.db"

print_usage(){
  printf "USAGE INFO / HELP IS WORK IN NOT FINALIZED"
  printf "Usage: gwdb.sh -b[t <tag info>]|l|r|h"
}

create_backup(){
  timestamp=$(date +'%m%d%Y.%I%M')
  backupName=${timestamp}

  if [ "${tagValue}" ] ; then
    backupName="${timestamp} - ${tagValue}"
  fi
  
  echo "Creating Backup..."
  mkdir "${backupDirectory}"/"${backupName}"
  cp "${dbFileName}" "${backupDirectory}/${backupName}/${dbFileName}"
  cp "${traceFileName}" "${backupDirectory}/${backupName}/${traceFileName}"
  echo "Completed."
}

list_backups(){
  echo "-- Existing Backups --"
  ls -t1 ${backupDirectory}
}

restore_backup(){
  echo "Not yet implemented!!!"
  echo "Restore Backup: ${restoreTarget}"
}


while getopts "bt:lr:h" flag;
do
  case ${flag} in
    b) backupJob=true ;;
    t) tagValue="${OPTARG}";;
    l) listJob=true;;
    r) restoreJob=true
       restoreTarget="${OPTARG}";;
    h) print_usage
       exit 0 ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [ -n "${tagValue}" -a -z "${backupJob}" ] ; then
  echo "Error: -t flag can not be used without -b flag"
  exit 1
fi

if [ "${backupJob}" = true ] ; then
  create_backup
fi

if [ "${listJob}" = true ] ; then
  list_backups
fi

if [ "${restoreJob}" = true ] ; then
  restore_backup
fi

exit 0
