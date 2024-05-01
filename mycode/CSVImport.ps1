Get-ChildItem -Path 'C:\Users\ecoffey\OneDrive - arbitech.com\csv\Process'| Import-DbaCsv  -SqlInstance 'SVR-BI01\BI' -Database 'BIReporting' -Table 'tblSynnex_insert'
