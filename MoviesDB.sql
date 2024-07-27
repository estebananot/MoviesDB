DROP DATABASE IF EXISTS MovieDB;
CREATE DATABASE MovieDB;
USE MovieDB;

-- File table
CREATE TABLE File (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(50) NOT NULL,
    file_key VARCHAR(255) NOT NULL UNIQUE,
    url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Country table
CREATE TABLE Country (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Person table
CREATE TABLE Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT,
    date_of_birth DATE,
    gender ENUM('male', 'female', 'other', 'BOEING-AH-64-APACHE'),
    country_id INT,
    primary_photo_file_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES Country(id) ON DELETE SET NULL,
    FOREIGN KEY (primary_photo_file_id) REFERENCES File(id) ON DELETE SET NULL
);

-- Movie table
CREATE TABLE Movie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    budget DECIMAL(15,2),
    release_date DATE,
    duration INT,
    country_id INT,
    director_id INT,
    poster_file_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES Country(id) ON DELETE SET NULL,
    FOREIGN KEY (director_id) REFERENCES Person(id) ON DELETE SET NULL,
    FOREIGN KEY (poster_file_id) REFERENCES File(id) ON DELETE SET NULL
);

-- Genre table
CREATE TABLE Genre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- MovieGenre table
CREATE TABLE MovieGenre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES Movie(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genre(id) ON DELETE CASCADE
);

-- Characters table
CREATE TABLE Characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    role ENUM('leading', 'supporting', 'background') NOT NULL,
    movie_id INT NOT NULL,
    person_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES Movie(id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES Person(id) ON DELETE SET NULL
);

-- User table
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar_file_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (avatar_file_id) REFERENCES File(id) ON DELETE SET NULL
);

-- UserFavoriteMovies table
CREATE TABLE UserFavoriteMovies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movie(id) ON DELETE CASCADE
);

-- Data

INSERT INTO Country (name) VALUES
('United States'),
('Canada'),
('United Kingdom'),
('Australia'),
('France');

INSERT INTO File (file_name, mime_type, file_key, url) VALUES
('avatar1.jpg', 'image/jpeg', 'avatar1.jpg', 'http://example.com/avatar1.jpg'),
('avatar2.jpg', 'image/jpeg', 'avatar2.jpg', 'http://example.com/avatar2.jpg'),
('poster1.jpg', 'image/jpeg', 'poster1.jpg', 'http://example.com/poster1.jpg'),
('poster2.jpg', 'image/jpeg', 'poster2.jpg', 'http://example.com/poster2.jpg'),
('photo1.jpg', 'image/jpeg', 'photo1.jpg', 'http://example.com/photo1.jpg'),
('photo2.jpg', 'image/jpeg', 'photo2.jpg', 'http://example.com/photo2.jpg');

INSERT INTO Person (first_name, last_name, biography, date_of_birth, gender, country_id, primary_photo_file_id) VALUES
('John', 'Doe', 'Biography of John Doe.', '1980-05-20', 'male', 1, 5),
('Jane', 'Smith', 'Biography of Jane Smith.', '1990-07-15', 'female', 2, 6),
('Alice', 'Johnson', 'Biography of Alice Johnson.', '1975-12-05', 'female', 3, NULL),
('Bob', 'Brown', 'Biography of Bob Brown.', '1985-02-20', 'male', 4, NULL),
('Charlie', 'Davis', 'Biography of Charlie Davis.', '1995-03-30', 'BOEING-AH-64-APACHE', 5, NULL);

INSERT INTO User (username, first_name, last_name, email, password, avatar_file_id) VALUES
('johndoe', 'John', 'Doe', 'john.doe@example.com', 'password1', 1),
('janesmith', 'Jane', 'Smith', 'jane.smith@example.com', 'password2', 2),
('alicejohnson', 'Alice', 'Johnson', 'alice.johnson@example.com', 'password3', NULL),
('bobbrown', 'Bob', 'Brown', 'bob.brown@example.com', 'password4', NULL),
('charliedavis', 'Charlie', 'Davis', 'charlie.davis@example.com', 'password5', NULL);

INSERT INTO Movie (title, description, budget, release_date, duration, country_id, director_id, poster_file_id) VALUES
('Movie One', 'Description of Movie One.', 10000000.00, '2020-01-01', 120, 1, 1, 3),
('Movie Two', 'Description of Movie Two.', 20000000.00, '2021-06-15', 140, 2, 2, 4),
('Movie Three', 'Description of Movie Three.', 30000000.00, '2022-03-20', 150, 3, 3, NULL),
('Movie Four', 'Description of Movie Four.', 15000000.00, '2023-11-10', 130, 4, 4, NULL),
('Movie Five', 'Description of Movie Five.', 25000000.00, '2024-05-05', 160, 5, 5, NULL);

INSERT INTO Genre (name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Thriller'),
('Horror');

INSERT INTO MovieGenre (movie_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 2),
(4, 3),
(5, 4),
(5, 5);

INSERT INTO Characters (name, description, role, movie_id, person_id) VALUES
('Character One', 'Description of Character One.', 'leading', 1, 1),
('Character Two', 'Description of Character Two.', 'supporting', 1, 2),
('Character Three', 'Description of Character Three.', 'background', 2, 3),
('Character Four', 'Description of Character Four.', 'leading', 3, 4),
('Character Five', 'Description of Character Five.', 'supporting', 4, 5),
('Character Six', 'Description of Character Six.', 'background', 5, NULL);

INSERT INTO UserFavoriteMovies (user_id, movie_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 1),
(4, 2),
(4, 3),
(5, 4),
(5, 5);
