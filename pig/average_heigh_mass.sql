-- Load character and species data
characters = LOAD '/home/maria_dev/pig/characters.csv' USING PigStorage(',') 
             AS (name:chararray, height:int, mass:int, hair_color:chararray, skin_color:chararray, eye_color:chararray, birth_year:chararray, gender:chararray, homeworld:chararray, species:chararray);

species = LOAD '/home/maria_dev/pig/species.csv' USING PigStorage(',') 
          AS (name:chararray, classification:chararray, designation:chararray, average_height:int, skin_colors:chararray, hair_colors:chararray, eye_colors:chararray, average_lifespan:int, language:chararray, homeworld:chararray);

-- Join character and species data on species name
character_species = JOIN characters BY species, species BY name;

-- Compute average height and mass per species
species_stats = FOREACH (GROUP character_species BY species) GENERATE group AS species,  AVG(character_species.height) AS avg_height, AVG(character_species.mass) AS avg_mass;

-- Output the results
DUMP species_stats;