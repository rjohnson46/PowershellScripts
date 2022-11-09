#################################################################################################################
# 
# Version 1.0 November 2016
# Reginald Johnson 
# Systems Administrator
# Script to EXPORT LIST OF DISABLED USERS TO EXCEL CSV SHEET
#
# Requires: Windows PowerShell Module for Active Directory
#
#
##################################################################################################################

Search-ADAccount –AccountDisabled -UsersOnly |
Select -Property Name,DistinguishedName |
Export-CSV "C:\\DisabledADUsers.csv" -NoTypeInformation -Encoding UTF8