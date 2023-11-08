CREATE TABLE collision_all("date" DATE , "time" time, "zip_code" varchar(5), "latitude" decimal(8,6), "longitude" decimal(9,6), "contributing_factor_vehicle1" varchar(511), "contributing_factor_vehicle2" varchar(511), "unique_key" char(7) NOT null, "vehicle_type_code_1" varchar(100), "vehicle_type_code2" varchar(100), PRIMARY KEY("unique_key"));

CREATE INDEX idx_timestamp ON collision_all (YEAR("date"), MONTH("date"), HOUR("time")) 

CREATE INDEX idx_zip ON collision_all ("zip_code")

CREATE INDEX idx_loc ON collision_all("latitude", "longitude")


