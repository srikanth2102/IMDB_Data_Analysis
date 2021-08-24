use imdb;

-- viewing the table
SELECT *
FROM rating;

-- most voted movies
SELECT movies.imdb_title_id, movies.title, movies.language, movies.genre, movies.director, rating.total_votes
FROM movies
INNER JOIN rating
ON movies.imdb_title_id = rating.imdb_title_id
ORDER BY rating.total_votes DESC;  

-- finding how people rated a particular movie.
SELECT rating.imdb_title_id, movies.title, movies.language, movies.genre, votes_10, votes_9, votes_8, votes_7, votes_6, votes_5, votes_4, votes_3, votes_2, votes_10
FROM rating
INNER JOIN movies
ON movies.imdb_title_id = rating.imdb_title_id
WHERE movies.title = 'Pulp Fiction';

-- least hated film
SELECT rating.imdb_title_id, movies.title, movies.language, movies.genre, rating.weighted_average_vote, rating.total_votes
FROM rating
INNER JOIN movies
ON movies.imdb_title_id = rating.imdb_title_id
WHERE total_votes>=500
ORDER BY votes_1+votes_2+votes_3+votes_4+votes_5+votes_6
LIMIT 10;

-- genre that is liked the most among the top 10 genre
SELECT movies.genre, AVG(rating.weighted_average_vote)
FROM (movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id)
INNER JOIN  (
    SELECT genre
    FROM movies
    GROUP BY genre
    ORDER BY COUNT(genre) DESC
    LIMIT 10
) AS temp_table
ON temp_table.genre = movies.genre
GROUP BY genre
ORDER BY AVG(rating.weighted_average_vote) DESC;

-- genre that men like the most among the top 10 genre
SELECT movies.genre, AVG(rating.males_allages_avg_vote)
FROM (movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id)
INNER JOIN  (
    SELECT genre
    FROM movies
    GROUP BY genre
    ORDER BY COUNT(genre) DESC
    LIMIT 10
) AS temp_table
ON temp_table.genre = movies.genre
GROUP BY genre
ORDER BY AVG(rating.males_allages_avg_vote) DESC;

-- genre that women like the most among the top 10 genre
SELECT movies.genre, AVG(rating.females_allages_avg_vote)
FROM (movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id)
INNER JOIN  (
    SELECT genre
    FROM movies
    GROUP BY genre
    ORDER BY COUNT(genre) DESC
    LIMIT 10
) AS temp_table
ON temp_table.genre = movies.genre
GROUP BY genre
ORDER BY AVG(rating.females_allages_avg_vote) DESC;

-- movies most liked by men
SELECT movies.title, movies.title, movies.language, movies.genre, rating.males_allages_avg_vote
FROM movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id
WHERE language='Tamil'
ORDER BY rating.males_allages_avg_vote DESC;

-- movies most liked by women
SELECT movies.title, movies.title, movies.language, movies.genre, rating.females_allages_avg_vote
FROM movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id
WHERE language ='Tamil'
ORDER BY rating.females_allages_avg_vote DESC;

-- genre best liked by people below 18
SELECT movies.genre, AVG(rating.allgenders_0age_avg_vote)
FROM (movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id)
INNER JOIN  (
    SELECT genre
    FROM movies
    GROUP BY genre
    ORDER BY COUNT(genre) DESC
    LIMIT 10
) AS temp_table
ON temp_table.genre = movies.genre
GROUP BY genre
ORDER BY AVG(rating.allgenders_0age_avg_vote) DESC;

-- genre best liked by people between 18-30
SELECT movies.genre, AVG(rating.allgenders_18age_avg_vote)
FROM (movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id)
INNER JOIN  (
    SELECT genre
    FROM movies
    GROUP BY genre
    ORDER BY COUNT(genre) DESC
    LIMIT 10
) AS temp_table
ON temp_table.genre = movies.genre
GROUP BY genre
ORDER BY AVG(rating.allgenders_18age_avg_vote) DESC;

-- genre best liked by people between 30-45
SELECT movies.genre, AVG(rating.allgenders_30age_avg_vote)
FROM (movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id)
INNER JOIN  (
    SELECT genre
    FROM movies
    GROUP BY genre
    ORDER BY COUNT(genre) DESC
    LIMIT 10
) AS temp_table
ON temp_table.genre = movies.genre
GROUP BY genre
ORDER BY AVG(rating.allgenders_30age_avg_vote) DESC;

