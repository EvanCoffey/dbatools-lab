
# Create database users
New-DbaDbUser -SqlInstance localhost\MSSQLSERVER -Login WWI_ReadOnly -Database WideWorldImporters -Confirm:$false
New-DbaDbUser -SqlInstance localhost\MSSQLSERVER -Login WWI_ReadWrite -Database WideWorldImporters -Confirm:$false
New-DbaDbUser -SqlInstance localhost\MSSQLSERVER -Login WWI_Owner -Database WideWorldImporters -Confirm:$false

# Add database role members
Add-DbaDbRoleMember -SqlInstance localhost\MSSQLSERVER -Database WideWorldImporters -User WWI_Readonly -Role db_datareader
Add-DbaDbRoleMember -SqlInstance localhost\MSSQLSERVER -Database WideWorldImporters -User WWI_ReadWrite -Role db_datawriter
Add-DbaDbRoleMember -SqlInstance localhost\MSSQLSERVER -Database WideWorldImporters -User WWI_Owner -Role db_owner

# Create some SQL Server Agent jobs
$job = New-DbaAgentJob -SqlInstance localhost\MSSQLSERVER -Job 'dbatools lab job' -Description 'Creating a test job for our lab'
New-DbaAgentJobStep -SqlInstance localhost\MSSQLSERVER -Job $Job.Name -StepName 'Step 1: Select statement' -Subsystem TransactSQL -Command 'Select 1'

# add second job
$job = New-DbaAgentJob -SqlInstance localhost\MSSQLSERVER -Job 'dbatools lab - where am I' -Description 'Creating test2 job for our lab'
New-DbaAgentJobStep -SqlInstance localhost\MSSQLSERVER -Job $Job.Name -StepName 'Step 1: Select servername' -Subsystem TransactSQL -Command 'Select @@ServerName'


# Restore-DbaDatabase -SqlInstance localhost\MSSQLSERVER -path 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\WideWorldImporters-Full.bak'