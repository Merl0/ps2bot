DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `vehicle_master_pull`(in weapon_id int(11), in fac_id int(11), in vehicle_id int(11), in starting_timestamp int(11), in ending_timestamp int(11), out deaths int, out q1deaths int, out q2deaths int, out q3deaths int, out q4deaths int)
BEGIN
	select count(*)
	into deaths
	from fkpk.v2_vehicle_deaths
	where attacker_weapon_id = weapon_id
	and faction_id = fac_id
	and vehicle_definition_id = vehicle_id
	and timestamp between starting_timestamp and ending_timestamp;
	
	select count(*)
	into q1deaths
	from fkpk.v2_vehicle_deaths
	where attacker_weapon_id = weapon_id
	and faction_id = fac_id
	and vehicle_definition_id = vehicle_id
	and br_value between -1 and 25
	and timestamp between starting_timestamp and ending_timestamp;

	select count(*)
	into q2deaths
	from fkpk.v2_vehicle_deaths
	where attacker_weapon_id = weapon_id
	and faction_id = fac_id
	and vehicle_definition_id = vehicle_id
	and br_value between 26 and 50
	and timestamp between starting_timestamp and ending_timestamp;

	select count(*)
	into q3deaths
	from fkpk.v2_vehicle_deaths
	where attacker_weapon_id = weapon_id
	and faction_id = fac_id
	and vehicle_definition_id = vehicle_id
	and br_value between 51 and 75
	and timestamp between starting_timestamp and ending_timestamp;

	select count(*)
	into q4deaths
	from fkpk.v2_vehicle_deaths
	where attacker_weapon_id = weapon_id
	and faction_id = fac_id
	and vehicle_definition_id = vehicle_id
	and br_value between 76 and 100
	and timestamp between starting_timestamp and ending_timestamp;

END$$
DELIMITER ;

