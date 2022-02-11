$UsageLocationNonGB = Get-MsolUser | Where UsageLocation -ne GB

foreach ($UsageLocationUser in $UsageLocationNonGB) {
    Set-MsolUser -UserPrincipalName $UsageLocationUser.UserPrincipalName –UsageLocation GB
}

$PreferredLanguageNonGB = Get-MsolUser | Where PreferredLanguage -ne 'en-GB'

foreach ($PreferredLanguageUser in $PreferredLanguageNonGB) {
    Set-MsolUser -UserPrincipalName $PreferredLanguageUser.UserPrincipalName –PreferredLanguage 'en-GB'
}