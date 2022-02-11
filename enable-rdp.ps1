# Enable RDP
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0

# Firewall Rule
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"