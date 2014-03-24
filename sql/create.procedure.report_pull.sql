DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `report_pull`(in weapon_id int(11), out sum_kills int, out avg_uniques float, out avg_kpu float, out avg_kpu_stddev float, out avg_avgbr float, out avg_q1kpu float, out avg_q2kpu float, out avg_q3kpu float, out avg_q4kpu float, out sum_headshot int, out sum_v_deaths int, out avg_vkpu float, out sum_a_deaths int, out avg_akpu float)
BEGIN
	select sum(kills), avg(uniques), avg(kpu), avg(kpu_stddev), avg(avgbr), avg(q1kpu), avg(q2kpu), avg(q3kpu), avg(q4kpu), sum(headshot), sum(v_deaths), avg(vKPU), sum(a_deaths), avg(aKPU)
	into sum_kills, avg_uniques, avg_kpu, avg_kpu_stddev, avg_avgbr, avg_q1kpu, avg_q2kpu, avg_q3kpu, avg_q4kpu, sum_headshot, sum_v_deaths, avg_vkpu, sum_a_deaths, avg_akpu
	from fkpk.v2_kills_vkpu_aggregates
	where item_id = weapon_id;
	
END$$
DELIMITER ;

