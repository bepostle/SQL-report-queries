SELECT 
	appdate,
	appnum,
	applicationstatus,
	acceptedschoolcode,
	gradeabbrev,
	childid,
	enrolledschoolname,
	reopendate,
	[athena_to_s3_scholar_data.csv].responsibleadultid,
	[athena_to_s3_responsible_adults.csv].email,
	utm_source,
	utm_campaign,
	utm_term,
	utm_medium,
	utm_content,
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] 
ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;
