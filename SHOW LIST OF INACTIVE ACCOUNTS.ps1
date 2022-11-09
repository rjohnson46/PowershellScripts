#################################################################################################################
# 
# Version 1.0 November 2016
# Reginald Johnson 
# Systems Administrator
# Script to SHOW LIST OF INACTIVE ACCOUNTS
#
# Requires: Windows PowerShell Module for Active Directory
#
#
##################################################################################################################

Search-ADAccount –UsersOnly –AccountInactive | Get-ADuser -Properties Department,Title | Sort LastLogOnDate | Select Name,Department,Title,DistinguishedName 