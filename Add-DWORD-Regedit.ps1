# An issue came up where I had to manually add a regedit to a certain area in the HKLM Registry.
# So here is a small script to create or change a DWORD value. 
# I used ChatGPT to help build the structuring of the script.

# Define variables
$RegPath = "HKLM:\Path\App"
$ValueName = "Name of value"
$ExpectedValue = 0x00001337 # Hex value for DWORD

# If RegPath does not exist, then create path.
if (-not (Test-Path $RegPath)) {

  New-Item -Path $RegPath -Force | Out-Null 
}

# Error handling logic
try {
  $CurrentValue = Get-ItemProperty -Path $RegPath -Name $ValueName -ErrorAction Stop | Select-Object -ExpandProperty $ValueName
} catch {
  $CurrentValue = $null # DWORD is missing. Therefore, make $CurrentValue NULL.
}

# Compare
if ($null -eq $CurrentValue) {
  # Create as DWORD if missing
  New-ItemProperty -Path $RegPath -Name $ValueName -Value $ExpectedValue -PropertyType DWORD -Force | Out-Null
  Write-Host "Registry value created as DWORD" # $Valuename = $ExpectedValue
}

elseif ($CurrentValue -ne $ExpectedValue) {
# Update existing value if it's not the expected value of Value 0x00001337
Set-ItemProperty -Path $RegPath -Name $ValueName -Value $ExpectedValue
Writte-Host "Registry value updated" # $ValueName = $ExpectedValue
} else {
  Write-Host "Registry value already set correctly"
}
