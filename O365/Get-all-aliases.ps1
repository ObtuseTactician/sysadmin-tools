$users = Get-Mailbox -ResultSize Unlimited | Select-Object DisplayName, @{Name = ”EmailAddresses”; Expression = { $_.EmailAddresses | Where-Object { $_ -LIKE “SMTP:*” } } } | Sort

$groups = Get-UnifiedGroup | Select-Object DisplayName, @{Name = ”EmailAddresses”; Expression = { $_.EmailAddresses | Where-Object { $_ -LIKE “SMTP:*” } } } | Sort

#If you need to export to CSV add | Export-Csv <location>