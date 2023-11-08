WITH TIME_DATA AS (
SELECT YEAR(c."date") AS "Year", MONTH(c."date") AS "Month", HOUR(c."time") AS "hour", count(*) AS collisions FROM ECOLLISION c GROUP BY cube (YEAR(c."date"), MONTH(c."date"), HOUR(c."time"))
) SELECT "hour", collisions FROM TIME_DATA WHERE "Year" IS NULL AND "Month" IS NULL ORDER BY collisions DESC 
