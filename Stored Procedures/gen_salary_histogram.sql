DROP TABLE IF EXISTS histogram@

CREATE TABLE histogram(
binnum int,
frequency int DEFAULT 0,
binstart int,
binend int
)@


CREATE OR replace PROCEDURE gen_salary_histogram
(IN binstart int, IN binend int, IN num_bins int)
LANGUAGE SQL 
BEGIN
	DECLARE SQLSTATE char(5) DEFAULT '00000';
	DECLARE cur_bin int;
	DECLARE cur_start int;
	DECLARE bin_width int;
	DECLARE sal int;
	DECLARE i int;
	DECLARE cur_end int;
	DECLARE c CURSOR FOR SELECT salary FROM employee;
	COMMIT;
	SET i = 0;
	SET bin_width = (binend - binstart)/ num_bins;
	SET cur_bin = 1;
	TRUNCATE TABLE histogram IMMEDIATE;
	WHILE (i < num_bins) DO
		SET cur_start = binstart+ i*bin_width;
		SET cur_end = cur_start + bin_width;
		SET cur_bin = i+1;
		SET i = i+1;
		INSERT INTO histogram (binnum, binstart, binend) VALUES (cur_bin, cur_start, cur_end);
	END WHILE;
	OPEN c;
	FETCH FROM c INTO sal;
	while(SQLSTATE = '00000') DO
		SET cur_bin = (sal - binstart) / bin_width + 1;
		UPDATE histogram SET frequency = frequency+1 WHERE binnum = cur_bin AND sal < binend;
		FETCH FROM c INTO sal;
	END WHILE;
END@
