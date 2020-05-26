DROP TABLE IF EXISTS COVID19_country_day_seq;

#SQL query to create sequence
/* SEQ generation */
CREATE TABLE COVID19_country_day_seq
AS
SELECT a.Country AS country, a.Date_Reported, a.Cum_Confirmed_Cases,a.Cum_Deaths,a.Cum_Recovered, COUNT(*) country_seq
FROM COVID19_country_day a, COVID19_country_day b
WHERE a.country = b.country
AND a.Date_reported >= b.date_reported
GROUP BY a.country, a.Date_Reported, a.Cum_Confirmed_Cases;

SELECT * FROM COVID19_country_day_seq;