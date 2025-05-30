# Quick little script to remove users from a machine's local admin group except the ones excplicitly stated.
# Honestly you could just create a GPO for this, but I wanted to do it with PS.

Get-LocalGroupMember -Group "Administrators" | Where-Object {$_.myName -ne "$env:computername\user" -and $_.myName -ne "domain\name"} 
| Remove-LocalGroupMember -Group Administrators -ErrorAction SilentlyContinue

# local accounts must be $env:computername\accountName
# domain accounts must be domain\domainAccount

# Need to check?
# Invoke-Command -ComputerName hostname -ScriptBlock {Get-LocalGroupMember -Group Administrators}
