-- 2.1.1
SELECT name FROM movie
ORDER BY rating, name, data_creation, budget;

--  2.1.2
SELECT * FROM movie
WHERE name = 'Breaking Bad';

-- 2.1.3
SELECT m.name
FROM movie m join genre_movie gm
ON m.id = gm.movie_id
WHERE gm.genre_id = 'Drama';

SELECT * FROM movie
WHERE data_creation >= '01.01.2000';

SELECT * 
FROM movie m join
    (SELECT movie_id
    FROM actor_movie am join actor a
    ON am.actor_id = a.id
    WHERE a.name = 'Emma Watson') mi
ON m.id = mi.movie_id;

-- 2.1.4
SELECT * FROM movie
WHERE name = 'Pokemon';