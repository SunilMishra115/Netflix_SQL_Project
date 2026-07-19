-- Create Database

CREATE DATABASE netflix_db1;
 -- use above database
 
USE netflix_db1;

-- Create table under this database

CREATE TABLE netflix (
    show_id VARCHAR(6),
    type_show VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(250),
    cast_members VARCHAR(1000),
    country VARCHAR(200),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in VARCHAR(100),
    description VARCHAR(250)
    );
    
SELECT count(*) AS total_count FROM NETFLIX;  -- To check the count of all the rows

SELECT DISTINCT type_show FROM NETFLIX;  

-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows

SELECT 
	COUNT(*) as Total_count,
    type_show
FROM netflix
GROUP BY type_show;


--- 2. Find the most common rating for movies and TV shows

WITH Rank_table as ( 
SELECT
	type_show,
	rating,
    count(*) as count_of_rating,
    RANK () OVER (PARTITION BY type_show ORDER BY count(*) DESC) AS Ranking
FROM netflix
GROUP BY 1,2)
SELECT 
	type_show,
	rating
FROM Rank_table
WHERE Ranking =1;


-- 3. List all movies released in a specific year (e.g., 2020)

SELECT 
	*
FROM netflix
WHERE type_show ='Movie' 
	AND
	release_year ='2020';


-- 4. Find the top 5 countries with the most content on Netflix

 -- Easy solution
SELECT 
	COUNT(*) as total_count,
	country
FROM netflix
WHERE country is not null
GROUP BY country
ORDER BY 1 DESC
LIMIT 5;

-- Actual Solution with RECURSIVE (Need to use below query because in same row multiple country available)

WITH RECURSIVE country_split AS (

    SELECT
        show_id,
        TRIM(SUBSTRING_INDEX(country, ',', 1)) AS country_name,
        SUBSTRING(country,LENGTH(SUBSTRING_INDEX(country, ',', 1)) + 2) AS remaining
    FROM netflix
    WHERE country IS NOT NULL

    UNION ALL

    SELECT
        show_id,
        TRIM(SUBSTRING_INDEX(remaining, ',', 1)),
        CASE
            WHEN remaining LIKE '%,%'
            THEN SUBSTRING(remaining,
                  LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)
            ELSE NULL
        END
    FROM country_split
    WHERE remaining IS NOT NULL
)

SELECT
    country_name,
    COUNT(*) AS total_content
FROM country_split
GROUP BY country_name
ORDER BY total_content DESC
LIMIT 6;


-- 5. Identify the longest movie

SELECT	
*
FROM netflix
WHERE 
	type_show ='Movie'
	AND 
    Duration IN (SELECT MAX(duration) FROM netflix);
    

-- 6. Find content added in the last 5 years

/*
SELECT 
-- max(date_added) 2021-09-25
-- min(date_added)  April 15,2018
FROM netflix;

count(last_5_years)-8361 and total_count-8808
*/

SELECT *
FROM netflix
WHERE date_added >= CURRENT_DATE() - INTERVAL 5 YEAR
ORDER BY date_added DESC;


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT *
FROM netflix
WHERE director ='Rajiv Chilaka'; -- count(19)

-- IF same type_show direct by more people then it wont show those records for that we need to use below query

SELECT *
FROM netflix
WHERE director LIKE '%Rajiv Chilaka%'; -- count(22)

-- 8. List all TV shows with more than 5 seasons

SELECT
	*,
    SUBSTRING_INDEX(duration,' ',1) AS Session
FROM netflix
WHERE type_show ='TV Show'
	AND 
	SUBSTRING_INDEX(duration,' ',1) > 5;

-- 9. Count the number of content items in each genre


 -- Easy solution (But incorrect Approach)
SELECT 
	COUNT(*) as total_count_per_Genre
    ,listed_in
FROM netflix
GROUP BY listed_in
ORDER BY total_count_per_Genre DESC ;


-- Actual Solution with RECURSIVE (Need to use below query because in same row multiple genres available)

WITH RECURSIVE split_genres AS (
	SELECT
		show_id,
        TRIM(SUBSTRING_INDEX(listed_in,',',1)) as genre_name,
        SUBSTRING(listed_in,
        LENGTH(TRIM(SUBSTRING_INDEX(listed_in,',',1))) + 2) AS Remaning_genre
	FROM netflix 
    WHERE listed_in IS NOT NULL
		AND listed_in != ''
    
    UNION ALL
    
    SELECT 
		show_id,
        TRIM(SUBSTRING_INDEX(Remaning_genre,',',1)),
	CASE 
		WHEN Remaning_genre LIKE '%,%' 
        THEN SUBSTRING(Remaning_genre,
			LENGTH(TRIM(SUBSTRING_INDEX(Remaning_genre,',',1))) + 2)
		ELSE null
	END
    FROM split_genres
    WHERE Remaning_genre IS NOT NULL 
		AND Remaning_genre != ''
    
)
SELECT 
	COUNT(*) AS Total_as_per_genre,
    genre_name
FROM split_genres
WHERE genre_name IS NOT NULL
AND genre_name != ''
GROUP BY 2
ORDER BY 1 DESC;



/*10.Find each year and the average numbers of content release in India on netflix. 
return top 5 year with highest avg content release! */

	SELECT 
    	YEAR (date_added) as Years,
		COUNT(*) AS Total_number_of_content_release,
        ROUND(COUNT(*) / (SELECT COUNT(*)FROM netflix WHERE country = 'India') * 100 ,2) AS Avg_content_added
	FROM netflix
	WHERE country = 'India'
	GROUP BY 1;
    
    
-- 11. List all movies that are documentaries

SELECT *
FROM netflix
WHERE listed_in LIKE '%Documentaries%';

-- 12. Find all content without a director

SELECT *
FROM netflix
WHERE director IS NULL;


-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

-- select * from netflix;

SELECT *
FROM netflix
WHERE cast_members LIKE '%Salman Khan%'
AND date_added >= CURRENT_DATE() - INTERVAL 10 YEAR;


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

WITH RECURSIVE cast_count AS (
	SELECT
		show_id,
        TRIM(SUBSTRING_INDEX(cast_members,',',1)) AS cast_name,
        SUBSTRING(cast_members,LENGTH(SUBSTRING_INDEX(cast_members,',',1)) + 2) as remaning_cast
	FROM netflix
    WHERE cast_members IS NOT NULL
    AND cast_members != ' '
    
    UNION ALL
    
    SELECT
		show_id,
        TRIM(SUBSTRING_INDEX(remaning_cast,',',1)),
	CASE
		WHEN remaning_cast LIKE '%,%' THEN
				SUBSTRING(remaning_cast,LENGTH(SUBSTRING_INDEX(remaning_cast,',',1)) + 2)
		ELSE null
        END
    FROM cast_count
    WHERE remaning_cast IS NOT NULL
    AND remaning_cast != ''
   )
 
 SELECT 
	COUNT(show_id) as Total_count,
    cast_name
 FROM cast_count
WHERE cast_name IS NOT NULL
    AND cast_name != ' '
 GROUP BY 2 
 ORDER BY 1 DESC
 LIMIT 10;
 


/* 15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category. */

-- select * from netflix;

SELECT 
	COUNT(*) AS Total_items,
    Category
FROM (
	SELECT 
		CASE
			WHEN description like ('%Kill%') OR description like ('%violence%')  THEN  'BAD'
		ELSE 'GOOD'
		END AS Category
	FROM netflix) t
GROUP BY Category;

    
    