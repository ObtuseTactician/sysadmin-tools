:: Registry fix for issues caused by modern authentication on Office applications.
:: Issues such as the password prompt not showing or is just a white window. This can usually be resovled by removing connected accounts.
:: If unable to remove connected accounts then adding these keys will make Office to fall back to basic authentication.
:: If MFA is setup you will need to get app password.

reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Identity" /v "EnableADAL" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Identity" /v "DisableADALatopWAMOverride" /t REG_DWORD /d 1 /f
