USE imdb;

CREATE TABLE names(
    imdb_name_id VARCHAR(255),
    name VARCHAR(255),
    birth_name VARCHAR(255),
    height INT,
    bio VARCHAR(255),
    birth_details VARCHAR(255),
    date_of_birth VARCHAR(255),
    place_of_birth VARCHAR(255),
    death_details VARCHAR(255),
    date_of_death VARCHAR(255),
    place_of_death VARCHAR(255),
    reason_of_death VARCHAR(255),
    spouses_string VARCHAR(255),
    spouses INT,
    divorces INT,
    spouses_with_children INT,
    children INT
); 

CREATE TABLE titles(
    imdb_title_id VARCHAR(255),
    ordering INT,
    imdb_name_id VARCHAR(255),
    category VARCHAR(255),
    job VARCHAR(255),
    characters VARCHAR(255) 
);
-- viewing names table
SELECT *
FROM names;

-- viewing titles tables
SELECT *
FROM titles;

-- using titles and names tables together
-- find the characters in Pulp Fiction movie
SELECT titles.imdb_title_id, movies.title, titles.imdb_name_id, names.name, titles.category, titles.characters
FROM (titles
INNER JOIN names
ON names.imdb_name_id = titles.imdb_name_id)
INNER JOIN movies
ON movies.imdb_title_id = titles.imdb_title_id
WHERE movies.title='Pulp Fiction';

-- find the characters in Inception movie
SELECT titles.imdb_title_id, movies.title, titles.imdb_name_id, names.name, titles.category, titles.characters
FROM (titles
INNER JOIN names
ON names.imdb_name_id = titles.imdb_name_id)
INNER JOIN movies
ON movies.imdb_title_id = titles.imdb_title_id
WHERE movies.title='Inception';

-- find the characters in nayakan movie
SELECT titles.imdb_title_id, movies.title, titles.imdb_name_id, names.name, titles.category, titles.characters
FROM (titles
INNER JOIN names
ON names.imdb_name_id = titles.imdb_name_id)
INNER JOIN movies
ON movies.imdb_title_id = titles.imdb_title_id
WHERE movies.title='nayakan';

-- finding all movies of 'Samuel L. Jackson'
SELECT titles.imdb_name_id, names.name, movies.imdb_title_id, movies.title, movies.avg_vote
FROM (titles
INNER JOIN names
ON names.imdb_name_id = titles.imdb_name_id)
INNER JOIN movies
ON movies.imdb_title_id = titles.imdb_title_id
WHERE names.name = 'Samuel L. Jackson'
ORDER BY movies.avg_vote DESC;

-- finding all movies of 'Leonardo Dicaprio'
SELECT titles.imdb_name_id, names.name, movies.imdb_title_id, movies.title, movies.avg_vote
FROM (titles
INNER JOIN names
ON names.imdb_name_id = titles.imdb_name_id)
INNER JOIN movies
ON movies.imdb_title_id = titles.imdb_title_id
WHERE names.name = 'Leonardo Dicaprio'
ORDER BY movies.avg_vote DESC;