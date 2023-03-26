SELECT name, height FROM characters ORDER BY height DESC;

SELECT species, COUNT(*) as num_characters FROM characters GROUP BY species;

SELECT name FROM planets WHERE population > 1000000000;

SELECT name FROM characters WHERE hair_color = 'blond' AND eye_color = 'blue';