# Quick little script to remove users from a machine's local admin group except the ones you want to keep on each device.
# Honestly you could just create a GPO for this, but I wanted to do it with PS.

Get-LocalGroupMember -Group "Administrators" | Where-Object {$_.myName -ne "$env:computername\user" -and $_.myName -ne "domain\name"} 
| Remove-LocalGroupMember -Group Administrators -ErrorAction SilentlyContinue


# Need to check?
# Invoke-Command -ComputerName hostname -ScriptBlock {Get-LocalGroupMember -Group Administrators}
