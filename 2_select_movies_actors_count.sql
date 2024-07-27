SELECT 
    m.id AS "ID",
    m.title AS "Title",
    COUNT(c.id) AS "Actors Count"
FROM 
    Movie m
JOIN 
    Characters c ON m.id = c.movie_id
WHERE 
    m.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY 
    m.id, m.title;
