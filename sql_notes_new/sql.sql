-- create movies

CREATE TABLE movies(
   id             INTEGER  PRIMARY KEY,
   name           TEXT DEFAULT NULL,
   year           INTEGER  DEFAULT NULL,
   rank           REAL DEFAULT NULL
);


-- create actors

CREATE TABLE actors(
	id 			INTEGER		PRIMARY KEY,
	first_name	TEXT	DEFAULT NULL,
	last_name 	TEXT	DEFAULT NULL,
	gender		TEXT	DEFAULT NULL
);


-- create roles

CREATE TABLE roles(
	actor_id	INTEGER
	movie_id	INTEGER,
	role_name	TEXT	DEFAULT NULL
);

___________________________________________________
-- now for the large IMDB DATABASE WORK
-- Queries

SELECT name FROM movies WHERE year = 1993;

-- Aggregation via Count(*)

SELECT COUNT(*) FROM movies WHERE year = 1982;

-- Stacktors

SELECT * FROM actors WHERE last_name LIKE "%stack%";

-- WHERE field_name LIKE "%hi" (only stuff ending in hi)   "%hi%" (stuff that includes hi) "hi%" (stuff starting with hi)

SELECT first_name,COUNT(*) FROM actors WHERE

-- collapse selection(GROUP), shorten the list(LIMIT) , OUTPUT the most popular ones (ORDER BY)

SELECT COUNT(first_name) FROM actors ORDER BY first_name ASC LIMIT 10;

SELECT actors.first_name, COUNT(actors.first_name) AS Number FROM actors GROUP BY first_name ORDER BY Number DESC LIMIT 10;
--now for FULL names
-- CONCAT is like || and contained within parens

SELECT (actors.first_name || " " || actors.last_name) AS fullname,
COUNT(*) AS num FROM actors GROUP by fullname
ORDER BY num
DESC LIMIT 10;


SELECT actors.first_name, actors.last_name, COUNT(*) AS role_count
FROM actors INNER JOIN roles ON actors.id = roles.actor_id GROUP BY actors.id
ORDER BY role_count DESC LIMIT 10;




--Prolific
/*
Within actors table:
	we care about the first_name and the last_name and the id

Within roles:
	count number of times an actor_id comes up in roles table
	assign that to role_count, and we have join this new column to
	the actors table

Join id from actors and actor_id from roles
Group the rows --> first name , last name , rolecount

-- telling to highlight actors.id, and where actors.id = roles.actor_id, return first last name and count

*/

SELECT first_name, last_name, COUNT(id) AS role_count
FROM actors
INNER JOIN roles
ON actors.id = roles.actor_id
GROUP BY actors.id
ORDER BY role_count DESC LIMIT 10;




/*
Bottom of the Barrel
CREATE TABLE "movies" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(100) DEFAULT NULL,
  "year" int(11) DEFAULT NULL,
  "rank" float DEFAULT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "movies_genres" (
  "movie_id" int(11) DEFAULT NULL,
  "genre" varchar(100) DEFAULT NULL
);

linking movie.id with movies_genres.movie_id
return genre type and num_movies_by_genre

*/

SELECT genre, COUNT(*) AS num_movies_by_genre
FROM movies
INNER JOIN movies_genres
ON movies.id = movies_genres.movie_id
GROUP BY movies_genres.genre
ORDER BY num_movies_by_genre ASC LIMIT 10;



/* Braveheart
CREATE TABLE "movies" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(100) DEFAULT NULL,
  "year" int(11) DEFAULT NULL,
  "rank" float DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "roles" (
  "actor_id" int(11) DEFAULT NULL,
  "movie_id" int(11) DEFAULT NULL,
  "role" varchar(100) DEFAULT NULL
);
CREATE TABLE "actors" (
  "id" int(11) NOT NULL DEFAULT '0',
  "first_name" varchar(100) DEFAULT NULL,
  "last_name" varchar(100) DEFAULT NULL,
  "gender" char(1) DEFAULT NULL,
  PRIMARY KEY ("id")
);

*/

SELECT actors.first_name, actors.last_name
FROM actors
LEFT JOIN roles
ON actors.id = roles.actor_id
LEFT JOIN movies
ON roles.movie_id = movies.id
WHERE movies.year = 1995 AND movies.name LIKE "Braveheart"
ORDER BY actors.last_name ASC LIMIT 5;


/* Leap Noir

CREATE TABLE "directors" (
  "id" int(11) NOT NULL DEFAULT '0',
  "first_name" varchar(100) DEFAULT NULL,
  "last_name" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "movies_directors" (
  "director_id" int(11) DEFAULT NULL,
  "movie_id" int(11) DEFAULT NULL
);
CREATE TABLE "movies" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(100) DEFAULT NULL,
  "year" int(11) DEFAULT NULL,
  "rank" float DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "movies_genres" (
  "movie_id" int(11) DEFAULT NULL,
  "genre" varchar(100) DEFAULT NULL
);
*/

SELECT directors.first_name, directors.last_name, movies.name, movies.year
FROM directors
LEFT JOIN movies_directors
ON directors.id = movies_directors.director_id
LEFT JOIN movies
ON movies_directors.movie_id = movies.id
LEFT JOIN movies_genres
ON movies.id = movies_genres.movie_id
WHERE movies.year % 4 LIKE 0 AND movies_genres.genre LIKE 'Film-Noir'
ORDER BY movies.name ASC LIMIT 5;

/* *Bacon - print name of movie, actor first and actor last name

CREATE TABLE "actors" (
  "id" int(11) NOT NULL DEFAULT '0',
  "first_name" varchar(100) DEFAULT NULL,
  "last_name" varchar(100) DEFAULT NULL,
  "gender" char(1) DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "roles" (
  "actor_id" int(11) DEFAULT NULL,
  "movie_id" int(11) DEFAULT NULL,
  "role" varchar(100) DEFAULT NULL
);
CREATE TABLE "movies" (
  "id" int(11) NOT NULL DEFAULT '0',
  "name" varchar(100) DEFAULT NULL,
  "year" int(11) DEFAULT NULL,
  "rank" float DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "movies_genres" (
  "movie_id" int(11) DEFAULT NULL,
  "genre" varchar(100) DEFAULT NULL
);

*/
/* WHICH MOVIES BACON WAS IN AND PRINT ACTORS
*/
SELECT movies.name, actors.first_name, actors.last_name
FROM actors
LEFT JOIN roles
ON actors.id = roles.actor_id
LEFT JOIN movies
ON roles.movie_id = movies.id
WHERE movies.id =

  /* names of movies kevin bacon is in */
  CREATE VIEW bacon AS
  SELECT movies.name AS kbmovies
  FROM movies
  WHERE movies.name = (
    SELECT actors.first_name, actors.last_name
    FROM actors
    WHERE actors.first_name = 'Kevin' AND actors.last_name = 'Bacon')





/* find all dramas using movie_genres
