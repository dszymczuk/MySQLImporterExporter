# MySQLImporterExporter
Simple script to import or export databases from MySQL.

Preparing:
-------
In script you have to change host, user and password. Also you can change file name.



Export:
-------

> ./mysqlimex.sh export db1,db2 /mysql/backup verbose

Import:
-------

> ./mysqlimex.sh import db1 /mysql/backup/db1.sql verbose
