# MySQLImporterExporter
Simple script to import or export databases from MySQL.

Preparing:
-------
In script you have to change host, user and password. Also you can change file name.

Parameters to provide:
-------
* action (import,export) 
* DBs name 
* pathToExport/partToImportFile 
* verbose(optional)

Remember call params flow:
-------
> nameScript whatIWantToDo WhichDatabeses WhereTo/WhereFrom ShowOutput

Export example:
-------
```sh
./mysqlimex.sh export db1,db2 /mysql/backup verbose
```
Import example:
-------
```sh
./mysqlimex.sh import db1 /mysql/backup/db1.sql verbose
```
