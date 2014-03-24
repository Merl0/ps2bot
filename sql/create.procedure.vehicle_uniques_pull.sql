DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `vehicle_uniques_pull`(in fac_id int(11), in vehicle_id int(11), in starting_timestamp int(11), in ending_timestamp int(11), out uniques int)
BEGIN
	select count(distinct character_id)
	into uniques
	from fkpk.v2_vehicle_deaths
	where faction_id = fac_id
	and vehicle_definition_id = vehicle_id
	and timestamp between starting_timestamp and ending_timestamp;

	
END$$
DELIMITER ;

