#Will apply mailbox permissions for all users on a particular mailbox
#Gets list of users.
$users = Get-MsolUser -All
# If you only want licesed users use the below
#$users = Get-MsolUser -All | Where-Object { $_.isLicensed -eq $true } | Select -ExpandProperty UserPrincipalName 

#Get a count of both lists and set the int of i to 0 for progress reporting
$x = $users.count
$i = 0
#ID for the progress reporting partent and child item
$Id = 1

#Loop through each user in the first user list
foreach ($user in $users) {
    #Lets us know who we are working on
    Write-Host $user.DisplayName
    #Adds to the int of i
    $i++
    #Writes progress to see who we are working on and how far
    Write-Progress -Id $Id -Activity "Updating mailbox permission on $($user.DisplayName)" -status "Updated: $i of $x" -PercentComplete (($i / $x) * 100)
    # If you want the mailbox to automap change $false to $true.
    add-mailboxpermission -identity $user.UserPrincipalName -user USER -accessrights FullAccess -InheritanceType All -AutoMapping $false
}