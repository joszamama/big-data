-- Load the character and species datasets
characters = LOAD '/home/maria_dev/pig/characters.csv' USING PigStorage(',') AS (name:chararray, height:int, mass:int, hair_color:chararray, skin_color:chararray, eye_color:chararray, birth_year:chararray, gender:chararray, homeworld:chararray, species:chararray);
species = LOAD '/home/maria_dev/pig/species.csv' USING PigStorage(',') AS (name:chararray, classification:chararray, designation:chararray, average_height:int, skin_colors:chararray, hair_colors:chararray, eye_colors:chararray, average_lifespan:int, language:chararray, homeworld:chararray);

-- Join the datasets on the species name column
character_species = JOIN characters BY species, species BY name;

-- Filter out unnecessary columns
character_species_filtered = FOREACH character_species GENERATE characters::name AS name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, homeworld, species, classification, designation, average_height, skin_colors, hair_colors, eye_colors, average_lifespan, language;

-- Display the joined dataset
DUMP character_species_filtered;