LOAD FROM "C:\TODB\zipcodepopulation.csv" 
OF DEL METHOD P ( 1, 2, 3, 4 ) 
MESSAGES "C:\TODB\loadmsg.txt" 
INSERT INTO zipcensus ( "rank", "population_density", "zip", "population");