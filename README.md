# Movie Database

This repository contains the database structure for a movie application. It includes the ER diagram, the SQL files to create the tables and the required queries.

## ER diagram

Below is the ER diagram of the database. You can find the image in the root folder of the repository.

![ER Diagram](DER.JPG)

## Database Structure

### Tables and Relationships

The database includes the following tables:

- **User**: Stores information about users.
- **File**: Stores information about files.
- **Country**: Stores information about countries.
- **Person**: Stores information about people.
- **Movie**: Stores information about movies.
- **Genre**: Stores information about movie genres.
- **MovieGenre**: Intermediate table for the many-to-many relationship between movies and genres.
- **Characters**: Stores information about the characters in the movies.
- **UserFavoriteMovies**: Stores users' favorite movies.

### SQL Files

In the root folder of the repository, you will find the following SQL files:

- `create_tables.sql`: Contains the DDL statements to create all the tables.
- `1_select_actors_budget.sql`: Query to select a list of actors along with the total budget of the films in which they have appeared.
- `2_select_movies_actors_count.sql`: Query to select movies released in the last 5 years with the number of actors who have appeared in each movie.
- `3_select_users_favorite_movies.sql`: Query to retrieve a list of all users along with their favorite movies as an array of identifiers.
- `4_select_directors_average_budget.sql`: Query to select directors along with the average budget of the films they have directed.
- `5_select_movies_with_criteria.sql`: Query to select detailed information about movies that meet certain criteria.
- `6_select_movie_with_id_1.sql`: Query to select detailed information about a movie with ID 1.

## Creation of the database

To create the database, follow these steps:

1. Connect to your MySQL server.
2. Run the file `create_tables.sql` to create all the necessary tables.
