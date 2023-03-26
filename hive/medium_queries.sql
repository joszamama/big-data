SELECT c.name, c.height, s.classification 
FROM characters c 
JOIN species s ON c.species = s.name 
WHERE c.gender = 'female' AND c.species = 'Human';

SELECT p.name, COUNT(c.name) as num_characters 
FROM planets p 
LEFT JOIN characters c ON p.name = c.homeworld 
GROUP BY p.name 
HAVING COUNT(c.name) > 5;

SELECT s.name as species_name, p.name as planet_name, p.climate 
FROM species s 
JOIN planets p ON s.homeworld = p.name 
WHERE s.classification = 'mammal' AND p.climate LIKE '%temperate%';

