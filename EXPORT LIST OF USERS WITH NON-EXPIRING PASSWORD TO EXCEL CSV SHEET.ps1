#################################################################################################################
# 
# Version 1.0 November 2016
# Reginald Johnson 
# Systems Administrator
# Script to EXPORT LIST OF USERS WITH NON-EXPIRING PASSWORD TO EXCEL CSV SHEET
#
# Requires: Windows PowerShell Module for Active Directory
#
#
##################################################################################################################

Search-ADAccount –PasswordNeverExpires -UsersOnly |
Select -Property Name,DistinguishedName |
Export-CSV "C:\Users\admrjohnson\Documents\PasswordNeverExpires.csv" -NoTypeInformation -Encoding UTF8