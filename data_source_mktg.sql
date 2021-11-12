SELECT 
	[athena_to_s3_scholar_data.csv].appdate,
	[athena_to_s3_scholar_data.csv].applicationstatus,
	[athena_to_s3_scholar_data.csv].childid,
	[athena_to_s3_scholar_data.csv].isopen,
	[athena_to_s3_scholar_data.csv].source, 
	[athena_to_s3_responsible_adults.csv].zip,
	[athena_to_s3_scholar_data.csv].utm_source,
	[athena_to_s3_scholar_data.csv].utm_campaign,
	[athena_to_s3_scholar_data.csv].utm_term,
	[athena_to_s3_scholar_data.csv].utm_medium,
	[athena_to_s3_scholar_data.csv].utm_content,
FROM [athena_to_s3_scholar_data.csv]
LEFT JOIN [athena_to_s3_responsible_adults.csv] ON [athena_to_s3_scholar_data.csv].responsibleadultid = [athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Duplicate' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Ineligible' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Test App' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - No Proof' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Mistakenly Applied'
ORDER BY [athena_to_s3_scholar_data.csv].appdate;
