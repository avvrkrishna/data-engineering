--How many players are there in the dataset?
SELECT COUNT(*) FROM FIFA_PLAYER_DETAILS;
--How many nationalities do these players belong to?
SELECT COUNT(DISTINCT NATIONALITY) AS PLAYERS FROM FIFA_PLAYER_DETAILS;
--Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
SELECT NATIONALITY, COUNT(DISTINCT NAME) AS PLAYER_COUNT
FROM FIFA_PLAYER_DETAILS GROUP BY 1 ORDER BY 2 DESC LIMIT 3;
--what is the total wage given to all players? What's the average and standard deviation?
SELECT SUM(WAGE) AS TOTAL_WAGE, AVG(WAGE) AS AVG_WAGE, STDDEV(WAGE) AS STDDEV_WAGE FROM FIFA_PLAYER_DETAILS;
--Which player has the highest wage? Who has the lowest?
--Highest Wage
SELECT NAME, WAGE FROM FIFA_PLAYER_DETAILS WHERE WAGE = (SELECT MAX(WAGE) FROM FIFA_PLAYER_DETAILS);
--Lowest Wage
SELECT NAME,WAGE FROM FIFA_PLAYER_DETAILS WHERE WAGE = (SELECT MIN(WAGE) FROM FIFA_PLAYER_DETAILS);
--The player having the best - overall rating? Worst Overall rating?
SELECT NAME, OVERALL 
FROM FIFA_PLAYER_DETAILS WHERE OVERALL = (SELECT MAX(OVERALL) FROM FIFA_PLAYER_DETAILS);

SELECT NAME, MAX(OVERALL) AS BEST_OVERALL
FROM FIFA_PLAYER_DETAILS GROUP BY 1 ORDER BY 2 DESC LIMIT 1;
--Club having the highest total of overall rating? Highest Average of overall rating?
SELECT SUM(OVERALL) AS TOTAL_RATING, CLUB FROM FIFA_PLAYER_DETAILS GROUP BY 2 ORDER BY 1 DESC limit 3;

SELECT AVG(OVERALL) AS AVG_RATING, CLUB FROM FIFA_PLAYER_DETAILS GROUP BY 2 ORDER BY 1 DESC limit 3;
--What are the top 5 clubs based on the average ratings of their players?
SELECT AVG(OVERALL) AS AVG_RATING, CLUB FROM FIFA_PLAYER_DETAILS GROUP BY 2 ORDER BY 1 DESC limit 5;
--What is the distribution of players who preferred foot is left vs right?
SELECT PREFERRED_FOOT, COUNT(*) as FOOT_FREQ FROM FIFA_PLAYER_DETAILS GROUP BY 1 ORDER BY 2 DESC;
--Which jersey number is the luckiest?
SELECT JERSEY_NUMBER, SUM(WAGE) AS TOTAL_WAGE FROM FIFA_PLAYER_DETAILS GROUP BY 1 ORDER BY 2 DESC LIMIT 1;
--What is the frequency distribution of nationalities among players whose club name starts with M?
SELECT NATIONALITY, COUNT(*) AS FREQ FROM FIFA_PLAYER_DETAILS WHERE CLUB LIKE 'M%' GROUP BY 1;
--How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
SELECT COUNT(*) AS FREQ FROM FIFA_PLAYER_DETAILS WHERE JOINED BETWEEN '2018-05-20' AND '2019-04-10';
--How many players have joined their respective clubs date wise?
SELECT COUNT(*) AS FREQ, JOINED FROM FIFA_PLAYER_DETAILS GROUP BY 2 order by 1 desc;

--How many players have joined their respective clubs yearly?
SELECT COUNT(*) AS FREQ, YEAR(JOINED) AS YEAR_JOINED FROM FIFA_PLAYER_DETAILS GROUP BY 2 order by 1 desc;
