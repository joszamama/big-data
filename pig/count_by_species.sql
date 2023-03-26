-- Load the character and species datasets
characters = LOAD '/home/maria_dev/pig/characters.csv' USING PigStorage(',') AS (name:chararray, height:int, mass:int, hair_color:chararray, skin_color:chararray, eye_color:chararray, birth_year:chararray, gender:chararray, homeworld:chararray, species:chararray);
species = LOAD '/home/maria_dev/pig/species.csv' USING PigStorage(',') AS (name:chararray, classification:chararray, designation:chararray, average_height:int, skin_colors:chararray, hair_colors:chararray, eye_colors:chararray, average_lifespan:int, language:chararray, homeworld:chararray);

-- Join the character and species datasets
character_species = JOIN characters BY species, species BY name;

-- Group by species and count the number of characters
character_count = GROUP character_species BY species;
character_count = FOREACH character_count GENERATE group AS species, COUNT(character_species) AS character_count;

-- Display the results
DUMP character_count;