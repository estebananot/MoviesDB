SELECT 
    m.id AS "ID",
    m.title AS "Title",
    m.release_date AS "Release Date",
    m.duration AS "Duration",
    m.description AS "Description",
    JSON_OBJECT('file_name', f.file_name, 'url', f.url) AS "Poster",
    JSON_OBJECT('id', d.id, 'first_name', d.first_name, 'last_name', d.last_name, 'photo', JSON_OBJECT('file_name', pf.file_name, 'url', pf.url)) AS "Director",
    JSON_ARRAYAGG(JSON_OBJECT('id', p.id, 'first_name', p.first_name, 'last_name', p.last_name, 'photo', JSON_OBJECT('file_name', pp.file_name, 'url', pp.url))) AS "Actors",
    JSON_ARRAYAGG(JSON_OBJECT('id', g.id, 'name', g.name)) AS "Genres"
FROM 
    Movie m
JOIN 
    File f ON m.poster_file_id = f.id
JOIN 
    Person d ON m.director_id = d.id
JOIN 
    File pf ON d.primary_photo_file_id = pf.id
JOIN 
    Characters c ON m.id = c.movie_id
JOIN 
    Person p ON c.person_id = p.id
JOIN 
    File pp ON p.primary_photo_file_id = pp.id
JOIN 
    MovieGenre mg ON m.id = mg.movie_id
JOIN 
    Genre g ON mg.genre_id = g.id
WHERE 
    m.id = 1
GROUP BY 
    m.id, m.title, m.release_date, m.duration, m.description, f.file_name, f.url, d.id, d.first_name, d.last_name, pf.file_name, pf.url;
