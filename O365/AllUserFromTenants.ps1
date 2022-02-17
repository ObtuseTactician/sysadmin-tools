## CSV Path
$msolUserCsv = “.\allmspusers.csv”
$mspCustomers = Get-MsolPartnerContract -All
$msolUsers = @()
#Create counters for monitoring of script. 
$x = $mspCustomers.count
$i = 0
ForEach ($Customer in $mspCustomers) {
    Write-Host “Getting users for $($Customer.Name)” -ForegroundColor Yellow
    $i++
    Write-Progress -Id 0 -Activity "Checking for users in $($Customer.Name)" -status "Updated: $i of $x" -PercentComplete (($i / $x) * 100)
    $Users = Get-MsolUser -All -TenantID $customer.tenantID | Where-Object { ($_.IsLicensed -eq "True") -and ($_.UserType -ne "Guest") }
    #Create counters for monitoring of script. 
    $y = $Users.count
    $j = 0
    foreach ($user in $Users) {
        $j++
        Write-Progress -Id 1 -Activity "Found $($Users.Count) in $($Customer.Name). Exporting $($user.DisplayName)" -status "Updated: $j of $y" -PercentComplete (($i / $x) * 100)
        $LicenseStatus = $user.IsLicensed
        $userProperties = @{
            CompanyName   = $Customer.Name
            PrimaryDomain = $Customer.DefaultDomainName
            DisplayName   = $user.DisplayName
            EmailAddress  = $user.UserPrincipalName
            IsLicensed    = $LicenseStatus
        }
        $msolUsers += New-Object psobject -Property $userProperties
    }
    Write-Host ” ” 
}
$msolUsers | Select-Object CompanyName, PrimaryDomain, DisplayName, EmailAddress, IsLicensed | Export-Csv -notypeinformation -Path $msolUserCsv