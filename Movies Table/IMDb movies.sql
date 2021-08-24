-- Creating a db 'imdb'
CREATE DATABASE imdb;

-- using imdb db
use imdb;

-- to see the tables in the imdb db
show tables;

-- creating a table movies if not aldreay created
CREATE TABLE movies(
    imdb_title_id VARCHAR(255),
	title VARCHAR(255),
    original_title VARCHAR(255),
    year YEAR(4),
    date_published DATE,
    genre VARCHAR(255),
    duration INT,
	country VARCHAR(255),
    language VARCHAR(255),
    director VARCHAR(255),
    writer VARCHAR(255),
    production_company VARCHAR(255),
    actors VARCHAR(255),
    description VARCHAR(255),
    avg_vote FLOAT,
    votes INT,
    budget VARCHAR(255),
    usa_gross_income VARCHAR(255),
    worlwide_gross_income varchar(255),
    metascore INT,
    reviews_from_users INT,
    reviews_from_critics INT

);

-- to drop table if needed
DROP TABLE movies;

-- viewing the wholw table
SELECT *
FROM movies;

-- movie with highest avg_vote
SELECT original_title,language, genre, avg_vote
FROM movies
WHERE avg_vote = (
    SELECT MAX(avg_vote)
    FROM movies
);

-- count of movies genre-wise
SELECT genre, COUNT(genre)
FROM movies
GROUP BY genre
ORDER BY COUNT(genre) DESC;

-- tamil movies count by genre
SELECT genre, COUNT(genre)
FROM movies
WHERE language='Tamil'
GROUP BY genre;

-- top 10 highly rated tamil movies
SELECT original_title, language, genre, avg_vote
FROM movies
WHERE language LIKE '%Tamil%'
ORDER BY avg_vote DESC;

-- top 10 highly rated english movies
SELECT original_title, language, genre, avg_vote
FROM movies
WHERE language='English'
ORDER BY avg_vote DESC;

-- best drama films
SELECT title, language, genre, avg_vote
FROM movies
WHERE genre LIKE'%Drama%'
ORDER BY avg_vote DESC,title;

-- best romance films
SELECT title, language, genre, avg_vote
FROM movies
WHERE genre LIKE'%Romance%'
ORDER BY avg_vote DESC,title;

-- to check if there is avengers films
SELECT title, language, genre, avg_vote, description
FROM movies
WHERE description LIKE'%avengers%'
ORDER BY avg_vote DESC,title;

-- top romance tamil films
SELECT title, language, genre, avg_vote
FROM movies
WHERE genre LIKE '%Romance%' AND language='Tamil'
ORDER BY avg_vote DESC;

-- Quentin Tarantino films
SELECT title, language, director, genre, avg_vote
FROM movies
WHERE director LIKE '%Quentin Tarantino%'
ORDER BY avg_vote DESC;

-- Christopher nolan films
SELECT title, language, director, genre, avg_vote
FROM movies
WHERE director LIKE '%Christopher nolan%'
ORDER BY avg_vote DESC;

-- Scifi-Movies 
SELECT title, language, director, genre, avg_vote
FROM movies
WHERE genre LIKE '%Sci-Fi%'
ORDER BY avg_vote DESC;

-- leonardo dicaprio movies
SELECT title, language, director, genre, avg_vote
FROM movies
WHERE actors LIKE '%leonardo dicaprio%'
ORDER BY avg_vote DESC;

-- Martin Scorsese movies
SELECT title, language, genre, director, avg_vote
FROM movies
WHERE director LIKE '%Martin Scorsese%'
ORDER BY avg_vote DESC;

-- japanese films
SELECT title, language, genre, director, avg_vote
FROM movies
WHERE language LIKE '%Japanese%'
ORDER BY avg_vote DESC;