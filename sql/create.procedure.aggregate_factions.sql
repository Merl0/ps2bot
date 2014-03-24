DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `aggregate_factions`(in period int(11), in starting_timestamp int(11), in ending_timestamp int(11))
BEGIN

	DECLARE VS_daily_kills int;
	DECLARE NC_daily_kills int;
	DECLARE TR_daily_kills int;
	
	select count(*) into VS_daily_kills from fkpk.v2_kills
	where attacker_faction_id = 1
	and attacker_faction_id != faction_id
	and timestamp between starting_timestamp and ending_timestamp;
		
	select count(*) into NC_daily_kills from fkpk.v2_kills
	where attacker_faction_id = 2
	and attacker_faction_id != faction_id
	and timestamp between starting_timestamp and ending_timestamp;

	select count(*) into TR_daily_kills from fkpk.v2_kills
	where attacker_faction_id = 3
	and attacker_faction_id != faction_id
	and timestamp between starting_timestamp and ending_timestamp;

	insert into fkpk.v2_faction_aggregates
	values (period, starting_timestamp, ending_timestamp, VS_daily_kills, NC_daily_kills, TR_daily_kills);		
	

END$$
DELIMITER ;

