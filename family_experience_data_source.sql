SELECT 
	CASE WHEN null IS NULL THEN '2022 - 2023' END AS "application year",
	[athena_to_s3_scholar_data.csv].[appnum] AS "conf",
	[athena_to_s3_scholar_data.csv].[childid],
	[athena_to_s3_scholar_data.csv].[firstname] AS "child first name",
	[athena_to_s3_scholar_data.csv].[lastname] AS "child last name",
	[gender],
	[dateofbirth],
	[athena_to_s3_scholar_data.csv].[isell],
	[enrolledschoolname],
	[athena_to_s3_scholar_data.csv].[enrollverified],
	[athena_to_s3_scholar_data.csv].[istransferring],
	[currentschool],
	[athena_to_s3_enrolled_siblings.csv].[enrolledschoolcode] AS "enrolled sibling school",
	[appdate],
	[uberapplicationlate],
	[applicationstatus],
	[bestcurrentstatus],
	[bestpullstatus],
	[athena_to_s3_scholar_data.csv].[gradeabbrev] AS "entering grade",
	[gradedobmismatch],
	[acceptedschoolcode],
	[acceptedschooladminadded],
	[acceptedschoolrank],
	[currentaccepteddate],
	[firstacceptdate],
	[highestrankschoolname],
	[applyingtoschoolany],
	[appclosedate],
	[closerequest],
	[closerequestdate],
	[importedscholarid],
	[isapplying],
	[isreopened],
	[reopendate],
	[source],
	[uberapplicationlate],
	[athena_to_s3_scholar_data.csv].[familyid],
	[athena_to_s3_scholar_data.csv].[familynum],
	[athena_to_s3_responsible_adults.csv].[responsibleadultid],
	[athena_to_s3_responsible_adults.csv].[firstname] AS "parent first name",
	[athena_to_s3_responsible_adults.csv].[lastname] AS "parent last name",
	[athena_to_s3_family_members.csv].[relationship],
	[athena_to_s3_responsible_adults.csv].[email],
	[athena_to_s3_responsible_adults.csv].[cellphone],
	[athena_to_s3_responsible_adults.csv].[homephone],
	[athena_to_s3_responsible_adults.csv].[workphone],
	[athena_to_s3_responsible_adults.csv].[workext],
	[athena_to_s3_responsible_adults.csv].[street],
	[athena_to_s3_responsible_adults.csv].[apartmentnumber],
	[athena_to_s3_responsible_adults.csv].[borough],
	[athena_to_s3_responsible_adults.csv].[city],
	[athena_to_s3_responsible_adults.csv].[state],
	[athena_to_s3_responsible_adults.csv].[zip],
	[athena_to_s3_responsible_adults.csv].[latitude],
	[athena_to_s3_responsible_adults.csv].[longitude],
	[athena_to_s3_responsible_adults.csv].[schooldistrict],
	CASE WHEN [athena_to_s3_responsible_adults.csv].[zoneerror] = 'TRUE' THEN 1 ELSE 0 END AS 'csd flagged',
	[athena_to_s3_customfields_data.csv].[addressstatus],
	[athena_to_s3_customfields_data.csv].[verbal status confirmation],
	[athena_to_s3_responsible_adults.csv].[rfscompleted], 
	[athena_to_s3_responsible_adults.csv].[rfswatched],
	[athena_to_s3_responsible_adults.csv].[rfsinvited],
	[athena_to_s3_customfields_data.csv].[uniform fitting invited],
	[athena_to_s3_customfields_data.csv].[uniform fitting attended],
	CASE
		WHEN ([gender] LIKE 'Female') THEN CONCAT([athena_to_s3_scholar_data.csv].[appnum], '-SA221')
		WHEN ([gender] LIKE 'Male' AND [athena_to_s3_scholar_data.csv].[gradeabbrev] LIKE 'K') THEN CONCAT([athena_to_s3_scholar_data.csv].[appnum], '-SA222')
		WHEN ([gender] LIKE 'Male' AND [athena_to_s3_scholar_data.csv].[gradeabbrev] NOT LIKE 'K') THEN CONCAT([athena_to_s3_scholar_data.csv].[appnum], '-SA223')
		WHEN (([gender] LIKE 'Prefer not to answer' OR [gender] LIKE 'Non-binary') AND [athena_to_s3_scholar_data.csv].[gradeabbrev] LIKE 'K') THEN CONCAT([athena_to_s3_scholar_data.csv].[appnum], '-SA221', ' or ', [athena_to_s3_scholar_data.csv].[appnum], '-SA222')
		WHEN (([gender] LIKE 'Prefer not to answer' OR [gender] LIKE 'Non-binary') AND ([athena_to_s3_scholar_data.csv].[gradeabbrev] NOT LIKE 'K')) THEN CONCAT([athena_to_s3_scholar_data.csv].[appnum], '-SA221', ' or ', [athena_to_s3_scholar_data.csv].[appnum], '-SA223')
		END AS "Uniform Promo Code",
	[athena_to_s3_customfields_data.csv].[registration invited],
	[athena_to_s3_customfields_data.csv].[registration attended],
	[athena_to_s3_customfields_data.csv].[dress rehearsal invited],
	[athena_to_s3_customfields_data.csv].[dress rehearsal attended],
	[athena_to_s3_customfields_data.csv].[birth certificate],
	[athena_to_s3_customfields_data.csv].[health form],
	[athena_to_s3_customfields_data.csv].[immunization record],
	[athena_to_s3_customfields_data.csv].[proof of residency], 
	[athena_to_s3_responsible_adults.csv].[language],
	[athena_to_s3_customfields_data.csv].[accept_seat_and_decline_wl],
	[athena_to_s3_customfields_data.csv].[accepted_but_wl_open],
	[athena_to_s3_customfields_data.csv].[close request survey],
	[athena_to_s3_customfields_data.csv].[reopen request status],
	[athena_to_s3_customfields_data.csv].[reopen request date],
FROM [CSV1].[athena_to_s3_scholar_data.csv]
LEFT JOIN [CSV1].[athena_to_s3_responsible_adults.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].responsibleadultid = [CSV1].[athena_to_s3_responsible_adults.csv].responsibleadultid 
LEFT JOIN [CSV1].[athena_to_s3_customfields_data.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].childid = [CSV1].[athena_to_s3_customfields_data.csv].childid 
LEFT JOIN [CSV1].[athena_to_s3_family_members.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].familyid = [CSV1].[athena_to_s3_family_members.csv].familyid
LEFT JOIN [CSV1].[athena_to_s3_enrolled_siblings.csv] ON [CSV1].[athena_to_s3_scholar_data.csv].childid = [CSV1].[athena_to_s3_enrolled_siblings.csv].childid
ORDER BY [athena_to_s3_scholar_data.csv].appdate DESC;











