set dir=C:\laragon\bin\mysql\mysql-8.0.21-winx64\
set user=root
set password=
set backup=C:\Backup\
set file=backup_gescom.sql

%dir%bin\mysql --user=%user% --password=%password% < %backup%%file%