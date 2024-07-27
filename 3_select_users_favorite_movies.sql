SELECT 
    u.id AS "ID",
    u.username AS "Username",
    JSON_ARRAYAGG(f.movie_id) AS "Favorite Movie IDs"
FROM 
    User u
JOIN 
    UserFavoriteMovies f ON u.id = f.user_id
GROUP BY 
    u.id, u.username;
