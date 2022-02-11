Add-VpnConnection -Name "NAME" -ServerAddress "IP OR HOSTNAME" -TunnelType L2TP -L2tpPsk "PRE-SHARED KEY" -Force -AuthenticationMethod pap -EncryptionLevel "Optional" -RememberCredential $True
Set-VpnConnection -Name "NAME" -SplitTunneling $false -force
