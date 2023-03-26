-- Load the data
characters = LOAD '/path/to/characters.csv' USING PigStorage(',') 
AS (name:chararray, height:int, mass:int, hair_color:chararray, skin_color:chararray, 
    eye_color:chararray, birth_year:chararray, gender:chararray, homeworld:chararray, species:chararray);

-- Filter out characters who have brown or black hair and are taller than 180cm
filtered_characters = FILTER characters BY (hair_color == 'brown' OR hair_color == 'black') AND height > 180;

-- Filter out characters who were born before 20BBY
final_characters = FILTER filtered_characters BY birth_year >= '20BBY';

-- Output the final result
DUMP final_characters;