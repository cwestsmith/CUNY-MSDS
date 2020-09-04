CREATE DATABASE movieratings;

CREATE TABLE movies(
  movie_name CHAR(50) PRIMARY KEY NOT NULL,
  release_date DATE,
  category CHAR(50)
);

CREATE TABLE ratings(
  movie_name CHAR(50) references movies(movie_name),
  respondent CHAR(50),
  date DATE,
  rating INT
);

-- Populate movies table
INSERT INTO movies
(movie_name, release_date, category)
VALUES
('Bad Boys for Life', '2020-01-17', 'Action'),
('Onward', '2020-02-21', 'Animation'),
('Ordinary Love', '2019-09-09', 'Drama'),
('The Gentlemen', '2020-03-24', 'Action'),
('The Invisible Man', '2020-02-24', 'Horror');

--Populate ratings table from survey data .CSV file, which is available in Github.
--Note: For 'Copy' to work permissions will need to be granted to the file on the local user's computer
COPY ratings(respondent,movie_name, date,rating)
FROM 'C:\Users\Cameron\Desktop\Data 607 HW2\response_data.csv'
DELIMITER ','
CSV HEADER;
```