LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sets.csv'
INTO TABLE sets
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;