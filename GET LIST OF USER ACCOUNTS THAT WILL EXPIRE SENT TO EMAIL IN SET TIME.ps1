
#################################################################################################################
# 
# Version 1.0 November 2022
# Reginald Johnson 
# Systems Administrator
# Script to GET LIST OF USER ACCOUNTS THAT WILL EXPIRE SENT TO EMAIL IN SET TIME
#
# Requires: Windows PowerShell Module for Active Directory
# "SNUFFY" is just a placeholder as an example
#
##################################################################################################################

# ----------------
# Define variables
# ----------------

$To = "rjohnson@SNUFFY.com" 
$From = "rjohnson@SNUFFY.com"
$Subject = "Weekly expiring user report"
$Body = "The attached CSV file contains a list of user accounts in the Acorda domain that are due to expire in the next 14 days."
$SMTPServer = "SNUFFY"
$Date = Get-Date -format yyyyMMdd
$ReportName = "C:\\SNUFFY_Expiring_Users_$Date.csv"



GET LIST OF USER ACCOUNTS THAT WILL EXPIRE SENT TO EMAIL

# ------------------------------------------------------------------
# Get list of users from Active Directory that will expire in 7 days
# ------------------------------------------------------------------

$UserList = Search-ADAccount -AccountExpiring -UsersOnly -TimeSpan 7.00:00:00 | Sort-Object -Descending AccountExpirationDate



# -----------------------------------------------
# Send an email using the variables defined above
# -----------------------------------------------

If ($UserList -eq $null){}
Else
{
   $UserList | Export-CSV $ReportName
   Send-MailMessage -To $To -From $From -Subject $Subject -Body $Body -SMTPServer $SMTPServer -Attachments $ReportName