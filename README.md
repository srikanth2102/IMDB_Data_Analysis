# IMDB_Data_Analysis
In this we make of publicly available data from IMDB to get insights from the data and also to get particular information about certain movies and actors. We make you of SQL to query the data.

## Data
* The data used in this project is taken from [Kaggle](https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset).
* This data contains details of movies with more than 100 votes in IMDb as of 01/01/2020.
* This dataset contains four tables namely IMDb movies, IMDb names, IMDb ratings, IMDb title_principals
* | Table               | Number of records |
  |------               | ------            | 
  |IMDb movies          | 85,855            |
  |IMDb ratings         | 85,855            |
  |IMDb names           | 297,705           |
  |IMDb title_principals| 835,513           |
* IMDb movies            - This file contains details of movies like description, average rating, number of votes, genre, etc.
* IMDb rating            - This file contains details of rating details from demographic perspective.
* IMDb names             - This file contains details of cast members with personal attributes such as birth details, death details, height, spouses, children, etc.
* IMDb title_principals  - This file contains details of cast members roles in movies with attributes such as IMDb title id, IMDb name id, order of importance in the movie, role, and characters played.

## Objectives
We want to find the answers for the following data. We make use of SQL queries to get those data.
### Movies Table
* Highest rated movie.
* Number of movies in each genre.
* High rated English and Tamil movies.
* High rated Drama, Romance and Sci-Fi movies.
* Number of tamil and english movies genre wise.
* All James Bond movies.
* All movies by Leonardo Dicaprion, Christopher Nolan and Quentin Tarantino.
* Genre-wise average duration of the movie.
* Language-wise average duration of the movie.

### Rating Table
* To find Hidden gems i.e movies with high rating but seen by a few only.
* Movie with most votes.
* Least hated movie.
* Movies liked by a certain age group.
* Genres liked by a certain age group.
* Movies liked men and women.
* Genre liked by men and women.
* Best movies according to the critics.
* Movies highly rated by critics but not by others.
* Movies lowly rated by critics but not by others.
* Movies liked in US but not outside of US. 

### Names and Titles Tables
* Finding all the movies of Leonardo Dicaprio, Sameual L. Johnson and Christopher Nolan.
* Finding the details of the crew members of the film Pulp Fiction, Inception and Nayakan(a tamil movie).

## Overview
* We first create a mysql database containing all these four tables.
* Then we write queries to extract the details we want from the database.
* The queries written to extract the details from each tables can be found under the directory with that table' name.
* The extracted data is also available under the same directory under another directory names 'Result CSV'.
* Then we make of the extracted csv files and mysql database and Tableau software to make colorful visualizations for better understanding of the data.
* The visualization can be found under the directory named screenshots.
