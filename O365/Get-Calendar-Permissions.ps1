#Output file declaration 
$ExportCSV = ".\Calendar_Permissions_$((Get-Date -format yyyy-MMM-dd-ddd` hh-mm` tt).ToString()).csv" 

$UserCount = 0 
$PrintedUser = 0 

#Loop through each user 
Get-MsolUser -All | foreach { 
    $UserCount++ 
    $DisplayName = $_.DisplayName 
    $Upn = $_.UserPrincipalName 
    Write-Progress -Activity "`n     Processed user count: $UserCount "`n"  Currently Processing: $DisplayName" 

    $CalendarPermissions = ""
    $Permissions = ""
    $Result = ""   
    $Results = @()

    
    if ($_.BlockCredential -eq "True") {  
        $SignInStatus = "False" 
    } 
    else { 
        $SignInStatus = "True" 
    }

    $Permissions = Get-MailboxFolderPermission -identity ("" + $Upn + ":\Calendar")

    foreach ($CalendarUser in $Permissions) {
        $CalendarPermissions += $CalendarUser.User.DisplayName + " = " + $CalendarUser.AccessRights + ";    "
    }

    #Print to output file 
    $PrintedUser++ 
    $Result = @{'DisplayName' = $DisplayName; 'UserPrincipalName' = $upn; 'SignInStatus' = $SigninStatus; 'LicenseStatus' = $_.IsLicensed; 'CalendarPermissions' = $CalendarPermissions }  
    $Results = New-Object PSObject -Property $Result  
    $Results | Select-Object DisplayName, UserPrincipalName, SignInStatus, LicenseStatus, CalendarPermissions | Export-Csv -Path $ExportCSV -Notype -Append 
}