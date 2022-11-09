#################################################################################################################
# 
# Version 1.5 November 2022
# Reginald Johnson
# Systems Administrator
# Script to EXPORT LIST OF USER ACCOUNTS IN A SPECIFIC OU TO A EXCEL CSV FILE
#
# Requires: Windows PowerShell Module for Active Directory
#"SNUFFY" is just a placeholder as an example
#
##################################################################################################################

Get-ADGroupMember -identity "SNUFFY Applications" -Recursive | select name,objectclass,samaccountname|
Export-CSV "C:\\SNUFFYApplications.csv" -NoTypeInformation -Encoding UTF8
