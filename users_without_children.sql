SELECT 
	[datecreated], 
	[email], 
	[firstname]
FROM `athena_to_s3_users_without_children.csv` ORDER BY datecreated DESC;
