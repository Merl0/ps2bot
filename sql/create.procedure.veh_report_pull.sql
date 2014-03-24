DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `veh_report_pull`(in weapon_id int(11), in fac_id int(11), in veh_id int(11), out sum_deaths int(11), out sum_q1deaths int(11), out sum_q2deaths int(11), out sum_q3deaths int(11), out sum_q4deaths int(11))
BEGIN
	select sum(deaths), sum(q1deaths), sum(q2deaths), sum(q3deaths), sum(q4deaths)
	into sum_deaths, sum_q1deaths, sum_q2deaths, sum_q3deaths, sum_q4deaths
	from fkpk.v2_vehicle_aggregates
	where item_id = weapon_id
	and faction_id = fac_id
	and vehicle_id = veh_id;
	
END$$
DELIMITER ;

