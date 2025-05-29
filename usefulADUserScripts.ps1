# Check DC

Get-ADUser User -Properties * | Select-Object LockedOut

# Will return False if no. True if yes.


# For unlocking
Unlock-ADAccount -Identity User

# Password resetting

# In progress...
