SELECT 
	[athena_to_s3_scholar_data.csv].[appnum] AS "conf",
	[athena_to_s3_scholar_data.csv].[childid],
	[athena_to_s3_scholar_data.csv].[firstname] AS "child first name",
	[athena_to_s3_scholar_data.csv].[lastname] AS "child last name",
	[applicationstatus],
	LEFT([athena_to_s3_scholar_data.csv].[appdate], 10) AS "appdate",
	LEFT([athena_to_s3_scholar_data.csv].[appclosedate], 10) AS "appclosedate",
	[reopendate],
	[highestrankschoolname],
	[applyingtoschoolany],
	[gradeabbrev],
	CASE
		WHEN [gradeabbrev] = 'K' THEN '0'
		ELSE [gradeabbrev]
		END AS "gradeabbrev2",
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
WHERE [enrolledschoolname] = ''
	AND [applicationstatus] LIKE 'Closed%'
	AND [applicationstatus] != 'Closed - Mistakenly Applied'
	AND [applicationstatus] != 'Closed - Duplicate'
	AND [applicationstatus] != 'Closed - Ineligible'
	AND [applicationstatus] != 'Closed - No Proof'
	AND [applicationstatus] != 'Closed - Test App'
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;