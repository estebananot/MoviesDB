SELECT 
    d.id AS "Director ID",
    CONCAT(d.first_name, ' ', d.last_name) AS "Director Name",
    AVG(m.budget) AS "Average Budget"
FROM 
    Movie m
JOIN 
    Person d ON m.director_id = d.id
GROUP BY 
    d.id, d.first_name, d.last_name;
