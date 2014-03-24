DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `garbage_delete`(in starting_timestamp int(11), in ending_timestamp int(11))
BEGIN
	REPEAT
	delete from fkpk.v2_kills where timestamp between starting_timestamp and ending_timestamp and attacker_character_id between 0 and 5028010618035317345 limit 100;
	until row_count() = 0
	END REPEAT;

	REPEAT
	delete from fkpk.v2_kills where timestamp between starting_timestamp and ending_timestamp and zone_id > 10 limit 100;
	until row_count() = 0
	END REPEAT;

	REPEAT
	delete from fkpk.v2_vehicle_deaths where timestamp between starting_timestamp and ending_timestamp and zone_id > 10 limit 100;
	until row_count() = 0
	END REPEAT;
	
	REPEAT
	delete from fkpk.v2_vehicle_deaths where timestamp between starting_timestamp and ending_timestamp and vehicle_definition_id = 1012 limit 100;
	until row_count() = 0
	END REPEAT;

	REPEAT
	delete from fkpk.v2_vehicle_deaths where timestamp between starting_timestamp and ending_timestamp and attacker_player_guid between 1 and 5028010618035317345 limit 100;
	until row_count() = 0
	END REPEAT;


END$$
DELIMITER ;

