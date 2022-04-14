#2011 Top 100 Movie Analysis

#Showing Full Table
SELECT * FROM data.`motion pictures sql`;
  
#Removing comma from column
UPDATE data.`motion pictures sql`
SET `Number of Theaters` = REPLACE(`Number of Theaters`, ',', '')
WHERE INSTR(`Number of Theaters`, ',') > 0;

#Chaning column text to int
ALTER TABLE `data`.`motion pictures sql` 
CHANGE COLUMN `Number of Theaters` `Number of Theaters` INT NOT NULL ;

#Insert new row of data
INSERT INTO data.`motion pictures sql`(`Motion Picture`,`Genre`,`Rating`,`Opening Gross Sales ($millions)`, `Total Gross Sales ($millions)`, `Number of Theaters`, `Weeks in Release`, `Sales per Week ($millions)`, `Sales per Week After Opening ($millions)`, `Sales per Theatre ($thousands)`, `Sales per Theatre per Week ($thousands)`, `Running Time`, `Budget`, `Budget ($ millions)`, `Profit`)
VALUES('The Lion King (in 3D)', 'Adventure', 'G', 30.15, 94.24, 2340, 17, 5.54, 4.01, 40.27, 2.37, 87, 0, 0,0);

#Show duplicate data
SELECT
     `Motion Picture`, COUNT(`Motion Picture`)
FROM 
     data.`motion pictures sql`
GROUP BY
    `Motion Picture`
HAVING 
     COUNT(`motion picture`) > 1;
     
#Disply Movies Total Gross Sales between 100 - 150 range
SELECT *
  FROM data.`motion pictures sql`
 WHERE `Total Gross Sales ($millions)` BETWEEN 100 AND 150;

#Display Movies with Budget thats 200 
SELECT *
  FROM data.`motion pictures sql`
 WHERE `Budget ($ millions)` LIKE '%200%';
 
 #Display Movies with Budget thats over 200 
 SELECT *
  FROM data.`motion pictures sql`
 WHERE `Budget ($ millions)` > 200;
 
 #Show Movies that had 20 or more weeks in release
  SELECT *
  FROM data.`motion pictures sql`
 WHERE `Weeks in Release` >= 20;
 
 #Show Movies that showed in 4,000 theaters or more
  SELECT *
  FROM data.`motion pictures sql`
 WHERE `Number of Theaters` >= 4000;
 
 #Movies that had 10 or less weeks in release
  SELECT *
  FROM data.`motion pictures sql`
 WHERE `Weeks in Release` <= 10;

#Count Table rows
SELECT COUNT(*) FROM data.`motion pictures sql`;

#Top 10 Opening Gross Sales
SELECT `Motion Picture`, `Opening Gross Sales ($millions)`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Opening Gross Sales ($millions)` DESC LIMIT 10;

#Bottom 10 Opening Gross Sales
SELECT `Motion Picture`, `Opening Gross Sales ($millions)`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Opening Gross Sales ($millions)` ASC LIMIT 10;

#Show Bottom 10 Number of Theaters
SELECT `Motion Picture`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Number of Theaters` ASC LIMIT 10;

#Show top 10 Number of Theaters
SELECT `Motion Picture`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Number of Theaters` DESC LIMIT 10;

#Showing top 10 Motion picture Profits
SELECT `Motion Picture`, `Profit` FROM data.`motion pictures sql` ORDER BY `Profit` DESC LIMIT 10;

#Showing top 10 Motion picture Losses
SELECT `Motion Picture`, `Profit` FROM data.`motion pictures sql` ORDER BY `Profit` ASC LIMIT 10;

#Showing top 10 Total Gross Sales ($millions)
SELECT `Motion Picture`, `Total Gross Sales ($millions)` FROM data.`motion pictures sql` ORDER BY `Total Gross Sales ($millions)` DESC LIMIT 10;

#Showing top 10 Motion Picture running time
SELECT `Motion Picture`, `Running Time`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Running Time` DESC LIMIT 10;

#Showing bottom 10 Motion Picture running time
SELECT `Motion Picture`, `Running Time`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Running Time` ASC LIMIT 10;

#Showing top 10 Motion Picture weeks in release
SELECT `Motion Picture`, `weeks in release`, `number of theaters`, `Opening Gross Sales ($millions)`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `weeks in release` DESC LIMIT 10;

