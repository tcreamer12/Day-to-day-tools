# CHeck Netework interface metrics

Get-DnsClient | Select-Object InterfaceAlias, InterfaceIndex, ConnectionSpecificSuffix

Get-NetIPInterface | Sort-Object InterfaceMetric | Format-Table InterfaceAlias, InterfaceIndex, Address Family, InterfaceMetric
