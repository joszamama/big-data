CREATE DATABASE IF NOT EXISTS starwars;
USE starwars;

CREATE TABLE species (
	name STRING,
	classification STRING,
	designation STRING,
	average_height INT,
	skin_colors STRING,
	hair_colors STRING,
	eye_colors STRING,
	average_lifespan INT,
	language STRING,
	homeworld STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
LOAD DATA LOCAL INPATH '/tmp/hivetest.csv' INTO TABLE species;

CREATE TABLE characters (
  name STRING,
  height INT,
  mass INT,
  hair_color STRING,
  skin_color STRING,
  eye_color STRING,
  birth_year STRING,
  gender STRING,
  homeworld STRING,
  species STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INPATH '/tmp/hivetest/characters.csv' INTO TABLE characters;

CREATE TABLE planets (
  name STRING,
  rotation_period INT,
  orbital_period INT,
  diameter INT,
  climate STRING,
  gravity STRING,
  terrain STRING,
  surface_water INT,
  population BIGINT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INPATH '/tmp/hivetest/planets.csv' INTO TABLE planets;