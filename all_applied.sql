SELECT
	[athena_to_s3_scholar_data.csv].responsibleadultid,
	[email],
	[appnum],
	[applicationstatus],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv]
ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
ORDER BY [appnum] DESC;
