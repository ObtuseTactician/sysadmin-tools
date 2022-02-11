net stop "Sage 50 Accounts Control v26"
net stop "Sage 50 Accounts Service v26"
net stop "Sage AutoUpdate Manager Service"
net stop "Sage AutoUpdate Manager Service v2"
net stop "Sage SData Service 2.0"

cd C:\ProgramData\Sage\Accounts\<YEAR>\<COMPANY>\ACCDATA\

del /q/s/f USERNAME*

net start "Sage 50 Accounts Control v26"
net start "Sage 50 Accounts Service v26"
net start "Sage AutoUpdate Manager Service"
net start "Sage AutoUpdate Manager Service v2"
net start "Sage SData Service 2.0"