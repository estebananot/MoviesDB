SELECT 
    p.id AS "ID",
    p.first_name AS "First Name",
    p.last_name AS "Last Name",
    SUM(m.budget) AS "Total Movies Budget"
FROM 
    Characters c
JOIN 
    Person p ON c.person_id = p.id
JOIN 
    Movie m ON c.movie_id = m.id
GROUP BY 
    p.id, p.first_name, p.last_name;
