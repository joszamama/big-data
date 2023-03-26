-- Load the CSV files
characters = LOAD '/home/maria_dev/pig/characters.csv' USING PigStorage(',') 
AS (name:chararray, height:int, mass:int, hair_color:chararray, skin_color:chararray, eye_color:chararray, birth_year:chararray, gender:chararray, homeworld:chararray, species:chararray);

species = LOAD '/home/maria_dev/pig/species.csv' USING PigStorage(',') 
AS (name:chararray, classification:chararray, designation:chararray, average_height:int, skin_colors:chararray, hair_colors:chararray, eye_colors:chararray, average_lifespan:int, language:chararray, homeworld:chararray);

-- Filter the characters by species and eye color
human_characters = FILTER characters BY species == 'Human' AND eye_color == 'blue';

-- Display the filtered results
DUMP human_characters;