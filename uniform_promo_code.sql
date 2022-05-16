SELECT 
	[appnum] AS "Conf",
	CONCAT([appnum], '-SA22') AS "Promo Code",
	[applicationstatus],
	[currentaccepteddate],
	[firstacceptdate],
	[gender],
	[gradeabbrev] AS "Grade",
	[athena_to_s3_responsible_adults.csv].[firstname] AS "Guardian_First_Name",
	[athena_to_s3_responsible_adults.csv].[lastname] AS "Guardian_Last_Name",
	[email] AS "Guardian_Primary_Email",
	[email] AS "Guardian_Email1",
	[email2] AS "Guardian_Email2",
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] 
ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
ORDER BY [appnum] DESC;
