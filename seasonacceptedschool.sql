SELECT [appnum], [applicationstatus], [acceptedschoolcode], [gradeabbrev], LEFT([currentaccepteddate], 10), LEFT([firstacceptdate], 10), [bestpullstatus], [allacceptedschools],
CASE
  WHEN [acceptedschoolcode] = '' AND CHARINDEX(',', [allacceptedschools]) > 0
  THEN RTRIM(LEFT([allacceptedschools], CHARINDEX(',', [allacceptedschools])))
  WHEN [acceptedschoolcode] = '' AND CHARINDEX(',', [allacceptedschools]) < 0
  THEN COALESCE(NULLIF([acceptedschoolcode],''), [allacceptedschools])
  ELSE [acceptedschoolcode]
  END AS "seasonacceptedschoolcode",
CASE 
  WHEN [acceptedschoolrank] = 0
  THEN '1'
  ELSE [acceptedschoolrank]
  END AS "acceptedschoolrank",
  [childid],
FROM [CData].[CSV1].[athena_to_s3_scholar_data.csv]
WHERE [firstacceptdate] IS NOT NULL
  AND [enrolledschoolname] = ''
  ORDER BY [firstacceptdate] DESC;