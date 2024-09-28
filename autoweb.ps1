# Simple template to automatically open programs/websites and save you a few clicks.

$error.clear()
try {Start-Process -FilePath "FilePath/ApplicatioName.exe" -ArgumentList 'example' 'example'}
catch {'Error occured'}
if (!error) 
{
  Write-Host "[Success!]" -ForegroundColor green
}
else
{
Write-Host "[Failed]" -ForegroundColor red
}

Write-Host "Exiting..."
[Environment]::Exit(1)
