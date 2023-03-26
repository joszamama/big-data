SELECT c.name as character_name, p.name as planet_name, s.classification 
FROM characters c 
JOIN planets p ON c.homeworld = p.name 
JOIN species s ON c.species = s.name 
WHERE p.climate LIKE '%desert%' AND s.classification = 'mammal';

SELECT c.name as character_name, s.name as species_name, p.name as planet_name 
FROM characters c 
JOIN species s ON c.species = s.name 
LEFT JOIN planets p ON c.homeworld = p.name 
WHERE s.classification = 'droid' OR (s.classification = 'mammal' AND p.surface_water > 60);