#!/bin/bash
############################################################
#
# Author Damian Szymczuk
# GitHub: https://github.com/dszymczuk/MySQLImporterExporter
# Site http://dszymczuk.pl
# Script File name: mysqlimex.sh
#
############################################################


### Set parameters from terminal
action=$1
databases=$2
path=${3%/}
verbose=$4

### Set variables
host='localhost'
user='user'
password='password'

NOW=$(date +"%m-%d-%Y-%H:%M")
fileName='_'"$NOW"'_mysqlDump.sql'


if [ "$action" == 'export' ] 
	then
	IFS=', ' read -a dbsArray <<< $databases
	

	if [ "$verbose" == 'verbose' ]
		then
		for db in "${dbsArray[@]}"
		do
		    mysqldump --verbose --host=$host --user=$user --password=$password --databases $db > $path/"$db"$fileName
		done

		else
		for db in "${dbsArray[@]}"
		do
			echo "Exporting: $db"
		    mysqldump --host=$host --user=$user --password=$password --databases $db > $path/"$db"$fileName
		done
	fi

	echo -e "Export completed !"
	exit;
fi

if [ "$action" == 'import' ] 
	then

	if [ "$verbose" == 'verbose' ]
		then
		mysql --verbose --user=$user --password=$password $databases < $path
		else
		mysql --user=$user --password=$password $databases < $path
	fi

	echo -e "Import completed !"
	exit;
fi

echo -e '\nCheck all options in call script.
To run you need provide parameters:
* action (import,export) 
* DBs name 
* pathToExport/partToImportFile 
* verbose(optional)\n
Example export: ./mysqlimex.sh export db1,db2 /mysql/backup verbose
Example import: ./mysqlimex.sh import db1 /mysql/backup/db1.sql verbose\n'
exit;
