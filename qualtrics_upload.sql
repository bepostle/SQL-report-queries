SELECT
	[athena_to_s3_scholar_data.csv].[appnum] AS "ExternalDataReference",
	[athena_to_s3_responsible_adults.csv].[firstname] AS "FirstName",
	[athena_to_s3_responsible_adults.csv].[lastname] AS "LastName",
	[athena_to_s3_responsible_adults.csv].[email] AS "Email",
	CASE
			WHEN ([language] LIKE 'English') THEN 'EN'
			WHEN ([language] LIKE 'Español') THEN 'ES'
			END AS "Language",
	[athena_to_s3_scholar_data.csv].[childid] AS "ChildID",
	[athena_to_s3_responsible_adults.csv].[firstname] AS "Parent First Name",
	[athena_to_s3_responsible_adults.csv].[lastname] AS "Parent Last Name",
	[athena_to_s3_responsible_adults.csv].[email] AS "Parent Email",
	[athena_to_s3_responsible_adults.csv].[homephone] AS "Primary Phone",
	[athena_to_s3_responsible_adults.csv].[cellphone] AS "Cell Phone",
	[athena_to_s3_scholar_data.csv].[appnum] AS "Conf Number",
	[athena_to_s3_scholar_data.csv].[enrolledschoolname] AS "Enrolled School",
	[athena_to_s3_responsible_adults.csv].[schooldistrict] AS "School District",
	[athena_to_s3_scholar_data.csv].[lastname] AS "Child Last Name",
	[athena_to_s3_scholar_data.csv].[firstname] AS "Child First Name",
	[athena_to_s3_scholar_data.csv].[gradeabbrev] AS "Entering Grade",
	LEFT([athena_to_s3_scholar_data.csv].[appdate], 10) AS "Application Date",
	[athena_to_s3_scholar_data.csv].[isell] AS "ELL",
	[athena_to_s3_responsible_adults.csv].[street] AS "Street",
	[athena_to_s3_responsible_adults.csv].[workext] AS "Work ext",
	[athena_to_s3_responsible_adults.csv].[workphone] AS "Work Phone",
	[athena_to_s3_responsible_adults.csv].[city] AS "City",
	[athena_to_s3_responsible_adults.csv].[apartmentnumber] AS "Street 2",
	[athena_to_s3_responsible_adults.csv].[state] AS "State",
	[athena_to_s3_responsible_adults.csv].[borough] AS "Parent Borough",
	[athena_to_s3_responsible_adults.csv].[zip] AS "Zip",
	[athena_to_s3_scholar_data.csv].[highestrankschoolname] AS "Highest Rank School",
	[athena_to_s3_responsible_adults.csv].[responsibleadultid] AS "Responsible Adult ID",
	[athena_to_s3_scholar_data.csv].[applicationstatus] AS "Application Status",
	LEFT([athena_to_s3_scholar_data.csv].[firstacceptdate], 10) AS "First Accepted Date",
	[athena_to_s3_scholar_data.csv].[acceptedschoolcode] AS "Accepted School",
	[athena_to_s3_scholar_data.csv].[applyingtoschoolany] AS "Applying to School (Rank)",
	[athena_to_s3_scholar_data.csv].[acceptedschoolrank] AS "Accepted School Rank",
	[athena_to_s3_scholar_data.csv].[firstengageddate] AS "First Engaged Date",
	[athena_to_s3_scholar_data.csv].[uberapplicationlate] AS "Is Late",
	[athena_to_s3_scholar_data.csv].[bestpullstatus] AS "Best Pull Status",
	[athena_to_s3_scholar_data.csv].[bestcurrentstatus] AS "Best Current Status",
	[athena_to_s3_responsible_adults.csv].[rfscompleted] AS "RFS Completed",
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid
LEFT JOIN [CSV1].[athena_to_s3_customfields_data.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].childid = [CSV1].[athena_to_s3_customfields_data.csv].childid
LEFT JOIN [CSV1].[athena_to_s3_family_members.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_family_members.csv].responsibleadultid
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;