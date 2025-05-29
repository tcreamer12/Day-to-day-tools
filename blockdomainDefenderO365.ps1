# This is a very common ticket that comes in which is to block an email domain for possible phishing attempt.

# To add/block through powershell you must sign in to your Tenant through ExchangeOnline.

New-TenantAlllowBlockListItems -ListType Sender -Block -Entries "attackerdomain.net", "attacker@attackerdomain.net" -NoExpiration -Notes "Reported phishing attempt"


# This is what I usually use, but there are lots of different options on how to block and allow a domain:
# https://learn.microsoft.com/en-us/defender-office-365/tenant-allow-block-list-email-spoof-configure?view=o365-worldwide
