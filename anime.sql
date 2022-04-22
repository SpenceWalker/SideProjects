DROP TABLE IF EXISTS characters, anime_characters, animes, anime_series_movies, anime_movies, manga;

CREATE TABLE manga
(
	author_id SERIAL PRIMARY KEY,
	anime_id INTEGER,
	title VARCHAR(250),
	author_name VARCHAR (100) NOT NULL,
	release_date DATE NOT NULL,
	is_finished BOOLEAN,
	is_animated BOOLEAN,

	CONSTRAINTS fk_anime_id FOREIGN KEY (anime_id) REFERENCES animes (anime_id)


);


CREATE TABLE anime_movies
(
	movie_id PRIMARY KEY,
	author_id INTEGER,
	title VARCHAR(500),
	length_minutes INTEGER,
	release_date DATE,
	genre VARCHAR(100),
 	is_cannon BOOLEAN NOT NULL,


	CONSTRAINT pk_movie_id PRIMARY KEY (movie_id),
	CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES manga (author_id)

);

CREATE TABLE anime_series_movies
(
	movie_id PRIMARY KEY,
	anime_id INTEGER,

	CONSTRAINT pk_movie_id PRIMARY KEY (movie_id),
	CONSTRAINT fk_anime_id FOREIGN KEY (anime_id) REFERENCES animes (anime_id)
);


CREATE TABLE animes
(
	anime_id SERIAL NOT NULL,
	movie_id INTEGER,
	author_id INTEGER NOT NULL,
	title VARCHAR(500)NOT NULL,
	release_date DATE NOT NULL,
	studio_publisher VARCHAR(500) NOT NULL,
	number_of_episodes INTEGER,
	still_being_released BOOLEAN,
	genre VARCHAR NOT NULL,

	CONSTRAINT pk_anime_id PRIMARY KEY (anime_id),
	CONSTRAINT fk_movie_id FOREIGN KEY (movie_id) REFERENCES anime_series_movies (movie_id),
	CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES manga (author_id)
);

CREATE TABLE anime_characters
(
		anime_id SERIAL FOREIGN KEY,
	character_id INTEGER FOREIGN KEY,

	CONSTRAINT pk_anime_id PRIMARY KEY (anime_id),
	CONSTRAINT fk_character_id FOREIGN KEY (character_id) REFERENCES characters (character_id)


);

CREATE TABLE characters
(
	character_id SERIAL PRIMARY KEY,
	anime_id INTEGER NOT NULL,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	birth_day DATE NOT NULL,
	is_dead BOOLEAN,
	age INTEGER NOT NULL,
	home_planet VARCHAR(100)NOT NULL,
	occupation VARCHAR(100),
	good_or_evil BOOLEAN,
	specialties_or_quirks VARCHAR(500),
	personality_traits VARCHAR (150),
	overview TEXT,
	is_main_character BOOLEAN,

	CONSTRAINT pk_character_id PRIMARY KEY (character_id),
	CONSTRAINT fk_anime_id FOREIGN KEY (anime_id) REFERENCES anime_characters (anime_id)

);