-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`fkpk`@`%` PROCEDURE `garbage_collection`(in starting_timestamp int(11), in ending_timestamp int(11))
BEGIN
    
	
	call garbage_delete(starting_timestamp, ending_timestamp);

	-- kills - roadkills
	-- flash
	update fkpk.v2_kills set attacker_weapon_id = '200101' where attacker_vehicle_id = 1 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; -- and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200102' where attacker_vehicle_id = 1 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; -- and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200103' where attacker_vehicle_id = 1 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; -- and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200111' where attacker_vehicle_id = 1 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200112' where attacker_vehicle_id = 1 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200113' where attacker_vehicle_id = 1 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;

	-- sunderer
	update fkpk.v2_kills set attacker_weapon_id = '200201' where attacker_vehicle_id = 2 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200202' where attacker_vehicle_id = 2 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200203' where attacker_vehicle_id = 2 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200211' where attacker_vehicle_id = 2 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200212' where attacker_vehicle_id = 2 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200213' where attacker_vehicle_id = 2 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;


	-- lightning
	update fkpk.v2_kills set attacker_weapon_id = '200301' where attacker_vehicle_id = 3 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200302' where attacker_vehicle_id = 3 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200303' where attacker_vehicle_id = 3 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200311' where attacker_vehicle_id = 3 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200312' where attacker_vehicle_id = 3 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200313' where attacker_vehicle_id = 3 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;
	

	-- MBT
	update fkpk.v2_kills set attacker_weapon_id = '200401' where attacker_vehicle_id = 4 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200502' where attacker_vehicle_id = 5 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200603' where attacker_vehicle_id = 6 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200411' where attacker_vehicle_id = 4 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200512' where attacker_vehicle_id = 5 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200613' where attacker_vehicle_id = 6 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;


	-- ESF
	update fkpk.v2_kills set attacker_weapon_id = '200701' where attacker_vehicle_id = 7 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200802' where attacker_vehicle_id = 8 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '200903' where attacker_vehicle_id = 9 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200711' where attacker_vehicle_id = 7 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200812' where attacker_vehicle_id = 8 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '200913' where attacker_vehicle_id = 9 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;


	-- liberator
	update fkpk.v2_kills set attacker_weapon_id = '201001' where attacker_vehicle_id = 10 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '201002' where attacker_vehicle_id = 10 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '201003' where attacker_vehicle_id = 10 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; -- and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201011' where attacker_vehicle_id = 10 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201012' where attacker_vehicle_id = 10 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201013' where attacker_vehicle_id = 10 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;


	-- galaxy
	update fkpk.v2_kills set attacker_weapon_id = '201101' where attacker_vehicle_id = 11 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '201102' where attacker_vehicle_id = 11 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '201103' where attacker_vehicle_id = 11 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201111' where attacker_vehicle_id = 11 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201112' where attacker_vehicle_id = 11 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201113' where attacker_vehicle_id = 11 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;
	

	-- harasser
	update fkpk.v2_kills set attacker_weapon_id = '201201' where attacker_vehicle_id = 12 and attacker_weapon_id = 0 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '201202' where attacker_vehicle_id = 12 and attacker_weapon_id = 0 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	update fkpk.v2_kills set attacker_weapon_id = '201203' where attacker_vehicle_id = 12 and attacker_weapon_id = 0 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp; --  and attacker_faction_id != faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201211' where attacker_vehicle_id = 12 and attacker_weapon_id = 0 and attacker_faction_id = 1 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201212' where attacker_vehicle_id = 12 and attacker_weapon_id = 0 and attacker_faction_id = 2 and attacker_faction_id = faction_id;
	-- update fkpk.v2_kills set attacker_weapon_id = '201213' where attacker_vehicle_id = 12 and attacker_weapon_id = 0 and attacker_faction_id = 3 and attacker_faction_id = faction_id;
	

	-- UPDATE WEAPONS KILLSTREAM

	-- update AE variant rocket launchers
	update fkpk.v2_kills set attacker_weapon_id = '33002' where attacker_weapon_id = 266 and timestamp between starting_timestamp and ending_timestamp; 
	update fkpk.v2_kills set attacker_weapon_id = '34002' where attacker_weapon_id = 267 and timestamp between starting_timestamp and ending_timestamp; 
	update fkpk.v2_kills set attacker_weapon_id = '35002' where attacker_weapon_id = 268 and timestamp between starting_timestamp and ending_timestamp; 

	-- C-4
	update fkpk.v2_kills set attacker_weapon_id = '300001' where attacker_weapon_id = 432 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300002' where attacker_weapon_id = 432 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300003' where attacker_weapon_id = 432 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Tank Mine
	update fkpk.v2_kills set attacker_weapon_id = '300011' where attacker_weapon_id = 650 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300012' where attacker_weapon_id = 650 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300013' where attacker_weapon_id = 650 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Anti vehicle grenade
	update fkpk.v2_kills set attacker_weapon_id = '300021' where attacker_weapon_id = 1095 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300022' where attacker_weapon_id = 1095 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300023' where attacker_weapon_id = 1095 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Decimator
	update fkpk.v2_kills set attacker_weapon_id = '300101' where attacker_weapon_id = 50560 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300102' where attacker_weapon_id = 50560 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300103' where attacker_weapon_id = 50560 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Annihilator
	update fkpk.v2_kills set attacker_weapon_id = '300201' where attacker_weapon_id = 50561 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300202' where attacker_weapon_id = 50561 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '300203' where attacker_weapon_id = 50561 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-15M and variants
	update fkpk.v2_kills set attacker_weapon_id = '301001' where attacker_weapon_id = 316 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301002' where attacker_weapon_id = 316 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301003' where attacker_weapon_id = 316 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301001' where attacker_weapon_id = 75034 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301002' where attacker_weapon_id = 75034 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301003' where attacker_weapon_id = 75034 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-44 and variants
	update fkpk.v2_kills set attacker_weapon_id = '301101' where attacker_weapon_id = 2001 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301102' where attacker_weapon_id = 2001 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301103' where attacker_weapon_id = 2001 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301101' where attacker_weapon_id = 75063 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301102' where attacker_weapon_id = 75063 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301103' where attacker_weapon_id = 75063 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301101' where attacker_weapon_id = 75170 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301102' where attacker_weapon_id = 75170 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301103' where attacker_weapon_id = 75170 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301101' where attacker_weapon_id = 75172 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301102' where attacker_weapon_id = 75172 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301103' where attacker_weapon_id = 75172 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-357 and variants
	update fkpk.v2_kills set attacker_weapon_id = '301201' where attacker_weapon_id = 75071 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301202' where attacker_weapon_id = 75071 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301203' where attacker_weapon_id = 75071 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301201' where attacker_weapon_id = 75171 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301202' where attacker_weapon_id = 75171 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301203' where attacker_weapon_id = 75171 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301201' where attacker_weapon_id = 75173 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301202' where attacker_weapon_id = 75173 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301203' where attacker_weapon_id = 75173 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301201' where attacker_weapon_id = 75268 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301202' where attacker_weapon_id = 75268 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301203' where attacker_weapon_id = 75268 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-7 PDW and variants
	update fkpk.v2_kills set attacker_weapon_id = '301301' where attacker_weapon_id = 7494 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301302' where attacker_weapon_id = 7494 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301303' where attacker_weapon_id = 7494 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301301' where attacker_weapon_id = 7495 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301302' where attacker_weapon_id = 7495 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301303' where attacker_weapon_id = 7495 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301301' where attacker_weapon_id = 7496 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301302' where attacker_weapon_id = 7496 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301303' where attacker_weapon_id = 7496 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-11A and variants
	update fkpk.v2_kills set attacker_weapon_id = '301401' where attacker_weapon_id = 69999 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301402' where attacker_weapon_id = 69999 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301403' where attacker_weapon_id = 69999 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301401' where attacker_weapon_id = 70998 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301402' where attacker_weapon_id = 70998 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301403' where attacker_weapon_id = 70998 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-11C and variants
	update fkpk.v2_kills set attacker_weapon_id = '301501' where attacker_weapon_id = 75005 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301502' where attacker_weapon_id = 75005 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301503' where attacker_weapon_id = 75005 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301501' where attacker_weapon_id = 75234 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301502' where attacker_weapon_id = 75234 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301503' where attacker_weapon_id = 75234 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS crossbows and variants
	update fkpk.v2_kills set attacker_weapon_id = '301601' where attacker_weapon_id = 2308 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301602' where attacker_weapon_id = 2308 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301603' where attacker_weapon_id = 2308 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301601' where attacker_weapon_id = 2309 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301602' where attacker_weapon_id = 2309 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301603' where attacker_weapon_id = 2309 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301601' where attacker_weapon_id = 2310 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301602' where attacker_weapon_id = 2310 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301603' where attacker_weapon_id = 2310 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301601' where attacker_weapon_id = 2317 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301602' where attacker_weapon_id = 2317 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301603' where attacker_weapon_id = 2317 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301601' where attacker_weapon_id = 2318 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301602' where attacker_weapon_id = 2318 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301603' where attacker_weapon_id = 2318 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	
	-- MKV suppressed and variants
	update fkpk.v2_kills set attacker_weapon_id = '301701' where attacker_weapon_id = 2314 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301702' where attacker_weapon_id = 2314 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301703' where attacker_weapon_id = 2314 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301701' where attacker_weapon_id = 2315 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301702' where attacker_weapon_id = 2315 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301703' where attacker_weapon_id = 2315 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301701' where attacker_weapon_id = 2316 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301702' where attacker_weapon_id = 2316 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301703' where attacker_weapon_id = 2316 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-30 Vandal and variants
	update fkpk.v2_kills set attacker_weapon_id = '301801' where attacker_weapon_id = 2311 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301802' where attacker_weapon_id = 2311 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301803' where attacker_weapon_id = 2311 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301801' where attacker_weapon_id = 2312 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301802' where attacker_weapon_id = 2312 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301803' where attacker_weapon_id = 2312 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301801' where attacker_weapon_id = 2313 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301802' where attacker_weapon_id = 2313 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_kills set attacker_weapon_id = '301803' where attacker_weapon_id = 2313 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	




	
	-- VEHICLES CLEANUP!

	-- vehicles - garbage collection on vehicles
	-- delete from fkpk.v2_vehicle_deaths where zone_id > 10 and timestamp between starting_timestamp and ending_timestamp;
	-- delete from fkpk.v2_vehicle_deaths where attacker_player_guid between 1 and 5028010618035317345 and timestamp between starting_timestamp and ending_timestamp;
	-- delete from fkpk.v2_vehicle_deaths where vehicle_definition_id = 1012 and timestamp between starting_timestamp and ending_timestamp;
	

	-- vehicles - update table for suicides, world kills
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '666666' where attacker_player_guid = 0 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '666666' where attacker_player_guid = character_id and attacker_weapon_id = 0 and timestamp between starting_timestamp and ending_timestamp;

	-- vehicles - update table for collisions/ramming
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '777776' where attacker_weapon_id = 0 and attacker_player_guid != character_id and faction_id = attacker_faction_id and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '777777' where attacker_weapon_id = 0 and attacker_player_guid != character_id and faction_id != attacker_faction_id and timestamp between starting_timestamp and ending_timestamp;



	-- UPDATE WEAPONS VEHICLES DEATHSTREAM

	-- update AE variant rocket launchers
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '33002' where attacker_weapon_id = 266 and timestamp between starting_timestamp and ending_timestamp; 
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '34002' where attacker_weapon_id = 267 and timestamp between starting_timestamp and ending_timestamp; 
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '35002' where attacker_weapon_id = 268 and timestamp between starting_timestamp and ending_timestamp; 

	-- C-4
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300001' where attacker_weapon_id = 432 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300002' where attacker_weapon_id = 432 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300003' where attacker_weapon_id = 432 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Tank Mine
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300011' where attacker_weapon_id = 650 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300012' where attacker_weapon_id = 650 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300013' where attacker_weapon_id = 650 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Anti vehicle grenade
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300021' where attacker_weapon_id = 1095 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300022' where attacker_weapon_id = 1095 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300023' where attacker_weapon_id = 1095 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Decimator
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300101' where attacker_weapon_id = 50560 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300102' where attacker_weapon_id = 50560 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300103' where attacker_weapon_id = 50560 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- Annihilator
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300201' where attacker_weapon_id = 50561 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300202' where attacker_weapon_id = 50561 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '300203' where attacker_weapon_id = 50561 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-15M and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301001' where attacker_weapon_id = 316 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301002' where attacker_weapon_id = 316 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301003' where attacker_weapon_id = 316 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301001' where attacker_weapon_id = 75034 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301002' where attacker_weapon_id = 75034 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301003' where attacker_weapon_id = 75034 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-44 and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301101' where attacker_weapon_id = 2001 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301102' where attacker_weapon_id = 2001 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301103' where attacker_weapon_id = 2001 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301101' where attacker_weapon_id = 75063 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301102' where attacker_weapon_id = 75063 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301103' where attacker_weapon_id = 75063 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301101' where attacker_weapon_id = 75170 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301102' where attacker_weapon_id = 75170 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301103' where attacker_weapon_id = 75170 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301101' where attacker_weapon_id = 75172 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301102' where attacker_weapon_id = 75172 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301103' where attacker_weapon_id = 75172 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-357 and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301201' where attacker_weapon_id = 75071 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301202' where attacker_weapon_id = 75071 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301203' where attacker_weapon_id = 75071 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301201' where attacker_weapon_id = 75171 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301202' where attacker_weapon_id = 75171 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301203' where attacker_weapon_id = 75171 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301201' where attacker_weapon_id = 75173 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301202' where attacker_weapon_id = 75173 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301203' where attacker_weapon_id = 75173 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301201' where attacker_weapon_id = 75268 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301202' where attacker_weapon_id = 75268 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301203' where attacker_weapon_id = 75268 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-7 PDW and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301301' where attacker_weapon_id = 7494 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301302' where attacker_weapon_id = 7494 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301303' where attacker_weapon_id = 7494 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301301' where attacker_weapon_id = 7495 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301302' where attacker_weapon_id = 7495 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301303' where attacker_weapon_id = 7495 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301301' where attacker_weapon_id = 7496 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301302' where attacker_weapon_id = 7496 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301303' where attacker_weapon_id = 7496 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-11A and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301401' where attacker_weapon_id = 69999 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301402' where attacker_weapon_id = 69999 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301403' where attacker_weapon_id = 69999 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301401' where attacker_weapon_id = 70998 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301402' where attacker_weapon_id = 70998 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301403' where attacker_weapon_id = 70998 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS-11C and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301501' where attacker_weapon_id = 75005 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301502' where attacker_weapon_id = 75005 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301503' where attacker_weapon_id = 75005 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301501' where attacker_weapon_id = 75234 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301502' where attacker_weapon_id = 75234 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301503' where attacker_weapon_id = 75234 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- NS crossbows and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301601' where attacker_weapon_id = 2308 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301602' where attacker_weapon_id = 2308 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301603' where attacker_weapon_id = 2308 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301601' where attacker_weapon_id = 2309 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301602' where attacker_weapon_id = 2309 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301603' where attacker_weapon_id = 2309 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301601' where attacker_weapon_id = 2310 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301602' where attacker_weapon_id = 2310 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301603' where attacker_weapon_id = 2310 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301601' where attacker_weapon_id = 2317 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301602' where attacker_weapon_id = 2317 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301603' where attacker_weapon_id = 2317 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301601' where attacker_weapon_id = 2318 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301602' where attacker_weapon_id = 2318 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301603' where attacker_weapon_id = 2318 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;

	-- MKV suppressed and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301701' where attacker_weapon_id = 2314 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301702' where attacker_weapon_id = 2314 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301703' where attacker_weapon_id = 2314 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301701' where attacker_weapon_id = 2315 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301702' where attacker_weapon_id = 2315 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301703' where attacker_weapon_id = 2315 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301701' where attacker_weapon_id = 2316 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301702' where attacker_weapon_id = 2316 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301703' where attacker_weapon_id = 2316 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	
	-- NS-30 Vandal and variants
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301801' where attacker_weapon_id = 2311 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301802' where attacker_weapon_id = 2311 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301803' where attacker_weapon_id = 2311 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301801' where attacker_weapon_id = 2312 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301802' where attacker_weapon_id = 2312 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301803' where attacker_weapon_id = 2312 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301801' where attacker_weapon_id = 2313 and attacker_faction_id = 1 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301802' where attacker_weapon_id = 2313 and attacker_faction_id = 2 and timestamp between starting_timestamp and ending_timestamp;
	update fkpk.v2_vehicle_deaths set attacker_weapon_id = '301803' where attacker_weapon_id = 2313 and attacker_faction_id = 3 and timestamp between starting_timestamp and ending_timestamp;
	


END