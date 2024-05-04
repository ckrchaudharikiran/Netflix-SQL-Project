--https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies?resource=download

SELECT title, 
type, 
imdb_score
FROM shows_movies.titles
WHERE imdb_score >= 8.0
AND type = 'MOVIE'
ORDER BY imdb_score DESC
LIMIT 10


SELECT title, 
type, 
imdb_score
FROM shows_movies.titles
WHERE imdb_score >= 8.0
AND type = 'SHOW'
ORDER BY imdb_score DESC
LIMIT 10

SELECT title, 
type, 
imdb_score
FROM shows_movies.titles
WHERE type = 'MOVIE'
ORDER BY imdb_score ASC
LIMIT 10


SELECT title, 
type, 
imdb_score
FROM shows_movies.titles
WHERE type = 'SHOW'
ORDER BY imdb_score ASC
LIMIT 10

SELECT DISTINCT production_countries, 
ROUND(AVG(imdb_score),2) AS avg_imdb_score,
ROUND(AVG(tmdb_score),2) AS avg_tmdb_score
FROM shows_movies.titles
GROUP BY production_countries
ORDER BY avg_imdb_score DESC

SELECT age_certification, 
COUNT(*) AS certification_count
FROM shows_movies.titles
WHERE type = 'Movie' 
AND age_certification != 'N/A'
GROUP BY age_certification
ORDER BY certification_count DESC
LIMIT 5;

SELECT DISTINCT t.title, c.name AS director, 
release_year
FROM shows_movies.titles AS t
JOIN shows_movies.credits AS c 
ON t.id = c.id
WHERE t.type = 'Movie' 
AND t.release_year >= 2010 
AND c.role = 'director'
ORDER BY release_year DESC

SELECT title, 
SUM(seasons) AS total_seasons
FROM shows_movies.titles 
WHERE type = 'Show'
GROUP BY title
ORDER BY total_seasons DESC
LIMIT 10

 
SELECT genres, 
COUNT(*) AS title_count
FROM shows_movies.titles 
WHERE type = 'Movie'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;

 
SELECT genres, 
COUNT(*) AS title_count
FROM shows_movies.titles 
WHERE type = 'Show'
GROUP BY genres
ORDER BY title_count DESC
LIMIT 10;

 
SELECT t.title, 
c.name AS director
FROM shows_movies.titles AS t
JOIN shows_movies.credits AS c 
ON t.id = c.id
WHERE t.type = 'Movie' 
AND t.imdb_score > 7.5 
AND t.tmdb_popularity > 80 
AND c.role = 'director';


SELECT release_year, 
COUNT(*) AS title_count
FROM shows_movies.titles 
GROUP BY release_year
ORDER BY release_year DESC;

SELECT t.genres, 
COUNT(*) AS genre_count
FROM shows_movies.titles AS t
WHERE t.type = 'Movie'
GROUP BY t.genres
ORDER BY genre_count DESC
LIMIT 3;
