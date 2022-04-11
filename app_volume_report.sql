SELECT 
	[athena_to_s3_scholar_data.csv].appdate,
	[athena_to_s3_scholar_data.csv].appnum,
	[athena_to_s3_scholar_data.csv].applicationstatus,
	[athena_to_s3_scholar_data.csv].gradeabbrev,
	[athena_to_s3_scholar_data.csv].highestrankschoolname,
	[athena_to_s3_scholar_data.csv].bestcurrentstatus,
	[athena_to_s3_scholar_data.csv].utm_source,
	[athena_to_s3_scholar_data.csv].utm_campaign,
	[athena_to_s3_scholar_data.csv].utm_term,
	[athena_to_s3_scholar_data.csv].utm_medium,
	[athena_to_s3_scholar_data.csv].utm_content,
	[athena_to_s3_scholar_data.csv].source, 
	LEFT([athena_to_s3_responsible_adults.csv].zip, 5) AS "zip"
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Duplicate' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Ineligible' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Test App' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - No Proof' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Mistakenly Applied'
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;
