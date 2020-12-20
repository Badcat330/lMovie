-- 2.3.1
select movie.id, movie.name, movie.description,
status.name, user_movie.rating from user_movie
join movie on user_movie.movie_id = movie.id
join user_movie_status on movie.id = user_movie_status.movie_id
and user_movie.user_login = 'LOGIN'
join status on user_movie_status.status_id = status.id
where user_movie.user_login = 'LOGIN';

-- 2.3.2
select movie.id, movie.name, movie.description, status.name from user_movie
join movie on user_movie.movie_id = movie.id
join user_movie_status on movie.id = user_movie_status.movie_id and user_movie.user_login = 'LOGIN'
join status on user_movie_status.status_id = status.id
where user_movie.user_login = 'LOGIN'
order by [movie.name, user_movie.rating, movie.data_creation];

-- 2.3.3
select movie.id, movie.name, movie.description,
status.name from user_movie
join movie on user_movie.movie_id = movie.id
join user_movie_status on movie.id = user_movie_status.movie_id
and user_movie.user_login = 'LOGIN'
join status on user_movie_status.status_id = status.id
where user_movie.user_login = 'LOGIN' and upper(movie.name) like '%NAME%';

-- 2.3.4
select movie.id, movie.name, movie.description, status.name from user_movie
join movie on user_movie.movie_id = movie.id
join user_movie_status on movie.id = user_movie_status.movie_id and user_movie.user_login = 'LOGIN'
join status on user_movie_status.status_id = status.id
join genre_movie on movie.id = genre_movie.movie_id
where status.id = STATUS_ID and genre_movie.genre_id = GENRE_ID and data_creation = 'Data'
and exists(select * from actor_movie where actor_movie.movie_id = movie.id and actor_movie.actor_id = ACTOR_ID)
and movie.producer_id = PRODUCER_ID and movie.studio_name = 'STUDIO_NAME'
and exists(select * from reward_movie where reward_movie.movie_id = movie.id and reward_movie.reward_name = REWARD_NAME);

-- 2.3.5
delete from user_movie 
where user_movie.user_login = 'LOGIN' and movie_id = ID;

-- 2.3.6
insert into user_movie_status (movie_id, user_login, status_id) 
values (ID, 'LOGIN', STATUS_ID);

-- 2.3.7
insert into status (id, name, creator) values (sys_guid(), 'NAME', 'LOGIN');