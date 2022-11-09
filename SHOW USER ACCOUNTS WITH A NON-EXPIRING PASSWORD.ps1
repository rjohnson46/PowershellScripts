#################################################################################################################
# 
# Version 1.0 November 2022
# Reginald Johnson 
# Systems Administrator
# Script to SHOW USER ACCOUNTS WITH A NON-EXPIRING PASSWORD
#
# Requires: Windows PowerShell Module for Active Directory
#
#
##################################################################################################################

Search-ADAccount -PasswordNeverExpires | FT Name,  ObjectClass, UserPrincipalName