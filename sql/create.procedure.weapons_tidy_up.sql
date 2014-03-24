-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`fkpk`@`%` PROCEDURE `weapons_tidy_up`()
BEGIN
    
	-- update table for is_killer = 1
	update fkpk.v2_weapons set is_killer = 1;

	-- insert roadkill rows for flash
	insert into fkpk.v2_weapons values (200101, 1, 200101, 'NA', 200101, 0, 200, 26, 1, 2000, 'VS Flash Roadkill', 'VS Flash Roadkill', 1); 
	insert into fkpk.v2_weapons values (200102, 2, 200102, 'NA', 200102, 0, 200, 26, 1, 2000, 'NC Flash Roadkill', 'NC Flash Roadkill', 1);
	insert into fkpk.v2_weapons values (200103, 3, 200103, 'NA', 200103, 0, 200, 26, 1, 2000, 'TR Flash Roadkill', 'TR Flash Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200111, 1, 200111, 'NA', 200111, 0, 200, 26, 1, 2000, 'VS Friendly Flash Roadkill', 'VS Friendly Flash Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (200112, 2, 200112, 'NA', 200112, 0, 200, 26, 1, 2000, 'NC Friendly Flash Roadkill', 'NC Friendly Flash Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200113, 3, 200113, 'NA', 200113, 0, 200, 26, 1, 2000, 'TR Friendly Flash Roadkill', 'TR Friendly Flash Roadkill', 1);

	-- insert roadkill rows for sunderer
	insert into fkpk.v2_weapons values (200201, 1, 200201, 'NA', 200201, 0, 200, 26, 1, 2000, 'VS Sunderer Roadkill', 'VS Sunderer Roadkill', 1); 
	insert into fkpk.v2_weapons values (200202, 2, 200202, 'NA', 200202, 0, 200, 26, 1, 2000, 'NC Sunderer Roadkill', 'NC Sunderer Roadkill', 1);
	insert into fkpk.v2_weapons values (200203, 3, 200203, 'NA', 200203, 0, 200, 26, 1, 2000, 'TR Sunderer Roadkill', 'TR Sunderer Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200211, 1, 200211, 'NA', 200211, 0, 200, 26, 1, 2000, 'VS Friendly Sunderer Roadkill', 'VS Friendly Sunderer Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (200212, 2, 200212, 'NA', 200212, 0, 200, 26, 1, 2000, 'NC Friendly Sunderer Roadkill', 'NC Friendly Sunderer Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200213, 3, 200213, 'NA', 200213, 0, 200, 26, 1, 2000, 'TR Friendly Sunderer Roadkill', 'TR Friendly Sunderer Roadkill', 1);

	-- insert roadkill rows for lightning
	insert into fkpk.v2_weapons values (200301, 1, 200301, 'NA', 200301, 0, 200, 26, 1, 2000, 'VS Lightning Roadkill', 'VS Lightning Roadkill', 1); 
	insert into fkpk.v2_weapons values (200302, 2, 200302, 'NA', 200302, 0, 200, 26, 1, 2000, 'NC Lightning Roadkill', 'NC Lightning Roadkill', 1);
	insert into fkpk.v2_weapons values (200303, 3, 200303, 'NA', 200303, 0, 200, 26, 1, 2000, 'TR Lightning Roadkill', 'TR Lightning Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200311, 1, 200311, 'NA', 200311, 0, 200, 26, 1, 2000, 'VS Friendly Lightning Roadkill', 'VS Friendly Lightning Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (200312, 2, 200312, 'NA', 200312, 0, 200, 26, 1, 2000, 'NC Friendly Lightning Roadkill', 'NC Friendly Lightning Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200313, 3, 200313, 'NA', 200313, 0, 200, 26, 1, 2000, 'TR Friendly Lightning Roadkill', 'TR Friendly Lightning Roadkill', 1);

	-- insert roadkill rows for MBT
	insert into fkpk.v2_weapons values (200401, 1, 200401, 'NA', 200401, 0, 200, 26, 1, 2000, 'VS Magrider Roadkill', 'VS Magrider Roadkill', 1); 
	insert into fkpk.v2_weapons values (200502, 2, 200502, 'NA', 200502, 0, 200, 26, 1, 2000, 'NC Vanguard Roadkill', 'NC Vanguard Roadkill', 1);
	insert into fkpk.v2_weapons values (200603, 3, 200603, 'NA', 200603, 0, 200, 26, 1, 2000, 'TR Prowler Roadkill', 'TR Prowler Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200411, 1, 200411, 'NA', 200411, 0, 200, 26, 1, 2000, 'VS Friendly Magrider Roadkill', 'VS Friendly Magrider Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (200512, 2, 200512, 'NA', 200512, 0, 200, 26, 1, 2000, 'NC Friendly Vanguard Roadkill', 'NC Friendly Vanguard Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200613, 3, 200613, 'NA', 200613, 0, 200, 26, 1, 2000, 'TR Friendly Prowler Roadkill', 'TR Friendly Prowler Roadkill', 1);

	-- insert roadkill rows for ESF
	insert into fkpk.v2_weapons values (200701, 1, 200701, 'NA', 200701, 0, 200, 26, 1, 2000, 'VS Scythe Roadkill', 'VS Scythe Roadkill', 1); 
	insert into fkpk.v2_weapons values (200802, 2, 200802, 'NA', 200802, 0, 200, 26, 1, 2000, 'NC Reaver Roadkill', 'NC Reaver Roadkill', 1);
	insert into fkpk.v2_weapons values (200903, 3, 200903, 'NA', 200903, 0, 200, 26, 1, 2000, 'TR Mosquito Roadkill', 'TR Mosquito Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200711, 1, 200711, 'NA', 200711, 0, 200, 26, 1, 2000, 'VS Friendly Scythe Roadkill', 'VS Friendly Scythe Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (200812, 2, 200812, 'NA', 200812, 0, 200, 26, 1, 2000, 'NC Friendly Reaver Roadkill', 'NC Friendly Reaver Roadkill', 1);
	-- insert into fkpk.v2_weapons values (200913, 3, 200913, 'NA', 200913, 0, 200, 26, 1, 2000, 'TR Friendly Mosquito Roadkill', 'TR Friendly Mosquito Roadkill', 1);

	-- insert roadkill rows for Liberator
	insert into fkpk.v2_weapons values (201001, 1, 201001, 'NA', 201001, 0, 200, 26, 1, 2000, 'VS Liberator Roadkill', 'VS Liberator Roadkill', 1); 
	insert into fkpk.v2_weapons values (201002, 2, 201002, 'NA', 201002, 0, 200, 26, 1, 2000, 'NC Liberator Roadkill', 'NC Liberator Roadkill', 1);
	insert into fkpk.v2_weapons values (201003, 3, 201003, 'NA', 201003, 0, 200, 26, 1, 2000, 'TR Liberator Roadkill', 'TR Liberator Roadkill', 1);
	-- insert into fkpk.v2_weapons values (201011, 1, 201011, 'NA', 201011, 0, 200, 26, 1, 2000, 'VS Friendly Liberator Roadkill', 'VS Friendly Liberator Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (201012, 2, 201012, 'NA', 201012, 0, 200, 26, 1, 2000, 'NC Friendly Liberator Roadkill', 'NC Friendly Liberator Roadkill', 1);
	-- insert into fkpk.v2_weapons values (201013, 3, 201013, 'NA', 201013, 0, 200, 26, 1, 2000, 'TR Friendly Liberator Roadkill', 'TR Friendly Liberator Roadkill', 1);
	
	-- insert roadkill rows for Galaxy
	insert into fkpk.v2_weapons values (201101, 1, 201101, 'NA', 201101, 0, 200, 26, 1, 2000, 'VS Galaxy Roadkill', 'VS Galaxy Roadkill', 1); 
	insert into fkpk.v2_weapons values (201102, 2, 201102, 'NA', 201102, 0, 200, 26, 1, 2000, 'NC Galaxy Roadkill', 'NC Galaxy Roadkill', 1);
	insert into fkpk.v2_weapons values (201103, 3, 201103, 'NA', 201103, 0, 200, 26, 1, 2000, 'TR Galaxy Roadkill', 'TR Galaxy Roadkill', 1);
	-- insert into fkpk.v2_weapons values (201111, 1, 201111, 'NA', 201111, 0, 200, 26, 1, 2000, 'VS Friendly Galaxy Roadkill', 'VS Friendly Galaxy Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (201112, 2, 201112, 'NA', 201112, 0, 200, 26, 1, 2000, 'NC Friendly Galaxy Roadkill', 'NC Friendly Galaxy Roadkill', 1);
	-- insert into fkpk.v2_weapons values (201113, 3, 201113, 'NA', 201113, 0, 200, 26, 1, 2000, 'TR Friendly Galaxy Roadkill', 'TR Friendly Galaxy Roadkill', 1);

	-- insert roadkill rows for Harasser
	insert into fkpk.v2_weapons values (201201, 1, 201201, 'NA', 201201, 0, 200, 26, 1, 2000, 'VS Harasser Roadkill', 'VS Harasser Roadkill', 1); 
	insert into fkpk.v2_weapons values (201202, 2, 201202, 'NA', 201202, 0, 200, 26, 1, 2000, 'NC Harasser Roadkill', 'NC Harasser Roadkill', 1);
	insert into fkpk.v2_weapons values (201203, 3, 201203, 'NA', 201203, 0, 200, 26, 1, 2000, 'TR Harasser Roadkill', 'TR Harasser Roadkill', 1);
	-- insert into fkpk.v2_weapons values (201211, 1, 201211, 'NA', 201211, 0, 200, 26, 1, 2000, 'VS Friendly Harasser Roadkill', 'VS Friendly Harasser Roadkill', 1); 
	-- insert into fkpk.v2_weapons values (201212, 2, 201212, 'NA', 201212, 0, 200, 26, 1, 2000, 'NC Friendly Harasser Roadkill', 'NC Friendly Harasser Roadkill', 1);
	-- insert into fkpk.v2_weapons values (201213, 3, 201213, 'NA', 201213, 0, 200, 26, 1, 2000, 'TR Friendly Harasser Roadkill', 'TR Friendly Harasser Roadkill', 1);



	-- insert NS C-4 rows
	insert into fkpk.v2_weapons values (300001, 1, 300001, 'NA', 300001, 0, 18, 26, 40, 0, 'VS C-4', 'VS C-4', 1); 
	insert into fkpk.v2_weapons values (300002, 2, 300002, 'NA', 300002, 0, 18, 26, 40, 0, 'NC C-4', 'NC C-4', 1);
	insert into fkpk.v2_weapons values (300003, 3, 300003, 'NA', 300003, 0, 18, 26, 40, 0, 'TR C-4', 'TR C-4', 1);
	
	-- insert NS Tankmine rows
	insert into fkpk.v2_weapons values (300011, 1, 300011, 'NA', 300011, 0, 18, 26, 40, 0, 'VS Tank Mine', 'VS Tank Mine', 1); 
	insert into fkpk.v2_weapons values (300012, 2, 300012, 'NA', 300012, 0, 18, 26, 40, 0, 'NC Tank Mine', 'NC Tank Mine', 1);
	insert into fkpk.v2_weapons values (300013, 3, 300013, 'NA', 300013, 0, 18, 26, 40, 0, 'TR Tank Mine', 'TR Tank Mine', 1);

	-- insert NS Anti Vehilcle Grenade rows
	insert into fkpk.v2_weapons values (300021, 1, 300021, 'NA', 300021, 0, 17, 26, 40, 0, 'VS Anti Vehicle Grenade', 'VS Anti Vehicle Grenade', 1); 
	insert into fkpk.v2_weapons values (300022, 2, 300022, 'NA', 300022, 0, 17, 26, 40, 0, 'NC Anti Vehicle Grenade', 'NC Anti Vehicle Grenade', 1);
	insert into fkpk.v2_weapons values (300023, 3, 300023, 'NA', 300023, 0, 17, 26, 40, 0, 'TR Anti Vehicle Grenade', 'TR Anti Vehicle Grenade', 1);

	-- insert NS Decimator rows
	insert into fkpk.v2_weapons values (300101, 1, 300101, 'NA', 300101, 0, 13, 26, 1, 1507, 'VS Decimator', 'VS Decimator', 1); 
	insert into fkpk.v2_weapons values (300102, 2, 300102, 'NA', 300102, 0, 13, 26, 1, 1507, 'NC Decimator', 'NC Decimator', 1);
	insert into fkpk.v2_weapons values (300103, 3, 300103, 'NA', 300103, 0, 13, 26, 1, 1507, 'TR Decimator', 'TR Decimator', 1);

	-- insert NS Annihilator rows
	insert into fkpk.v2_weapons values (300201, 1, 300201, 'NA', 300201, 0, 13, 26, 1, 1508, 'VS Annihilator', 'VS Annihilator', 1); 
	insert into fkpk.v2_weapons values (300202, 2, 300202, 'NA', 300202, 0, 13, 26, 1, 1508, 'NC Annihilator', 'NC Annihilator', 1);
	insert into fkpk.v2_weapons values (300203, 3, 300203, 'NA', 300203, 0, 13, 26, 1, 1508, 'TR Annihilator', 'TR Annihilator', 1);

	-- insert NS-15M
	insert into fkpk.v2_weapons values (301001, 1, 301001, 'NA', 301001, 0, 6, 26, 1, 1522, 'VS NS-15M', 'VS NS-15M', 1); 
	insert into fkpk.v2_weapons values (301002, 2, 301002, 'NA', 301002, 0, 6, 26, 1, 1522, 'NC NS-15M', 'NC NS-15M', 1);
	insert into fkpk.v2_weapons values (301003, 3, 301003, 'NA', 301003, 0, 6, 26, 1, 1522, 'TR NS-15M', 'TR NS-15M', 1);

	-- insert NS-44
	insert into fkpk.v2_weapons values (301101, 1, 301101, 'NA', 301101, 0, 3, 26, 1, 1523, 'VS NS-44 Commissioner', 'VS NS-44 Commissioner', 1); 
	insert into fkpk.v2_weapons values (301102, 2, 301102, 'NA', 301102, 0, 3, 26, 1, 1523, 'NC NS-44 Commissioner', 'NC NS-44 Commissioner', 1);
	insert into fkpk.v2_weapons values (301103, 3, 301103, 'NA', 301103, 0, 3, 26, 1, 1523, 'TR NS-44 Commissioner', 'TR NS-44 Commissioner', 1);

	-- insert NS-357
	insert into fkpk.v2_weapons values (301201, 1, 301201, 'NA', 301201, 0, 3, 26, 1, 1524, 'VS NS-357 Underboss', 'VS NS-357 Underboss', 1); 
	insert into fkpk.v2_weapons values (301202, 2, 301202, 'NA', 301202, 0, 3, 26, 1, 1524, 'NC NS-357 Underboss', 'NC NS-357 Underboss', 1);
	insert into fkpk.v2_weapons values (301203, 3, 301203, 'NA', 301203, 0, 3, 26, 1, 1524, 'TR NS-357 Underboss', 'TR NS-357 Underboss', 1);

	-- insert NS-7 PDW
	insert into fkpk.v2_weapons values (301301, 1, 301301, 'NA', 301301, 0, 5, 26, 1, 1556, 'VS NS-7 PDW', 'VS NS-7 PDW', 1); 
	insert into fkpk.v2_weapons values (301302, 2, 301302, 'NA', 301302, 0, 5, 26, 1, 1556, 'NC NS-7 PDW', 'NC NS-7 PDW', 1);
	insert into fkpk.v2_weapons values (301303, 3, 301303, 'NA', 301303, 0, 5, 26, 1, 1556, 'TR NS-7 PDW', 'TR NS-7 PDW', 1);
	
	-- insert NS-11A
	insert into fkpk.v2_weapons values (301401, 1, 301401, 'NA', 301401, 0, 7, 26, 1, 1503, 'VS NS-11A', 'VS NS-11A', 1); 
	insert into fkpk.v2_weapons values (301402, 2, 301402, 'NA', 301402, 0, 7, 26, 1, 1503, 'NC NS-11A', 'NC NS-11A', 1);
	insert into fkpk.v2_weapons values (301403, 3, 301403, 'NA', 301403, 0, 7, 26, 1, 1503, 'TR NS-11A', 'TR NS-11A', 1);

	-- insert NS-11C
	insert into fkpk.v2_weapons values (301501, 1, 301501, 'NA', 301501, 0, 8, 26, 1, 1521, 'VS NS-11C', 'VS NS-11C', 1); 
	insert into fkpk.v2_weapons values (301502, 2, 301502, 'NA', 301502, 0, 8, 26, 1, 1521, 'NC NS-11C', 'NC NS-11C', 1);
	insert into fkpk.v2_weapons values (301503, 3, 301503, 'NA', 301503, 0, 8, 26, 1, 1521, 'TR NS-11C', 'TR NS-11C', 1);

	-- insert NS Crossbow
	insert into fkpk.v2_weapons values (301601, 1, 301601, 'NA', 301601, 0, 3, 26, 1, 1561, 'VS Hunter QCX', 'VS Hunter QCX', 1); 
	insert into fkpk.v2_weapons values (301602, 2, 301602, 'NA', 301602, 0, 3, 26, 1, 1561, 'NC Hunter QCX', 'NC Hunter QCX', 1); 
	insert into fkpk.v2_weapons values (301603, 3, 301603, 'NA', 301603, 0, 3, 26, 1, 1561, 'TR Hunter QCX', 'TR Hunter QCX', 1); 

	-- insert MKV Supressed
	insert into fkpk.v2_weapons values (301701, 1, 301701, 'NA', 301701, 0, 5, 26, 1, 1564, 'VS MKV Suppressed', 'VS MKV Suppressed', 1); 
	insert into fkpk.v2_weapons values (301702, 2, 301702, 'NA', 301702, 0, 5, 26, 1, 1564, 'NC MKV Suppressed', 'NC MKV Suppressed', 1); 
	insert into fkpk.v2_weapons values (301703, 3, 301703, 'NA', 301703, 0, 5, 26, 1, 1564, 'TR MKV Suppressed', 'TR MKV Suppressed', 1); 

	-- insert NS-30 Vandal
	insert into fkpk.v2_weapons values (301801, 1, 301801, 'NA', 301801, 0, 12, 26, 1, 1560, 'VS NS-30 Vandal', 'VS NS-30 Vandal', 1); 
	insert into fkpk.v2_weapons values (301802, 2, 301802, 'NA', 301802, 0, 12, 26, 1, 1560, 'NC NS-30 Vandal', 'NC NS-30 Vandal', 1); 
	insert into fkpk.v2_weapons values (301803, 3, 301803, 'NA', 301803, 0, 12, 26, 1, 1560, 'TR NS-30 Vandal', 'TR NS-30 Vandal', 1); 
	


	
	-- insert vehicle suicide, vehicle collision, create weapon categories
	insert into fkpk.v2_weapons values (666666, 0, 666666, 'NA', 666666, 0, 201, 26, 1, 2001, 'Vehicle Suicide', 'Vehicle Suicide', 1);
	
	insert into fkpk.v2_weapons values (777776, 0, 777776, 'NA', 777777, 0, 202, 26, 1, 2002, 'Friendly Collision', 'Friendly Collision', 1);
	insert into fkpk.v2_weapons values (777777, 0, 777777, 'NA', 777777, 0, 202, 26, 1, 2002, 'Vehicle Collision', 'Vehicle Collision', 1);
	
	-- update weapon categories
	insert into fkpk.v2_weapon_categories values (200, 'Roadkills');
	insert into fkpk.v2_weapon_categories values (201, 'Suicide');
	insert into fkpk.v2_weapon_categories values (202, 'Collision');


	-- delete unused weapons
	delete from fkpk.v2_weapons where id IN (7,93, 94, 95 ,99, 100, 101, 124, 125, 126, 153, 309, 376, 377);
	delete from fkpk.v2_weapons where id between 471 and 487;
	delete from fkpk.v2_weapons where id IN (883,884);
	delete from fkpk.v2_weapons where id between 1252 and 1630;
	delete from fkpk.v2_weapons where id IN (6010, 6011, 6012, 6050, 7609, 7610, 7611, 7755);
	delete from fkpk.v2_weapons where id IN (200, 201, 202, 500, 557, 724, 725, 726, 727, 730);
	delete from fkpk.v2_weapons where id IN (44503, 44506, 44700, 44701, 44702, 44704, 70963, 70964, 71563, 71564, 71565, 75285, 75286, 75287, 75288, 75289);

	
	-- rename weapons below for faction naming

	-- Mana turrets
	update fkpk.v2_weapons set name = 'VS MANA Anti-Vehicle Turret' where id = 501;
	update fkpk.v2_weapons set name = 'NC MANA Anti-Vehicle Turret' where id = 502;
	update fkpk.v2_weapons set name = 'TR MANA Anti-Vehicle Turret' where id = 503;
	
	update fkpk.v2_weapons set name = 'VS MANA Anti-Personnel Turret' where id = 554;
	update fkpk.v2_weapons set name = 'NC MANA Anti-Personnel Turret' where id = 555;
	update fkpk.v2_weapons set name = 'TR MANA Anti-Personnel Turret' where id = 556;

	-- Turrets
	update fkpk.v2_weapons set name = 'VS Xiphos Phalanx Turret (Anti-Personnel)' where id = 551;
	update fkpk.v2_weapons set name = 'NC Xiphos Phalanx Turret (Anti-Personnel)' where id = 552;
	update fkpk.v2_weapons set name = 'TR Xiphos Phalanx Turret (Anti-Personnel)' where id = 553;
	update fkpk.v2_weapons set name = 'VS Aspis Phalanx Turret (Anti-Aircraft)' where id = 700;
	update fkpk.v2_weapons set name = 'NC Aspis Phalanx Turret (Anti-Aircraft)' where id = 701;
	update fkpk.v2_weapons set name = 'TR Aspis Phalanx Turret (Anti-Aircraft)' where id = 702;
	update fkpk.v2_weapons set name = 'VS Spear Phalanx Turret (Anti-Vehicle)' where id = 703;
	update fkpk.v2_weapons set name = 'NC Spear Phalanx Turret (Anti-Vehicle)' where id = 704;
	update fkpk.v2_weapons set name = 'TR Spear Phalanx Turret (Anti-Vehicle)' where id = 705;
	
	-- Sticky Grenades
	update fkpk.v2_weapons set name = 'NC Sticky Grenade' where id = 880;
	update fkpk.v2_weapons set name = 'TR Sticky Grenade' where id = 881;
	update fkpk.v2_weapons set name = 'VS Sticky Grenade' where id = 882;

	-- MAX punch
	update fkpk.v2_weapons set name = 'NC MAX Punch' where id = 1082;
	update fkpk.v2_weapons set name = 'TR MAX Punch' where id = 1083;
	update fkpk.v2_weapons set name = 'VS MAX Punch' where id = 1084;
	
	-- rename flash weapons
	update fkpk.v2_weapons set name = 'VS M12 Kobalt-F' where id = 2500;
	update fkpk.v2_weapons set name = 'NC M12 Kobalt-F' where id = 2501;
	update fkpk.v2_weapons set name = 'TR M12 Kobalt-F' where id = 2502;
	
	update fkpk.v2_weapons set name = 'VS M20 Basilisk-F' where id = 2507;
	update fkpk.v2_weapons set name = 'NC M20 Basilisk-F' where id = 2508;
	update fkpk.v2_weapons set name = 'TR M20 Basilisk-F' where id = 2509;
	
	update fkpk.v2_weapons set name = 'VS M40 Fury-F' where id = 2510;
	update fkpk.v2_weapons set name = 'NC M40 Fury-F' where id = 2511;
	update fkpk.v2_weapons set name = 'TR M40 Fury-F' where id = 2512;
	
	update fkpk.v2_weapons set name = 'VS S12 Renegade' where id = 2657;
	update fkpk.v2_weapons set name = 'NC S12 Renegade' where id = 2658;
	update fkpk.v2_weapons set name = 'TR S12 Renegade' where id = 2659;

	-- rename sunderer front/back weapons
	update fkpk.v2_weapons set name = 'VS M12 Kobalt-SundFr' where id = 2800;
	update fkpk.v2_weapons set name = 'NC M12 Kobalt-SundFr' where id = 2801;
	update fkpk.v2_weapons set name = 'TR M12 Kobalt-SundFr' where id = 2802;

	update fkpk.v2_weapons set name = 'VS M20 Basilisk-SundFr' where id = 2803;
	update fkpk.v2_weapons set name = 'NC M20 Basilisk-SundFr' where id = 2804;
	update fkpk.v2_weapons set name = 'TR M20 Basilisk-SundFr' where id = 2805;

	update fkpk.v2_weapons set name = 'VS M12 Kobalt-SundBk' where id = 2806;
	update fkpk.v2_weapons set name = 'NC M12 Kobalt-SundBk' where id = 2807;
	update fkpk.v2_weapons set name = 'TR M12 Kobalt-SundBk' where id = 2808;

	update fkpk.v2_weapons set name = 'VS M20 Basilisk-SundBk' where id = 2809;
	update fkpk.v2_weapons set name = 'NC M20 Basilisk-SundBk' where id = 2810;
	update fkpk.v2_weapons set name = 'TR M20 Basilisk-SundBk' where id = 2811;

	update fkpk.v2_weapons set name = 'VS M60-G Bulldog-SundFr' where id = 2832;
	update fkpk.v2_weapons set name = 'NC M60-G Bulldog-SundFr' where id = 2833;
	update fkpk.v2_weapons set name = 'TR M60-G Bulldog-SundFr' where id = 2834;

	update fkpk.v2_weapons set name = 'VS M60-G Bulldog-SundBk' where id = 2835;
	update fkpk.v2_weapons set name = 'NC M60-G Bulldog-SundBk' where id = 2836;
	update fkpk.v2_weapons set name = 'TR M60-G Bulldog-SundBk' where id = 2837;
	
	update fkpk.v2_weapons set name = 'VS M40 Fury-SundFr' where id = 2874;
	update fkpk.v2_weapons set name = 'NC M40 Fury-SundFr' where id = 2875;
	update fkpk.v2_weapons set name = 'TR M40 Fury-SundFr' where id = 2876;

	update fkpk.v2_weapons set name = 'VS M40 Fury-SundBk' where id = 2877;
	update fkpk.v2_weapons set name = 'NC M40 Fury-SundBk' where id = 2878;
	update fkpk.v2_weapons set name = 'TR M40 Fury-SundBk' where id = 2879;

	update fkpk.v2_weapons set name = 'VS G30 Walker-SundFr' where id = 3080;
	update fkpk.v2_weapons set name = 'NC G30 Walker-SundFr' where id = 3081;
	update fkpk.v2_weapons set name = 'TR G30 Walker-SundFr' where id = 3082;

	update fkpk.v2_weapons set name = 'VS G30 Walker-SundBk' where id = 3083;
	update fkpk.v2_weapons set name = 'NC G30 Walker-SundBk' where id = 3084;
	update fkpk.v2_weapons set name = 'TR G30 Walker-SundBk' where id = 3085;

	update fkpk.v2_weapons set name = 'VS G40-F Ranger-SundFr' where id = 3086;
	update fkpk.v2_weapons set name = 'NC G40-F Ranger-SundFr' where id = 3087;
	update fkpk.v2_weapons set name = 'TR G40-F Ranger-SundFr' where id = 3088;

	update fkpk.v2_weapons set name = 'VS G40-F Ranger-SundBk' where id = 3089;
	update fkpk.v2_weapons set name = 'NC G40-F Ranger-SundBk' where id = 3090;
	update fkpk.v2_weapons set name = 'TR G40-F Ranger-SundBk' where id = 3091;

	-- rename lightning weapons
	update fkpk.v2_weapons set name = 'VS C75 Viper' where id = 3100;
	update fkpk.v2_weapons set name = 'NC C75 Viper' where id = 3101;
	update fkpk.v2_weapons set name = 'TR C75 Viper' where id = 3102;

	update fkpk.v2_weapons set name = 'VS L100 Python AP' where id = 3103;
	update fkpk.v2_weapons set name = 'NC L100 Python AP' where id = 3104;
	update fkpk.v2_weapons set name = 'TR L100 Python AP' where id = 3105;

	update fkpk.v2_weapons set name = 'VS Skyguard' where id = 3106;
	update fkpk.v2_weapons set name = 'NC Skyguard' where id = 3107;
	update fkpk.v2_weapons set name = 'TR Skyguard' where id = 3108;

	update fkpk.v2_weapons set name = 'VS L100 Python HE' where id = 3153;
	update fkpk.v2_weapons set name = 'NC L100 Python HE' where id = 3154;
	update fkpk.v2_weapons set name = 'TR L100 Python HE' where id = 3155;

	update fkpk.v2_weapons set name = 'VS L100 Python HEAT' where id = 3156;
	update fkpk.v2_weapons set name = 'NC L100 Python HEAT' where id = 3157;
	update fkpk.v2_weapons set name = 'TR L100 Python HEAT' where id = 3158;

	-- rename magrider seconary weapons
	update fkpk.v2_weapons set name = 'VS M12 Kobalt-MBT' where id = 3401;
	update fkpk.v2_weapons set name = 'VS M20 Basilisk-MBT' where id = 3402;
	update fkpk.v2_weapons set name = 'VS G30 Walker-MBT' where id = 3403;
	update fkpk.v2_weapons set name = 'VS G40-F Ranger-MBT' where id = 3406;
	update fkpk.v2_weapons set name = 'VS E540 Halberd-MBT' where id = 3441;

	-- rename vanguard seconary weapons
	update fkpk.v2_weapons set name = 'NC M12 Kobalt-MBT' where id = 3701;
	update fkpk.v2_weapons set name = 'NC M20 Basilisk-MBT' where id = 3702;
	update fkpk.v2_weapons set name = 'NC G30 Walker-MBT' where id = 3703;
	update fkpk.v2_weapons set name = 'NC G40-F Ranger-MBT' where id = 3708;
	update fkpk.v2_weapons set name = 'NC E540 Halberd-MBT' where id = 3709;

	-- rename prowler seconary weapons
	update fkpk.v2_weapons set name = 'TR M12 Kobalt-MBT' where id = 4001;
	update fkpk.v2_weapons set name = 'TR M20 Basilisk-MBT' where id = 4002;
	update fkpk.v2_weapons set name = 'TR G30 Walker-MBT' where id = 4003;
	update fkpk.v2_weapons set name = 'TR G40-F Ranger-MBT' where id = 4010;
	update fkpk.v2_weapons set name = 'TR E540 Halberd-MBT' where id = 4015;

	-- rename ESF hornet coyote
	update fkpk.v2_weapons set name = 'VS Hornet Missiles' where id = 4446;
	update fkpk.v2_weapons set name = 'VS Coyote Missiles' where id = 4447;
	update fkpk.v2_weapons set name = 'NC Hornet Missiles' where id = 4746;
	update fkpk.v2_weapons set name = 'NC Coyote Missiles' where id = 4747;
	update fkpk.v2_weapons set name = 'TR Hornet Missiles' where id = 5051;
	update fkpk.v2_weapons set name = 'TR Coyote Missiles' where id = 5052;
	
	-- rename liberator weapons
	update fkpk.v2_weapons set name = 'VS M20 Drake-Lib' where id = 5204;
	update fkpk.v2_weapons set name = 'NC M20 Drake-Lib' where id = 5202;
	update fkpk.v2_weapons set name = 'TR M20 Drake-Lib' where id = 5200;

	update fkpk.v2_weapons set name = 'VS L30R Vektor' where id = 5208;
	update fkpk.v2_weapons set name = 'NC L30R Vektor' where id = 5207;
	update fkpk.v2_weapons set name = 'TR L30R Vektor' where id = 5206;

	update fkpk.v2_weapons set name = 'VS AP30 Shredder' where id = 5211;
	update fkpk.v2_weapons set name = 'NC AP30 Shredder' where id = 5210;
	update fkpk.v2_weapons set name = 'TR AP30 Shredder' where id = 5209;

	update fkpk.v2_weapons set name = 'VS A30 Walker-Lib' where id = 5212;
	update fkpk.v2_weapons set name = 'NC A30 Walker-Lib' where id = 5213;
	update fkpk.v2_weapons set name = 'TR A30 Walker-Lib' where id = 5214;

	update fkpk.v2_weapons set name = 'VS CAS30 Tank Buster' where id = 5215;
	update fkpk.v2_weapons set name = 'NC CAS30 Tank Buster' where id = 5216;
	update fkpk.v2_weapons set name = 'TR CAS30 Tank Buster' where id = 5217;

	update fkpk.v2_weapons set name = 'VS L-24R Spur' where id = 5218;
	update fkpk.v2_weapons set name = 'NC L-24R Spur' where id = 5219;
	update fkpk.v2_weapons set name = 'TR L-24R Spur' where id = 5220;

	update fkpk.v2_weapons set name = 'VS M60-A Bulldog-Lib' where id = 5221;
	update fkpk.v2_weapons set name = 'NC M60-A Bulldog-Lib' where id = 5222;
	update fkpk.v2_weapons set name = 'TR M60-A Bulldog-Lib' where id = 5223;

	update fkpk.v2_weapons set name = 'VS C150 Dalton' where id = 5224;
	update fkpk.v2_weapons set name = 'NC C150 Dalton' where id = 5225;
	update fkpk.v2_weapons set name = 'TR C150 Dalton' where id = 5226;

	update fkpk.v2_weapons set name = 'VS Z105 Zepher' where id = 5227;
	update fkpk.v2_weapons set name = 'NC Z105 Zepher' where id = 5228;
	update fkpk.v2_weapons set name = 'TR Z105 Zepher' where id = 5229;

	update fkpk.v2_weapons set name = 'VS Z105 Zepher PX' where id = 5250;
	update fkpk.v2_weapons set name = 'NC Z105 Zepher PX' where id = 5251;
	update fkpk.v2_weapons set name = 'TR Z105 Zepher PX' where id = 5252;

	update fkpk.v2_weapons set name = 'VS Dual-75 Duster' where id = 5441;
	update fkpk.v2_weapons set name = 'NC Dual-75 Duster' where id = 5442;
	update fkpk.v2_weapons set name = 'TR Dual-75 Duster' where id = 5443;

	update fkpk.v2_weapons set name = 'VS Hyena Missile Launcher' where id = 5494;
	update fkpk.v2_weapons set name = 'NC Hyena Missile Launcher' where id = 5495;
	update fkpk.v2_weapons set name = 'TR Hyena Missile Launcher' where id = 5496;

	-- rename galaxy weapons
	update fkpk.v2_weapons set name = 'VS M20 Drake-GalTop' where id = 5500;
	update fkpk.v2_weapons set name = 'VS M20 Drake-GalTail' where id = 5501;
	update fkpk.v2_weapons set name = 'VS M20 Drake-GalLeft' where id = 5502;
	update fkpk.v2_weapons set name = 'VS M20 Drake-GalRight' where id = 5503;
	update fkpk.v2_weapons set name = 'NC M20 Drake-GalTop' where id = 5504;
	update fkpk.v2_weapons set name = 'NC M20 Drake-GalTail' where id = 5505;
	update fkpk.v2_weapons set name = 'NC M20 Drake-GalLeft' where id = 5506;
	update fkpk.v2_weapons set name = 'NC M20 Drake-GalRight' where id = 5507;
	update fkpk.v2_weapons set name = 'TR M20 Drake-GalTop' where id = 5508;
	update fkpk.v2_weapons set name = 'TR M20 Drake-GalTail' where id = 5509;
	update fkpk.v2_weapons set name = 'TR M20 Drake-GalLeft' where id = 5510;
	update fkpk.v2_weapons set name = 'TR M20 Drake-GalRight' where id = 5511;

	update fkpk.v2_weapons set name = 'VS A30 Walker-GalTop' where id = 5512;
	update fkpk.v2_weapons set name = 'VS A30 Walker-GalTail' where id = 5513;
	update fkpk.v2_weapons set name = 'VS M60-A Bulldog-GalLeft' where id = 5514;
	update fkpk.v2_weapons set name = 'VS M60-A Bulldog-GalRight' where id = 5515;
	update fkpk.v2_weapons set name = 'NC A30 Walker-GalTop' where id = 5516;
	update fkpk.v2_weapons set name = 'NC A30 Walker-GalTail' where id = 5517;
	update fkpk.v2_weapons set name = 'NC M60-A Bulldog-GalLeft' where id = 5518;
	update fkpk.v2_weapons set name = 'NC M60-A Bulldog-GalRight' where id = 5519;
	update fkpk.v2_weapons set name = 'TR A30 Walker-GalTop' where id = 5520;
	update fkpk.v2_weapons set name = 'TR A30 Walker-GalTail' where id = 5521;
	update fkpk.v2_weapons set name = 'TR M60-A Bulldog-GalLeft' where id = 5522;
	update fkpk.v2_weapons set name = 'TR M60-A Bulldog-GalRight' where id = 5523;

	-- rename harasser weapons
	update fkpk.v2_weapons set name = 'VS M12 Kobalt-H' where id = 6100;
	update fkpk.v2_weapons set name = 'NC M12 Kobalt-H' where id = 6101;
	update fkpk.v2_weapons set name = 'TR M12 Kobalt-H' where id = 6102;

	update fkpk.v2_weapons set name = 'VS M20 Basilisk-H' where id = 6103;
	update fkpk.v2_weapons set name = 'NC M20 Basilisk-H' where id = 6104;
	update fkpk.v2_weapons set name = 'TR M20 Basilisk-H' where id = 6105;

	update fkpk.v2_weapons set name = 'VS A30 Walker-H' where id = 6106;
	update fkpk.v2_weapons set name = 'NC A30 Walker-H' where id = 6107;
	update fkpk.v2_weapons set name = 'TR A30 Walker-H' where id = 6108;

	update fkpk.v2_weapons set name = 'VS G40-F Ranger-H' where id = 6109;
	update fkpk.v2_weapons set name = 'NC G40-F Ranger-H' where id = 6110;
	update fkpk.v2_weapons set name = 'TR G40-F Ranger-H' where id = 6111;

	update fkpk.v2_weapons set name = 'VS M60-G Bulldog-H' where id = 6112;
	update fkpk.v2_weapons set name = 'NC M60-G Bulldog-H' where id = 6113;
	update fkpk.v2_weapons set name = 'TR M60-G Bulldog-H' where id = 6114;

	update fkpk.v2_weapons set name = 'VS M40 Fury-H' where id = 6115;
	update fkpk.v2_weapons set name = 'NC M40 Fury-H' where id = 6116;
	update fkpk.v2_weapons set name = 'TR M40 Fury-H' where id = 6117;

	update fkpk.v2_weapons set name = 'VS E540 Halberd-H' where id = 6118;
	update fkpk.v2_weapons set name = 'NC E540 Halberd-H' where id = 6119;
	update fkpk.v2_weapons set name = 'TR E540 Halberd-H' where id = 6120;

	-- rename MAX weapons to show arm
	update fkpk.v2_weapons set name = 'AF-34 Mattock-Left' where id = 7505;
	update fkpk.v2_weapons set name = 'AF-41 Hacksaw-Left' where id = 7506;
	update fkpk.v2_weapons set name = 'AF-23 Grinder-Left' where id = 7507;

	update fkpk.v2_weapons set name = 'M6 Onslaught-Left' where id = 7512;
	update fkpk.v2_weapons set name = 'M2 Mutilator-Left' where id = 7513;
	update fkpk.v2_weapons set name = 'MRC3 Mercy-Left' where id = 7518;

	update fkpk.v2_weapons set name = 'Nebular VM20-Left' where id = 7519;
	update fkpk.v2_weapons set name = 'Cosmos VM3-Left' where id = 7520;
	update fkpk.v2_weapons set name = 'Blueshift VM5-Left' where id = 7525;

	update fkpk.v2_weapons set name = 'M1 Heavy Cycler-Left' where id = 15000;
	update fkpk.v2_weapons set name = 'M3 Pounder HEG-Right' where id = 15001;
	update fkpk.v2_weapons set name = 'M1 Heavy Cycler-Right' where id = 15012;
	update fkpk.v2_weapons set name = 'M3 Pounder HEG-Left' where id = 15013;

	update fkpk.v2_weapons set name = 'M6 Onslaught-Right' where id = 15024;
	update fkpk.v2_weapons set name = 'M2 Mutilator-Right' where id = 15025;
	update fkpk.v2_weapons set name = 'MRC3 Mercy-Right' where id = 15030;

	update fkpk.v2_weapons set name = 'NCM1 Scattercannon-Left' where id = 16000;
	update fkpk.v2_weapons set name = 'NCM2 Falcon-Right' where id = 16001;
	update fkpk.v2_weapons set name = 'NCM1 Scattercannon-Right' where id = 16012;
	update fkpk.v2_weapons set name = 'NCM2 Falcon-Left' where id = 16013;

	update fkpk.v2_weapons set name = 'AF-34 Mattock-Right' where id = 16024;
	update fkpk.v2_weapons set name = 'AF-41 Hacksaw-Right' where id = 16025;
	update fkpk.v2_weapons set name = 'AF-23 Grinder-Right' where id = 16026;

	update fkpk.v2_weapons set name = 'NCM3 Raven-Left' where id = 16028;
	update fkpk.v2_weapons set name = 'NCM3 Raven-Right' where id = 16029;
	update fkpk.v2_weapons set name = 'MR1 Fracture-Left' where id = 16030;
	update fkpk.v2_weapons set name = 'MR1 Fracture-Right' where id = 16031;
	update fkpk.v2_weapons set name = 'Vortex VM21-Left' where id = 16032;
	update fkpk.v2_weapons set name = 'Vortex VM21-Right' where id = 16033;

	update fkpk.v2_weapons set name = 'Quasar VM1-Left' where id = 17000;
	update fkpk.v2_weapons set name = 'Comet VM2-Right' where id = 17001;
	update fkpk.v2_weapons set name = 'Quasar VM1-Right' where id = 17012;
	update fkpk.v2_weapons set name = 'Comet VM2-Left' where id = 17013;

	update fkpk.v2_weapons set name = 'Nebular VM20-Right' where id = 17024;
	update fkpk.v2_weapons set name = 'Cosmos VM3-Right' where id = 17025;
	update fkpk.v2_weapons set name = 'Blueshift VM5-Right' where id = 17030;

	-- rename MAX Bursters
	update fkpk.v2_weapons set name = 'TR NS-10 Burster-Right' where id = 15004;
	update fkpk.v2_weapons set name = 'TR NS-10 Burster-Left' where id = 15016;
	update fkpk.v2_weapons set name = 'NC NS-10 Burster-Right' where id = 16004;
	update fkpk.v2_weapons set name = 'NC NS-10 Burster-Left' where id = 16016;
	update fkpk.v2_weapons set name = 'VS NS-10 Burster-Right' where id = 17004;
	update fkpk.v2_weapons set name = 'VS NS-10 Burster-Left' where id = 17016;

	-- rename Frag Grenade
	update fkpk.v2_weapons set name = 'NC Frag Grenade' where id = 44505;
	update fkpk.v2_weapons set name = 'TR Frag Grenade' where id = 44605;
	update fkpk.v2_weapons set name = 'VS Frag Grenade' where id = 44705;

	-- rename NS Sniper Rifles
	-- update fkpk.v2_weapons set name = 'NC Frag Grenade' where id = 44505;
	-- update fkpk.v2_weapons set name = 'TR Frag Grenade' where id = 44605;
	-- update fkpk.v2_weapons set name = 'VS Frag Grenade' where id = 44705;

END