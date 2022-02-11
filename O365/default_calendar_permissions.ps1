#Get a list of all users that have a license
$users = Get-MsolUser -All | Where-Object { $_.isLicensed -eq $true } | Select -ExpandProperty UserPrincipalName 

#Create counters for monitoring of script. 
$x = $users.count
$i = 0
#ID for the progress reporting partent and child item
$Id = 1

#Show us how many users we have to work on.
Write-Host "Total nunber of licensed users $users.count"

#Loop through each user in the first user list
foreach ($user in $users) {
    #Lets us know who we are working on
    Write-Host $user
    #Adds to the int of i
    $i++
    #Writes progress to see who we are working on and how far
    Write-Progress -Id $Id -Activity "Updating the default calendar permissions for $($user)" -status "Updated: $i of $x" -PercentComplete (($i / $x) * 100)

    set-mailboxfolderpermission -identity ("" + $user + ":\Calendar") -user Default -accessrights Reviewer
}