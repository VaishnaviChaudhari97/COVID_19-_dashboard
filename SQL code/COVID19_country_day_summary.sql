DROP TABLE IF EXISTS COVID19_country_day_summary;

#SQL query to get the count of daily confirmed cases, Deaths, Recovery
/* Lead/LAg : Windows Analytics Function*/
CREATE TABLE COVID19_country_day_summary
AS
SELECT a.*, (a.Cum_Confirmed_Cases - IFNULL(b.Cum_Confirmed_Cases,0)) AS New_Confirmed_Cases,
(a.Cum_Deaths - IFNULL(b.Cum_Deaths,0)) AS New_Deaths,
(a.Cum_Recovered - IFNULL(b.Cum_Recovered,0)) AS New_Recovered
FROM COVID19_country_day_seq a
LEFT OUTER JOIN COVID19_country_day_seq b
ON a.country = b.country
AND a.country_seq = b.country_seq+1
ORDER BY 1,2,4
;
SELECT * FROM COVID19_country_day_summary;