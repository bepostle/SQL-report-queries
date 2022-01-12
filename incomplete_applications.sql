SELECT 
	[athena_to_s3_incomplete_scholars.csv].datecreated,
	[athena_to_s3_incomplete_scholars.csv].responsibleadultemail,
	[athena_to_s3_incomplete_scholars.csv].responsibleadultfirstname,
	[athena_to_s3_incomplete_scholars.csv].source,
	[athena_to_s3_responsible_adults.csv].zip
FROM [athena_to_s3_incomplete_scholars.csv]
WHERE [athena_to_s3_incomplete_scholars.csv].source != 'NYC Common App' 
LEFT JOIN [athena_to_s3_responsible_adults.csv]
ON [athena_to_s3_incomplete_scholars.csv].responsibleadultid = [athena_to_s3_responsible_adults.csv].responsibleadultid
ORDER BY [athena_to_s3_incomplete_scholars.csv].datecreated DESC;