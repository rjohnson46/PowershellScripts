#################################################################################################################
# 
# Version 1.0 November 2016
# Reginald Johnson 
# Systems Administrator
# Script to EXPORT LIST OF INACTIVE ACCOUNTS TO EXCEL CSV SHEET
#
# Requires: Windows PowerShell Module for Active Directory
#
#
##################################################################################################################

Search-ADAccount –UsersOnly –AccountInactive | Get-ADuser -Properties Department,Title | Sort LastLogOnDate | Select Name,Department,Title,DistinguishedName | 
Export-CSV "C:\Users\admrjohnson\Documents\ListInactiveAccounts.csv" -NoTypeInformation -Encoding UTF8