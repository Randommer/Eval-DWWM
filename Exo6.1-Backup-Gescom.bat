set dir=C:\laragon\bin\mysql\mysql-8.0.21-winx64\
set user=root
set password=
set ddb=gescom
set backup=C:\Backup\

%dir%bin\mysqldump --user=%user% --password=%password% --databases %ddb% > %backup%backup_%ddb%.sql