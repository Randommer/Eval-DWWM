$dir = "C:\laragon\bin\mysql\mysql-8.0.21-winx64"
$user = "root"
$password = ""
$ddb = "gescom"
$backup = "C:\Backup"

$date = Get-Date -uformat "%Y-%m-%d_%Hh%M"


Start-Process -FilePath "$dir\bin\mysqldump.exe" -ArgumentList "--user=$user", "--password=$password", "--databases $ddb", "--routines", "--triggers" -RedirectStandardOutput "$backup\backup_$ddb_$date.sql"
