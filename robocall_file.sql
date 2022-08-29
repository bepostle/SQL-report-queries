SELECT 
	[athena_to_s3_scholar_data.csv].[appnum] AS "conf",
	[athena_to_s3_scholar_data.csv].[firstname] AS "child first name",
	[athena_to_s3_scholar_data.csv].[lastname] AS "child last name",
	[enrolledschoolname],
	LEFT([athena_to_s3_scholar_data.csv].[appdate], 10) AS "appdate",
	[applicationstatus],
	CASE
		WHEN [gradeabbrev] = 'K' THEN '0'
		ELSE [gradeabbrev]
		END AS "entering grade",
	[gradeabbrev] AS "entering grade 2",
	[highestrankschoolname],
	[athena_to_s3_responsible_adults.csv].[responsibleadultid],
	[athena_to_s3_responsible_adults.csv].[firstname] AS "parent first name",
	[athena_to_s3_responsible_adults.csv].[lastname] AS "parent last name",
	[athena_to_s3_responsible_adults.csv].[email],
	[athena_to_s3_responsible_adults.csv].[cellphone],
	[athena_to_s3_responsible_adults.csv].[homephone],
	[athena_to_s3_responsible_adults.csv].[workphone],
	[athena_to_s3_responsible_adults.csv].[workext],
	[athena_to_s3_responsible_adults.csv].[language],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid 
LEFT JOIN [CSV1].[athena_to_s3_customfields_data.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].childid = [CSV1].[athena_to_s3_customfields_data.csv].childid 
/* LEFT JOIN [CSV1].[athena_to_s3_family_members.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].familyid = [CSV1].[athena_to_s3_family_members.csv].familyid */
/* LEFT JOIN [CSV1].[athena_to_s3_enrolled_siblings.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].childid = [CSV1].[athena_to_s3_enrolled_siblings.csv].childid */
WHERE [enrolledschoolname] = ''
AND [applicationstatus] = 'Complete'
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;