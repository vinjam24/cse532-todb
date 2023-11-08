WITH TOP_TEN_LOC AS (
	SELECT "latitude", "longitude", collision_count FROM (
		SELECT c."latitude", c."longitude", count(*) AS collision_count FROM COLLISION c WHERE c."zip_code" IS NOT null GROUP BY (c."latitude", c."longitude")
	) WHERE "latitude" IS NOT NULL AND "longitude" IS NOT NULL AND "latitude" != 0 AND "longitude" IS NOT NULL  ORDER BY collision_count DESC FETCH FIRST 10 ROWS only
), JOIN_LOCS AS (
	SELECT c2."latitude" , c2."longitude" , c2."zip_code", collision_count  FROM COLLISION c2 JOIN TOP_TEN_LOC ON TOP_TEN_LOC."latitude" = c2."latitude" AND TOP_TEN_LOC."longitude" = c2."longitude" WHERE c2."zip_code" IS NOT null
), ZIP_LOC AS ( SELECT "latitude", "longitude", "zip_code", count(*) AS collision_count FROM JOIN_LOCS GROUP BY ("latitude", "longitude", "zip_code")) SELECT * FROM ZIP_LOC ORDER BY ZIP_LOC.COLLISION_COUNT DESC
