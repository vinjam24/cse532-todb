Readme for HW1 by Raviteja Vinjam (rvinjam@cs.stonybrook.edu, 115939606):

3a)	On grouping by using cube of month from date attribute and hour from time attribute we get the output as shown in results.txt.
	In result, the rows where month is null and hour is not null gives the no of accidents in that particular hour over the whole year.
	From the results it is inferred that 16th hour in the day (16:00 - 16:59) has most no. of collisions with 16973 collisions.

3c)	First, I discarded rows which have null values for zip code as they are not instrumental to the problem statement and also rows which have latitude or longitude are either null or zero.
	In the results the location (40.760822, -73.998320) has two zip codes : 10036, 11226.
	The zipcode for the location according to gps-coordinates.net belongs to Zip 10035. 
	The results are: Collision_count column gives the collision count corresonding to that location and zip code.

	|latitude |longitude |zip_code|COLLISION_COUNT|
	|---------|----------|--------|---------------|
	|40.820305|-73.89083 |10459   |115            |
	|40.696033|-73.98453 |11201   |107            |
	|40.816864|-73.882744|10474   |89             |
	|40.759514|-73.99926 |10018   |86             |
	|40.75898 |-73.99595 |10036   |84             |
	|40.861862|-73.91282 |10453   |79             |
	|40.72032 |-73.99404 |10012   |76             |
	|40.760822|-73.99832 |10036   |76             |
	|40.724136|-73.992615|10012   |75             |
	|40.7606  |-73.96434 |10022   |70             |
	|40.760822|-73.99832 |11226   |1              |



Extra Questions:
-> Query 1: 
	We group the data by using cube of year, month from date attribute and hour from time attribute.
	In result, the rows where month and year are null and hour is not null gives the no of accidents in that particular hour over all the years.
	From the results, 16th hour of the day has most no. of collisions with 146453 collisions across all years.
-> Query 2:
	
	For the collision_all table : 11385,11236,11234 are among the 10 most populous zip codes that have collision among top 10 counts too.
	For the collison table : 11385, 11226, 11236, 11234 are among the 10 most populous zip codes that have collision among top 10 counts too.
	The difference is because 11226 is not in the 10 most dangerous zip codes,

-> Query 3:
	The most dangerous locations and their corresonding zip codes for collision_all table is:

	|latitude |longitude |zip_code|COLLISION_COUNT|
	|---------|----------|--------|---------------|
	|40.696034|-73.984529|11201   |587            |
	|40.696033|-73.98453 |11201   |513            |
	|40.861862|-73.91282 |10453   |478            |
	|40.7606  |-73.964314|10022   |474            |
	|40.757232|-73.989792|10036   |456            |
	|40.675735|-73.896853|11207   |435            |
	|40.820305|-73.89083 |10459   |428            |
	|40.658577|-73.890622|11207   |418            |
	|40.816864|-73.882744|10474   |405            |
	|40.675735|-73.89686 |11207   |382            |
	|40.696033|-73.98453 |11420   |1              |
	|40.820305|-73.89083 |10001   |1              |

	The first two locations are one and the same because there could be aproximation errors in data.
	As you can see (40.696034, -73.984529) has the most no of collisions in collision_all table while (40.820305,-73.89083) has the most no. of collisions in collision table.
	In collision_all there are new entrants in most dangeros locations like (40.675735,-73.89686), (40.658577,-73.890622) while (40.760822,-73.99832) is not there in the result which is present in collision table.
	The order of the same locations is also changed.
	Also the locations with different zipcodes are (40.696033, -73.98453) - 11420 and 11201 & (40.820305, -73.89083) - 10001 and 10459.
	The correct zipcodes for these coordinates are: 11201 and 10459.




