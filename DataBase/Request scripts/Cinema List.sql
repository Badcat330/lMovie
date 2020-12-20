-- 2.2.1
SELECT name FROM cinema
WHERE id IN (SELECT id FROM location
WHERE city_name = 'London');

-- 2.2.2
SELECT *
FROM cinema
ORDER BY name, average_price, rating;

-- 2.2.3
SELECT * FROM cinema
WHERE name = 'KAPO';

-- 4 Требование 2.2.4
SELECT c.name
FROM cinema c join metrostation m ON c.metrostation_id = m.id
WHERE m.name = 'CHINA TOWN'
ORDER BY m.name;

SELECT c.name, ar.data_start
FROM cinema c join
(SELECT a.data_start, r.cinema_id
FROM room r join
(SELECT s.room_id, s.data_start
FROM sessions s join movie m ON s.movie_id = m.id
WHERE s.data_start >= '26.12.2020' AND m.name = 'Avengers') a
ON r.id = a.room_id
) ar
ON c.id = ar.cinema_id
ORDER BY c.name;

--  2.2.5
SELECT m.name
FROM movie m join
(SELECT s.movie_id
FROM sessions s join
(SELECT r.id
FROM room r join cinema c
ON c.id = r.cinema_id
WHERE c.name = 'KAPO'
) kr
ON s.room_id = kr.id
WHERE s.data_start >= (SELECT SYSDATE
  FROM DUAL)
) ks
ON m.id = ks.movie_id
ORDER BY m.rating