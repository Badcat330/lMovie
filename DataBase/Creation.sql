drop table reward_movie;
drop table picture_movie;
drop table actor_movie;
drop table actor_reward;
drop table producer_reward;
drop table genre_movie;
drop table user_movie_status;
drop table user_movie;
drop table user_sessions;
drop table sessions;
drop table room;
drop table movie;
drop table cinema;
drop table picture;
drop table reward;
drop table actor;
drop table producer;
drop table studio;
drop table genre;
drop table status;
drop table app_user;
drop table metrostation;
drop table location;

create table location (
    id number primary key not null,
    city_name varchar(256) not null,
    country_name varchar(256) not null
);

create table metrostation (
    id number primary key not null,
    name varchar(256) not null,
    location_id number not null,
    foreign key (location_id) references location (id)
);

create table app_user (
    login varchar(256) primary key not null,
    password varchar(256) not null,
    name varchar(256) not null,
    surname varchar(256) not null,
    email varchar(256) not null
);

create table status (
    id number primary key not null,
    name varchar(256) not null,
    creator varchar(256) not null,
    foreign key (creator) references app_user (login)
);

create table genre (
    name varchar(256) primary key not null,
    discription varchar(256)
);

create table studio (
    name varchar(256) primary key not null,
    discription varchar(256)
);

create table producer (
    id number primary key not null,
    name varchar(256) not null,
    surname varchar(256) not null,
    birthday date,
    discription varchar(256)
);

create table actor (
    id number primary key not null,
    name varchar(256) not null,
    surname varchar(256) not null,
    birthday date,
    discription varchar(256)
);

create table reward (
    id number primary key not null,
    name varchar(256) not null,
    discription varchar(256)
);

create table picture (
    id number primary key not null,
    titlle varchar(256) not null,
    link varchar(256)
);

create table cinema (
    id number primary key not null,
    average_price number,
    rating number,
    name varchar(256) not null,
    address varchar(256) not null,
    metrostation_id number,
    location_id number not null, 
    foreign key (metrostation_id) references metrostation (id),
    foreign key (location_id) references location (id)
);

create table room (
    id number primary key not null,
    room_number varchar(256) not null,
    amount_sits number not null,
    sit_type varchar(256), -- TODO type
    cinema_id number not null,
    foreign key (cinema_id) references cinema (id)
);

create table movie (
    id number primary key not null,
    name varchar(256) not null,
    budget number,
    data_creation date not null,
    rating number,
    movie_duration number,
    description varchar(256),
    producer_id number not null,
    studio_name varchar(256),
    foreign key (producer_id) references producer (id),
    foreign key (studio_name) references studio (name)
);

create table sessions (
    id number primary key not null,
    data_start date not null, -- TODO type
    price number not null,
    room_id number not null,
    movie_id number not null,
    foreign key (movie_id) references movie (id),
    foreign key (room_id) references room (id)
);

create table user_session (
    user_login varchar(256) not null,
    session_id number not null,
    sit_number varchar(256) not null,
    constraint user_session_pk primary key (user_login, session_id),
    foreign key (user_login) references app_user (login),
    foreign key (session_id) references sessions (id)
);

create table user_movie (
    movie_id number not null,
    user_login varchar(256) not null,
    constraint user_movie_pk primary key (movie_id, user_login),
    foreign key (user_login) references app_user (login),
    foreign key (movie_id) references movie (id)
);

create table user_movie_status (
    movie_id number not null,
    user_login varchar(256) not null,
    status_id number,
    constraint user_movie_status_pk primary key (movie_id, user_login, status_id),
    foreign key (movie_id, user_login) references user_movie (movie_id, user_login),
    foreign key (status_id) references status (id)
);

create table genre_movie (
    genre_id varchar(256) not null,
    movie_id number not null,
    constraint genre_movie_pk primary key (genre_id, movie_id),
    foreign key (genre_id) references genre (name),
    foreign key (movie_id) references movie (id)
);

create table producer_reward (
    producer_id number not null,
    reward_id number not null, 
    constraint producer_reward_pk primary key (producer_id, reward_id),
    foreign key (producer_id) references producer (id),
    foreign key (reward_id) references reward (id)
);

create table actor_reward (
    actor_id number not null,
    reward_id number not null,
    constraint actor_reward_pk primary key (actor_id, reward_id),
    foreign key (actor_id) references actor (id),
    foreign key (reward_id) references reward (id)
);

create table actor_movie (
    actor_id number not null,
    movie_id number not null,
    constraint actor_movie_pk primary key (actor_id, movie_id),
    foreign key (actor_id) references actor (id),
    foreign key (movie_id) references movie (id)
);

create table picture_movie (
    picture_id number not null,
    movie_id number not null,
    constraint picture_movie_id primary key (picture_id, movie_id),
    foreign key (picture_id) references picture (id),
    foreign key (movie_id) references movie (id)
);

create table reward_movie (
    reward_id number not null,
    movie_id number not null,
    constraint reward_movie_id primary key (reward_id, movie_id),
    foreign key (reward_id) references reward (id),
    foreign key (movie_id) references movie (id)
);
