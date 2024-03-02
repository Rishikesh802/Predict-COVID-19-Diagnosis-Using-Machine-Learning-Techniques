use covid_19;


SELECT * FROM covid_19.covid_modified;

# --1. Find the number of corona patients who faced shortness of breath.
SELECT Count(*) FROM covid_19.covid_modified WHERE Corona = 'Positive' AND Shortness_of_breath = 'TRUE';

# -- 2. Find the number of negative corona patients who have fever and sore_throat. 
Select Count(*) FROM covid_19.covid_modified WHERE corona= 'negative' AND fever = 'TRUE' AND sore_throat = 'TRUE';

#-- 3. Group the data by month and rank the number of positive cases.
SELECT MONTH(Test_date) AS months, sum(corona='positive') AS total_positive_cases,
RANK() OVER (ORDER BY SUM(Corona='positive') DESC) AS Ranks FROM covid_19.covid_modified
WHERE corona='positive' GROUP BY months;

#-- 4. Find the female negative corona patients who faced cough and headache.
SELECT Count(*) FROM covid_19.covid_modified WHERE corona = 'negative' AND Sex='female' AND Ind_ID IN (
SELECT Ind_ID FROM covid_19.covid_modified WHERE Cough_symptoms = 'True' AND headache = 'True');

#-- 5. How many elderly corona patients have faced breathing problems?
SELECT count(*) FROM covid_19.covid_modified WHERE Age_60_above='yes' AND Corona='positive' AND Shortness_of_breath='true';
