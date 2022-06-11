SELECT
	LEFT([archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].appdate, 10) AS "appdate", 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].appnum AS "Conf Number", 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].applicationstatus, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].gradeabbrev, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].highestrankschoolname, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].applyingtoschoolany, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].utm_source, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].utm_campaign, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].utm_term, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].utm_medium, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].utm_content, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].source, 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].street, 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].city, 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].borough, 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].state, 
	LEFT([archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].zip, 5) AS "zip", 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].schooldistrict, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].acceptedschoolcode, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].currentschool, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].isell AS "ELL grade 1-4", 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].homespeakell AS "ELL grade K", 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].responsibleadultid, 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].firstname AS "parent first name", 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].lastname AS "parent last name", 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].email AS "parent email", 
	[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].cellphone AS "parent cell phone", 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].heardaboutindex, 
	[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].referralsource, 
FROM [CSV1].[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv]
LEFT JOIN [CSV1].[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv]
ON [CSV1].[archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].responsibleadultid = [CSV1].[archived_school_years_athena_to_s3_responsible_adults_2021_2022.csv].responsibleadultid 
ORDER BY [archived_school_years_athena_to_s3_scholar_data_2021_2022.csv].appdate DESC;