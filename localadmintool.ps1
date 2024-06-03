# Quick little script to remove users from the local admin group except the ones you want to keep.

Get-LocalGroupMember -Group "Administrators" | Where-Object {$_.myName -ne "$env:computername\user" -and $_.myName -ne "domain\name"} 
| Remove-LocalGroupMember -Group Administrator -ErrorAction SilentlyContinue
