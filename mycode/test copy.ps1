Set-DbaSpConfigure -SqlInstance localhost\MSSQLSERVER -Name RemoteDacConnectionsEnabled -Value 1
Set-DbaSpConfigure -SqlInstance localhost\MSSQLSERVER -Name CostThresholdForParallelism -Value 10