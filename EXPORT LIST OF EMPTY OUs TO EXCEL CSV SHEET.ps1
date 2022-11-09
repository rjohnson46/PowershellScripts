#################################################################################################################
# 
# Version 1.0 November 2016
# Reginald Johnson 
# Systems Administrator
# Script to EXPORT LIST OF EMPTY OUs TO EXCEL CSV SHEET
#
# Requires: Windows PowerShell Module for Active Directory
#
#
##################################################################################################################

$all_ou_dns = Get-ADOrganizationalUnit -filter * | % {$_.distinguishedname}

$all_populated_ou_dns = Get-ADObject -Filter "ObjectClass -eq 'user' -or ObjectClass -eq 'computer' -or ObjectClass -eq 'group'" | 
    Where-Object { ($_.DistinguishedName -notlike '*LostAndFound*') -and ($_.DistinguishedName -match 'OU=(.*)')} | 
    ForEach-Object { $matches[0] } | 
    Select-Object -Unique

$all_ou_dns | Where-Object { ($all_unique_populated_ou_dns -notcontains $_) -and !(Get-ADOrganizationalUnit -Filter * -SearchBase $_ -SearchScope 1) } |
Export-CSV "C:\\EmptyOUs.csv" -NoTypeInformation -Encoding UTF8