SELECT 
	[athena_to_s3_scholar_data.csv].childid,
	[athena_to_s3_scholar_data.csv].applicationstatus,
	[athena_to_s3_scholar_data.csv].uniformfittingattended,
	[athena_to_s3_scholar_data.csv].highestrankschoolname,
	[athena_to_s3_scholar_data.csv].enrolledschoolname,
	[athena_to_s3_scholar_data.csv].enrollverified,
	[athena_to_s3_scholar_data.csv].gradedobmismatch,
	[athena_to_s3_customfields_data.csv]."dob/grade mismatch verified",
	[athena_to_s3_scholar_data.csv].responsibleadultid,
	[athena_to_s3_family_members.csv].relationship,
	[athena_to_s3_responsible_adults.csv].zoneerror,
	[athena_to_s3_customfields_data.csv]."address status"
FROM [athena_to_s3_scholar_data.csv]
LEFT JOIN [athena_to_s3_responsible_adults.csv] 
ON [athena_to_s3_scholar_data.csv].responsibleadultid = [athena_to_s3_responsible_adults.csv].responsibleadultid
LEFT JOIN [athena_to_s3_customfields_data.csv]
ON [athena_to_s3_scholar_data.csv].childid = [athena_to_s3_customfields_data.csv].childid
LEFT JOIN [athena_to_s3_family_members.csv]
ON [athena_to_s3_scholar_data.csv].responsibleadultid = [athena_to_s3_family_members.csv].responsibleadultid
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;