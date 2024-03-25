#!/bin/bash

backupDirectory="./testBackupDir"
dbFileName="pc.mv.db"
traceFileName="pc.trace.db"

declare -a backups

print_usage(){
  printf "USAGE INFO / HELP IS NOT FINALIZED"
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

get_array_of_backups(){
  shopt -s nullglob
  backups=("${backupDirectory}"/*/)
  shopt -u nullglob
}

list_backups(){
  echo "-- Existing Backups --"
  # ls -t1 ${backupDirectory}
  get_array_of_backups
  for i in "${!backups[@]}"; do
    echo "${i}) ${backups[$i]}"
  done
}

restore_backup(){
  if [ -n "${restoreTarget}" ] ; then
    echo "Restore Backup: ${restoreTarget}"
    # cp "${backupDirectory}/${restoreTarget}/${dbFileName}" "${dbFileName}"
    # cp "${backupDirectory}/${restoreTarget}/${traceFileName}" "${traceFileName}" 
  fi
}

restore_backup_interactive(){
  echo "-- Interactive Backup --"
  echo "   Function not yet fully implemented"
  echo ""

  list_backups
  read -p "Select restore: " restoreSelection
  restoreTarget="${backups[$restoreSelection]}"
  restore_backup
}


while getopts "bt:lrR:h" flag;
do
  case ${flag} in
    b) backupJob=true ;;           # Backup
    t) tagValue="${OPTARG}";;      # Optional tag value when creating backup
    l) listJob=true;;              # List backup
    r) restoreJob=true;;           # Interactive restore
    R) restoreJob=true             # Restore
       restoreTarget="${OPTARG}";;
    h) print_usage                 # Help / Print usage
       exit 0 ;;
    *) print_usage                 # Everything else / Usage errors
       exit 1 ;;
  esac
done

if [ -n "${tagValue}" ] && [ -z "${backupJob}" ] ; then
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
  if [ "${restoreTarget}" ] ; then
    restore_backup
    exit 0
  fi

  restore_backup_interactive
fi

exit 0
