CREATE TABLE movie (
	movie_id INTEGER PRIMARY KEY NOT NULL,
	adult BOOLEAN,
	budget INTEGER,
	original_language VARCHAR(10),
	original_title VARCHAR,
	overview VARCHAR,
	popularity REAL,
	status VARCHAR,
	title VARCHAR,
	vote_average REAL,
	vote_count INTEGER
);

CREATE TABLE genre (
genre_id INTEGER PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL
);

CREATE TABLE movie_genre (
movie_id INTEGER NOT NULL,
genre_id INTEGER NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE keyword (
keyword_id INTEGER PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL
);

CREATE TABLE movie_keyword (
movie_id INTEGER NOT NULL,
keyword_id VARCHAR NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id)
);

CREATE TABLE language (
language_id INTEGER PRIMARY KEY NOT NULL,
code VARCHAR NOT NULL,
name VARCHAR NOT NULL
);

CREATE TABLE movie_language (
movie_id INTEGER NOT NULL,
language_id VARCHAR NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
FOREIGN KEY (language_id) REFERENCES language(language_id)
);

CREATE TABLE departement (
departement_id INTEGER PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL
);

CREATE TABLE production_compagny (
compagny_id INTEGER PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL,
origin_country VARCHAR NOT NULL
);

CREATE TABLE gender (
gender_id INTEGER PRIMARY KEY NOT NULL,
name VARCHAR NOT NULL
);

CREATE TABLE person (
person_id INTEGER PRIMARY KEY NOT NULL,
firstName VARCHAR,
lastName VARCHAR,
birthDate VARCHAR,
popularity REAL,
gender_id INTEGER NOT NULL
);

CREATE TABLE movie_crew (
movie_id INTEGER PRIMARY KEY NOT NULL,
departement_id INTEGER NOT NULL,
person_id INTEGER NOT NULL,
job VARCHAR NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
FOREIGN KEY (departement_id) REFERENCES departement(departement_id),
FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE movie_cast (
movie_cast_id INTEGER PRIMARY KEY NOT NULL,
movie_id INTEGER NOT NULL,
gender_id INTEGER NOT NULL,
person_id INTEGER NOT NULL,
character_name VARCHAR NOT NULL,
cast_order INTEGER NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
FOREIGN KEY (gender_id) REFERENCES gender(gender_id),
FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE movie_compagny (
movie_id INTEGER PRIMARY KEY NOT NULL,
compagny_id INTEGER NOT NULL,
FOREIGN KEY (compagny_id) REFERENCES production_compagny(compagny_id)
);