-- genre best liked by people between 45 and above
SELECT movies.genre, AVG(rating.allgenders_45age_avg_vote)
FROM (movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id)
INNER JOIN  (
    SELECT genre
    FROM movies
    GROUP BY genre
    ORDER BY COUNT(genre) DESC
    LIMIT 10
) AS temp_table
ON temp_table.genre = movies.genre
GROUP BY genre
ORDER BY AVG(rating.allgenders_45age_avg_vote) DESC;

-- movies most liked by people  below 18
SELECT movies.title, movies.title, movies.language, movies.genre, rating.allgenders_0age_avg_vote
FROM movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id
ORDER BY rating.allgenders_0age_avg_vote DESC;

-- movies most liked by people  between 18-30
SELECT movies.title, movies.title, movies.language, movies.genre, rating.allgenders_18age_avg_vote
FROM movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id
ORDER BY rating.allgenders_18age_avg_vote DESC;

-- movies most liked by people  between 30-45
SELECT movies.title, movies.title, movies.language, movies.genre, rating.allgenders_30age_avg_vote
FROM movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id
ORDER BY rating.allgenders_30age_avg_vote DESC;

-- movies most liked by people between 45 and above
SELECT movies.title, movies.title, movies.language, movies.genre, rating.allgenders_30age_avg_vote
FROM movies
INNER JOIN rating
ON rating.imdb_title_id = movies.imdb_title_id
ORDER BY rating.allgenders_30age_avg_vote DESC;

-- best genre according to the critics
SELECT movies.genre, rating.top1000_voters_rating
FROM movies
INNER JOIN rating
ON movies.imdb_title_id = rating.imdb_title_id
GROUP BY movies.genre
ORDER BY top1000_voters_rating DESC;

-- best movies according to critics
SELECT movies.imdb_title_id, movies.title, movies.language, movies.genre, movies.director, rating.top1000_voters_rating
FROM movies
RIGHT JOIN rating
ON movies.imdb_title_id = rating.imdb_title_id
WHERE language LIKE 'English' AND movies.YEAR >= 1980
UNION
SELECT movies.imdb_title_id, movies.title, movies.language, movies.genre, movies.director, rating.top1000_voters_rating
FROM movies
LEFT JOIN rating
ON movies.imdb_title_id = rating.imdb_title_id
WHERE language LIKE 'English' AND movies.YEAR >= 1980
ORDER BY top1000_voters_rating DESC;

-- movies with good critics review but not liked by general audience
SELECT movies.title, movies.language, movies.genre, movies.director, movies.avg_vote, rating.top1000_voters_rating, ABS(rating.top1000_voters_rating-movies.avg_vote)
FROM rating
INNER JOIN movies
ON rating.imdb_title_id = movies.imdb_title_id
WHERE movies.avg_vote<>0 ANd rating.top1000_voters_rating<>0 AND language LIKE '%English%'
ORDER BY ABS(rating.top1000_voters_rating-movies.avg_vote) DESC;

-- movies liked in US but not outside US
SELECT movies.title, movies.language, movies.genre, movies.director, rating.us_voters_rating, rating.non_us_voters_rating, ABS(rating.non_us_voters_rating-rating.us_voters_rating)
FROM rating
INNER JOIN movies
ON movies.imdb_title_id = rating.imdb_title_id
WHERE rating.us_voters_rating >= rating.non_us_voters_rating AND language LIKE '%English'
ORDER BY ABS(rating.non_us_voters_rating-rating.us_voters_rating) DESC;

-- movies liked outside of US but not in US
SELECT movies.title, movies.language, movies.genre, movies.director, rating.us_voters_rating, rating.non_us_voters_rating, ABS(rating.non_us_voters_rating-rating.us_voters_rating)
FROM rating
INNER JOIN movies
ON movies.imdb_title_id = rating.imdb_title_id
WHERE rating.us_voters_rating <= rating.non_us_voters_rating AND language LIKE '%English'
ORDER BY ABS(rating.non_us_voters_rating-rating.us_voters_rating) DESC;

-- Hidden gems movies with great reviews but only a small amount of people saw that movie
SELECT movies.imdb_title_id, movies.title, rating.total_votes, rating.weighted_average_vote
FROM rating
LEFT JOIN movies
ON movies.imdb_title_id = rating.imdb_title_id
WHERE total_votes < (
    SELECT AVG(total_votes)/2
    FROM rating
) AND total_votes>1000
ORDER BY rating.weighted_average_vote DESC;

-- These are all just the samples questions and the queries to get answers for that questions.
-- Ask more questions and write queries to get them.