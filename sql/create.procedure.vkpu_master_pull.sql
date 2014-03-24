DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `vkpu_master_pull`(in veh_id int(11), in weapon_id int(11), in starting_timestamp int(11), in ending_timestamp int(11), in period_now int(11), out v_deaths int, out v_kpu float)
BEGIN
	
	declare w_unique int(11);

	-- get uniques
	select uniques into w_unique
	from fkpk.v2_kills_vkpu_aggregates
	where item_id = weapon_id 
	and period = period_now; 
	
	select sum(deaths), (sum(deaths)/w_unique)
	into v_deaths, v_kpu
	from fkpk.v2_vehicle_aggregates
	where item_id = weapon_id	
	and vehicle_id = veh_id
	and period = period_now;

END$$
DELIMITER ;

