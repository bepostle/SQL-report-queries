SELECT 
	LEFT([athena_to_s3_scholar_data.csv].appdate, 10) AS "appdate",
	[athena_to_s3_scholar_data.csv].appnum AS "Conf Number",
	[athena_to_s3_scholar_data.csv].applicationstatus,
	[athena_to_s3_scholar_data.csv].gradeabbrev,
	[athena_to_s3_scholar_data.csv].highestrankschoolname,
	[athena_to_s3_scholar_data.csv].bestcurrentstatus,
	[athena_to_s3_scholar_data.csv].utm_source,
	[athena_to_s3_scholar_data.csv].utm_campaign,
	[athena_to_s3_scholar_data.csv].utm_term,
	[athena_to_s3_scholar_data.csv].utm_medium,
	[athena_to_s3_scholar_data.csv].utm_content,
	[athena_to_s3_scholar_data.csv].source, 
	LEFT([athena_to_s3_responsible_adults.csv].zip, 5) AS "zip",
	[athena_to_s3_responsible_adults.csv].street,
	[athena_to_s3_responsible_adults.csv].city,
	[athena_to_s3_responsible_adults.csv].borough,
	[athena_to_s3_responsible_adults.csv].state,
	[athena_to_s3_responsible_adults.csv].schooldistrict,
	[athena_to_s3_scholar_data.csv].acceptedschoolcode,
	[athena_to_s3_scholar_data.csv].firstname AS "child first name",
	[athena_to_s3_scholar_data.csv].lastname AS "child last name",
	[athena_to_s3_scholar_data.csv].gender,
	[athena_to_s3_scholar_data.csv].dateofbirth,
	[athena_to_s3_scholar_data.csv].currentschool,
	[athena_to_s3_scholar_data.csv].applyingtoschoolany,
	[athena_to_s3_responsible_adults.csv].responsibleadultid,
	[athena_to_s3_responsible_adults.csv].firstname AS "parent first name",
	[athena_to_s3_responsible_adults.csv].lastname AS "parent last name",
	[athena_to_s3_responsible_adults.csv].email AS "parent email",
	[athena_to_s3_responsible_adults.csv].cellphone AS "parent cell phone",
	[athena_to_s3_scholar_data.csv].referralsource,
	[athena_to_s3_scholar_data.csv].heardaboutindex,
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
WHERE [athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Duplicate' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Ineligible' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Test App' AND 
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - No Proof' AND
[athena_to_s3_scholar_data.csv].applicationstatus != 'Closed - Mistakenly Applied'
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;
