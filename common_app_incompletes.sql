SELECT 
	[athena_to_s3_incomplete_scholars.csv].datecreated,
	athena_to_s3_incomplete_scholars.csv].firstname,
	athena_to_s3_incomplete_scholars.csv].gradeabbrev,
	athena_to_s3_incomplete_scholars.csv].responsibleadultfirstname,
	athena_to_s3_incomplete_scholars.csv].responsibleadultgeneratedpassword,
	athena_to_s3_incomplete_scholars.csv].responsibleadultemail,
	athena_to_s3_incomplete_scholars.csv].source 
FROM [athena_to_s3_incomplete_scholars.csv] 
WHERE source = 'NYC Common App' AND responsibleadultgeneratedpassword != '' 
ORDER BY datecreated DESC;