#Showing Bottom 10 Motion Picture weeks in release
SELECT `Motion Picture`, `weeks in release`,`number of theaters`, `Opening Gross Sales ($millions)`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `weeks in release` ASC LIMIT 10;

#Displaying Top 10 Motion Picture budgets
SELECT `Motion Picture`, `Budget ($ millions)`, `Total Gross Sales ($millions)`, `Profit`, `number of theaters`, `weeks in release` FROM data.`motion pictures sql` ORDER BY `Budget ($ millions)` DESC LIMIT 10;

#Displaying Bottom 10 Motion Picture budgets
SELECT `Motion Picture`, `Budget ($ millions)`, `Total Gross Sales ($millions)`, `Profit`, `number of theaters`, `weeks in release` FROM data.`motion pictures sql` ORDER BY `Budget ($ millions)` ASC LIMIT 10;

#Counting Motion Picture Genres
SELECT `Genre`, COUNT(*) FROM data.`motion pictures sql` GROUP BY `Genre` ORDER BY COUNT(*) DESC; 

#Couting Motion Picture Ratings
SELECT `Rating`, COUNT(*) FROM data.`motion pictures sql` GROUP BY `Rating` ORDER BY COUNT(*) DESC; 

#Show Top Movie Profits with their associated Genre
SELECT `motion picture`, `genre`, `Profit` FROM data.`motion pictures sql` ORDER BY `Profit` DESC;  

#Show average profit by movie genre
SELECT Genre, avg(Profit)
From data.`motion pictures sql`
GROUP BY genre
order by genre desc;

#Show average profit by movie rating
SELECT Rating, avg(Profit)
From data.`motion pictures sql`
GROUP BY Rating
order by Rating desc;

#Display Movies that had a budget of 5 million or less and made a profit
SELECT *
	FROM data.`motion pictures sql`
WHERE Budget <= 5000000 AND Profit >= 1;

#Show number of profits / losses in table
select sum(case when Profit > 0 then 1 else 0 end) as Number_Of_Profits,
sum(case when Profit < 0 then 1 else 0 end) as Number_Of_Losses
from `motion pictures sql`;

#Display Opening Gross sales $50 million or more and budget is $150 million or less
SELECT `motion picture`, `number of theaters`, `Opening Gross Sales ($millions)`, `Budget ($ millions)`, `profit`
  FROM data.`motion pictures sql`
 WHERE `Opening Gross Sales ($millions)` >= 50 AND `Budget ($ millions)` <= 150 
ORDER by "sum" desc;

#Movies that had a profit sorted by running time
SELECT `motion picture`, `running time`, `profit`
  FROM data.`motion pictures sql`
 WHERE `Profit` >= 0.1
 ORDER by `running time` DESC;
 
 #Movies that generated losses sorted by running time
 SELECT `motion picture`, `running time`, `profit`
  FROM data.`motion pictures sql`
 WHERE `Profit` <= 1
 ORDER by `running time` DESC;
 
 #Calculating Opening Gross Sales ROI
 Select `motion picture`, `Opening Gross Sales ($millions)`/`Budget ($ millions)`*100 as 'Opening Gross Sales ROI'
From data.`motion pictures sql`;

 #Creating Views
 #Top 10 Opening Gross Sales
CREATE VIEW Top_10_Opening_Gross_Sales as SELECT `Motion Picture`, `Opening Gross Sales ($millions)`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Opening Gross Sales ($millions)` DESC LIMIT 10;

#Bottom 10 Opening Gross Sales
CREATE VIEW Bottom_10_Opening_Gross_sales as SELECT `Motion Picture`, `Opening Gross Sales ($millions)`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Opening Gross Sales ($millions)` ASC LIMIT 10;

#Show Bottom 10 Number of Theaters
CREATE VIEW Bottom_10_Number_of_Theaters as SELECT `Motion Picture`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Number of Theaters` ASC LIMIT 10;

#Show top 10 Number of Theaters
CREATE VIEW Top_10_Number_of_Theaters as SELECT `Motion Picture`, `Number of Theaters`, `Budget ($ millions)`, `Profit` FROM data.`motion pictures sql` ORDER BY `Number of Theaters` DESC LIMIT 10;