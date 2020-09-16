$dir = "C:\laragon\bin\mysql\mysql-8.0.21-winx64"
$user = "root"
$password = ""
$file = $args[0]
$backup = "C:\Backup"


Start-Process -FilePath "$dir\bin\mysql.exe" -ArgumentList "--user=$user", "--password=$password" -RedirectStandardInput "$backup\$file"
