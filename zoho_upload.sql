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
	[athena_to_s3_responsible_adults.csv].firstname AS parentfirstname,
	[athena_to_s3_responsible_adults.csv].lastname AS parentlastname,
	[athena_to_s3_responsible_adults.csv].email,
	[athena_to_s3_responsible_adults.csv].email2,
	[athena_to_s3_responsible_adults.csv].cellphone,
	[athena_to_s3_responsible_adults.csv].homephone,
	[athena_to_s3_responsible_adults.csv].workphone,
	[athena_to_s3_responsible_adults.csv].workphoneext,
	[athena_to_s3_responsible_adults.csv].street,
	[athena_to_s3_responsible_adults.csv].apartmentnumber,
	[athena_to_s3_responsible_adults.csv].city,
	[athena_to_s3_responsible_adults.csv].state,
	[athena_to_s3_responsible_adults.csv].zip,
	[athena_to_s3_responsible_adults.csv].borough,
	[athena_to_s3_responsible_adults.csv].latitude,
	[athena_to_s3_responsible_adults.csv].longitude,
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
