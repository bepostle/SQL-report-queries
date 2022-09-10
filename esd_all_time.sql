SELECT DISTINCT s.idnumber, s.firstname, s.lastname, s.email, sc.otis_id, s.gender, s.dateofbirth, s2.name, s.grade, s.ispreregistered, s.enrollment_status, s.dateentereddistrict, s.enrollmentdate
FROM ioe_ext.students s 
LEFT JOIN ioesd.student_container sc ON s.id = sc.student_id
LEFT JOIN ioesd.school s2 ON s.schoolid = s2.id
ORDER BY s.lastname , s.firstname