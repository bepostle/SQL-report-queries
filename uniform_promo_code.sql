SELECT 
	[appnum] AS "Conf",
	CONCAT([appnum], '-SA22') AS "Promo Code",
	[applicationstatus],
	[currentaccepteddate],
	[firstacceptdate],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [applicationstatus] = 'Accepted'
ORDER BY [appnum] DESC;