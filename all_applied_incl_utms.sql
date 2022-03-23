SELECT 
	[athena_to_s3_scholar_data.csv].appdate,
	[athena_to_s3_scholar_data.csv].childid,
	[athena_to_s3_responsible_adults.csv].email,
	[athena_to_s3_scholar_data.csv].applicationstatus,
	[athena_to_s3_scholar_data.csv].utm_source,
	[athena_to_s3_scholar_data.csv].utm_campaign,
	[athena_to_s3_scholar_data.csv].utm_term,
	[athena_to_s3_scholar_data.csv].utm_medium,
	[athena_to_s3_scholar_data.csv].utm_content,
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] 
ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;
