SELECT 
	[appdate],
	[appnum],
	[applicationstatus],
	[gradeabbrev],
	[highestrankschoolname],
	[bestcurrentstatus],
	[source],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Duplicate' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Ineligible' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Test App' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - No Proof' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Mistakenly Applied'
ORDER BY [athena_to_s3_scholar_data.csv].appdate;