::64 bit version of Windows
reg query HKLM\SOFTWARE\WOW6432Node\TeamViewer /v ClientID

::32 bit version of Windows
reg query HKLM\SOFTWARE\TeamViewer \v ClientID

::Take the value and convert from hex to decimal.