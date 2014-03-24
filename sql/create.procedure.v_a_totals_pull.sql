DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `v_a_totals_pull`(in weapon_id int(11), in starting_timestamp int(11), in ending_timestamp int(11), in period_now int(11), out v_total_deaths int, out v_total_kpu float, out a_total_deaths int, out a_total_kpu float)
BEGIN
	
	declare w_unique int(11);

	-- get uniques
	select uniques into w_unique
	from fkpk.v2_kills_vkpu_aggregates
	where item_id = weapon_id 
	and period = period_now; 

	-- get total vehicle deaths / v_kpu
	select flashDeaths + sundDeaths + lightDeaths + magDeaths + vanDeaths + prowlDeaths + harasDeaths, 
		((flashDeaths + sundDeaths + lightDeaths + magDeaths + vanDeaths + prowlDeaths + harasDeaths)/w_unique)
	into v_total_deaths, v_total_kpu from fkpk.v2_kills_vkpu_aggregates
	where item_id = weapon_id
	and period = period_now;

	-- get total aircraft deaths / a_kpu
	select scytheDeaths + reaverDeaths + mossyDeaths + libDeaths + galDeaths,
		((scytheDeaths + reaverDeaths + mossyDeaths + libDeaths + galDeaths)/w_unique)
	into a_total_deaths, a_total_kpu from v2_kills_vkpu_aggregates
	where item_id = weapon_id
	and period = period_now;
		
	
END$$
DELIMITER ;

