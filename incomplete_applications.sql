SELECT 
	[athena_to_s3_incomplete_scholars.csv].datecreated,
	[athena_to_s3_incomplete_scholars.csv].responsibleadultemail,
	[athena_to_s3_incomplete_scholars.csv].responsibleadultfirstname,
	[athena_to_s3_incomplete_scholars.csv].source,
	[athena_to_s3_responsible_adults.csv].zip
FROM [CSV1].[athena_to_s3_incomplete_scholars.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv]
ON [CSV1].[athena_to_s3_incomplete_scholars.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [athena_to_s3_incomplete_scholars.csv].source != 'NYC Common App'
ORDER BY [athena_to_s3_incomplete_scholars.csv].datecreated DESC;
