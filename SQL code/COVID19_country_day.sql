#SQL query to create cumulative cases
DROP TABLE IF EXISTS COVID19_country_day;

CREATE TABLE COVID19_country_day
AS
SELECT TRIM(countr_region) AS Country, STR_TO_DATE(date_reported, '%m-%d-%Y') AS Date_Reported, IFNULL(SUM(cnt_confirmed),0) AS Cum_Confirmed_Cases,
IFNULL(SUM(cnt_death),0) AS Cum_Deaths, IFNULL(SUM(cnt_recovered),0) AS Cum_Recovered
FROM covid19_daily_report
WHERE 1=1
AND countr_region IS NOT NULL
GROUP BY countr_region, STR_TO_DATE(Date_Reported, '%m-%d-%Y');

SELECT * FROM COVID19_country_day;


