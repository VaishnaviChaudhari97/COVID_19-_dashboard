
USE covid19datamart;

SELECT * FROM COVID19_daily_report;

ALTER TABLE COVID19_daily_report
ADD filename VARCHAR(256);

ALTER TABLE COVID19_daily_report DROP COLUMN date_reported;

SELECT * FROM COVID19_daily_report;

ALTER TABLE COVID19_daily_report
CHANGE filename date_reported VARCHAR(256);

SELECT * FROM`covid19datamart` COVID19_daily_report;