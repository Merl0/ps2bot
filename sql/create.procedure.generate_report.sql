DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `generate_report`()
BEGIN

	
	declare w int;
	declare cat int;
	declare w_name varchar(45);
	
	DECLARE no_more_rows BOOLEAN;

	declare weapons cursor for select id from fkpk.v2_weapons where is_killer=1 order by id asc;

	DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET no_more_rows = TRUE;
	
	truncate table fkpk.v2_report;

	open weapons;
	
	do_loop: loop
		fetch weapons into w;

		IF no_more_rows THEN
			CLOSE weapons;
			LEAVE do_loop;
		END IF;
		call fkpk.report_pull(w, @sum_kills, @avg_uniques, @avg_kpu, @avg_kpu_stddev, @avg_avgbr, @avg_q1kpu, @avg_q2kpu, @avg_q3kpu, @avg_q4kpu, @sum_headshot, @sum_v_deaths, @avg_vkpu, @sum_a_deaths, @avg_akpu);
	
		select name into w_name from fkpk.v2_weapons where id = w; 

		select item_category_id into cat from fkpk.v2_weapons where id = w;
				
		insert into fkpk.v2_report
		values (cat, w, w_name, @sum_kills, @avg_uniques, @avg_kpu, @avg_kpu_stddev, @avg_avgbr, @avg_q1kpu, @avg_q2kpu, @avg_q3kpu, @avg_q4kpu, @sum_headshot, @sum_v_deaths, @avg_vkpu, @sum_a_deaths, @avg_akpu);

	end loop;

END$$
DELIMITER ;

