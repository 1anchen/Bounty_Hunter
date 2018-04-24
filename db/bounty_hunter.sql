DROP TABLE IF EXISTS bounty_hunter;

CREATE TABLE bounty_hunter(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT,
  danger_level VARCHAR(255) 
);
