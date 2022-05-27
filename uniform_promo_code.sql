SELECT 
	[appnum] AS "Conf",
	CASE
		WHEN ([gender] LIKE 'Female') THEN CONCAT([appnum], '-SA221')
		WHEN ([gender] LIKE 'Male' AND [gradeabbrev] LIKE 'K') THEN CONCAT([appnum], '-SA222')
		WHEN ([gender] LIKE 'Male' AND [gradeabbrev] NOT LIKE 'K') THEN CONCAT([appnum], '-SA223')
		WHEN (([gender] LIKE 'Prefer not to answer' OR [gender] LIKE 'Non-binary') AND [gradeabbrev] LIKE 'K') THEN CONCAT([appnum], '-SA221', ' or ', [appnum], '-SA222')
		WHEN (([gender] LIKE 'Prefer not to answer' OR [gender] LIKE 'Non-binary') AND ([gradeabbrev] NOT LIKE 'K')) THEN CONCAT([appnum], '-SA221', ' or ', [appnum], '-SA223')
		END AS "Promo Code",
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
	[athena_to_s3_responsible_adults.csv].[language],
	[athena_to_s3_scholar_data.csv].[firstname] AS "Child_First_Name",
	[athena_to_s3_scholar_data.csv].[lastname] AS "Child_Last_Name",
	[enrolledschoolname],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] 
ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [enrolledschoolname] LIKE ''
ORDER BY [appnum] DESC;
