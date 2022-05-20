SELECT 
	[athena_to_s3_responsible_adults.csv].responsibleadultid,
	[athena_to_s3_responsible_adults.csv].firstname AS "parent first name",
	[athena_to_s3_responsible_adults.csv].lastname AS "parent last name",
	[athena_to_s3_responsible_adults.csv].email AS "parent email",
	[athena_to_s3_scholar_data.csv].currentaccepteddate,
	[athena_to_s3_scholar_data.csv].appnum AS "Conf Number",
	[athena_to_s3_scholar_data.csv].applicationstatus,
	[athena_to_s3_scholar_data.csv].gradeabbrev,
	[athena_to_s3_scholar_data.csv].acceptedschoolcode,
	[athena_to_s3_scholar_data.csv].firstname AS "child first name",
	[athena_to_s3_scholar_data.csv].lastname AS "child last name",
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [athena_to_s3_scholar_data.csv].applicationstatus = 'Accepted'
AND [gradeabbrev] = '4'
ORDER BY [athena_to_s3_scholar_data.csv].currentaccepteddate DESC;
