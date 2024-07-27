SELECT 
    m.id AS "ID",
    m.title AS "Title",
    m.release_date AS "Release Date",
    m.duration AS "Duration",
    m.description AS "Description",
    JSON_OBJECT('file_name', f.file_name, 'url', f.url) AS "Poster",
    JSON_OBJECT('id', d.id, 'first_name', d.first_name, 'last_name', d.last_name) AS "Director"
FROM 
    Movie m
JOIN 
    File f ON m.poster_file_id = f.id
JOIN 
    Person d ON m.director_id = d.id
JOIN 
    MovieGenre mg ON m.id = mg.movie_id
JOIN 
    Genre g ON mg.genre_id = g.id
WHERE 
    m.country_id = 1 
    AND m.release_date >= '2022-01-01'
    AND m.duration > 135
    AND (g.name = 'Action' OR g.name = 'Drama');
