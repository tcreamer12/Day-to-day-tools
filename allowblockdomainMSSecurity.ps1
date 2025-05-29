# This is a very common ticket that comes in which is to block an email domain for possible phishing attempt.

# To add/block through powershell you must sign in to your Tenant through ExchangeOnline.

New-TenantAlllowBlockListItems -ListType Sender -Block -Entries "attackerdomain.net", "attacker@attackerdomain.net" -Expiration Date -NoExpiration [-Notes "Reported phishing attempt"]
