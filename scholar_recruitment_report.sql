SELECT 
	[appdate],
	[appnum],
	[applicationstatus],
	[gradeabbrev],
	[highestrankschoolname],
	[bestcurrentstatus],
	[source],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
WHERE [applicationstatus] != 'Closed - Duplicate' AND
[applicationstatus] != 'Closed - Ineligible' AND 
[applicationstatus] != 'Closed - Test App' AND 
[applicationstatus] != 'Closed - No Proof' AND
[applicationstatus] != 'Closed - Mistakenly Applied'
ORDER BY [appdate];
