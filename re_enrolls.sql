SELECT 
	[athena_to_s3_customfields_data.csv]."migratory eSD ID" AS "eSD ID",
	[athena_to_s3_scholar_data.csv].firstname AS "Scholar Firstname",
	[athena_to_s3_scholar_data.csv].lastname AS "Scholar Lastname",
	[athena_to_s3_scholar_data.csv].gradeabbrev AS "OTIS Grade",
	[athena_to_s3_scholar_data.csv].acceptedschoolcode AS "OTIS Accepted School",
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv]
	ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
LEFT JOIN [CSV1].[athena_to_s3_customfields_data.csv]
	ON [CSV1].[athena_to_s3_scholar_data.csv].childid = [CSV1].[athena_to_s3_customfields_data.csv].childid
LEFT JOIN [CSV1].[athena_to_s3_family_members.csv]
	ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_family_members.csv].responsibleadultid
WHERE [athena_to_s3_scholar_data.csv].applicationstatus = 'Accepted'
	AND [athena_to_s3_scholar_data.csv].enrolledschoolname = ''
	AND [athena_to_s3_scholar_data.csv].importedscholarid > 0
ORDER BY [athena_to_s3_scholar_data.csv].acceptedschoolcode, 
	[athena_to_s3_scholar_data.csv].gradeabbrev,
	[athena_to_s3_scholar_data.csv].importedscholarid;