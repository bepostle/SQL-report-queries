SELECT 
	[appnum] AS "Conf",
	CONCAT([appnum], '-SA22') AS "Promo Code",
	[applicationstatus],
	[currentaccepteddate],
	[firstacceptdate],
	[gender],
	[gradeabbrev],
	[athena_to_s3_responsible_adults.csv].[firstname],
	[athena_to_s3_responsible_adults.csv].[lastname],
	[email],
	[email2],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] 
ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
ORDER BY [appnum] DESC;
