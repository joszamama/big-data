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
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/tmp/hivetest/species.csv' INTO TABLE species;