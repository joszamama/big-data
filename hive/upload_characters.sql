CREATE TABLE characters (
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

LOAD DATA LOCAL INPATH '/tmp/hivetest/characters.csv' INTO TABLE characters;