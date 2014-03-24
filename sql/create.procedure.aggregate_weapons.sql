DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `aggregate_weapons`(in period int(11), in starting_timestamp int(11), in ending_timestamp int(11))
BEGIN

	declare w int;
	declare w_name varchar(45);
	
	DECLARE no_more_rows BOOLEAN;

	declare weapons cursor for select id from fkpk.v2_weapons where is_killer=1 order by id asc;

	DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET no_more_rows = TRUE;
	
	open weapons;
	
	do_loop: loop
		fetch weapons into w;

		IF no_more_rows THEN
			CLOSE weapons;
			LEAVE do_loop;
		END IF;
		call fkpk.master_pull(w, starting_timestamp, ending_timestamp, @kills, @uniques, @kpu, @kpu_stddev, @avgbr, @q1kpu, @q2kpu, @q3kpu, @q4kpu, @headshot);
	
		
		select name into w_name from fkpk.v2_weapons where id = w; 
		
		insert into fkpk.v2_kills_vkpu_aggregates
		values (w, period, starting_timestamp, ending_timestamp, w_name, @kills, @uniques, @kpu, @kpu_stddev, @avgbr, @q1kpu, @q2kpu, @q3kpu, @q4kpu, @headshot, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

		-- Separate MBT weapons collections
		if w = 3400 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3460 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3461 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3442 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3404 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3441 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3402 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3401 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;
		
		if w = 3700 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3730 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3731 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3704 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3707 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3709 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;
		
		if w = 3702 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 3701 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4000 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4008 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4009 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4029 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4007 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4015 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4002 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;

		if w = 4001 then
			-- insert into fkpk.v2_br_temp (attacker_br_value, br_value_count) select attacker_br_value, count(*) as br_value_count from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			-- update fkpk.v2_br_temp set id = w, period_1 = period, starting_timestmp = starting_timestamp, ending_timestmp = ending_timestamp, weap_name = w_name where id IS NULL;
			-- insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w group by attacker_br_value order by attacker_br_value asc;
			replace into fkpk.v2_uniques_temp (item_id, attacker_character_id) select attacker_weapon_id, attacker_character_id from fkpk.v2_kills where attacker_weapon_id = w and attacker_br_value >10;
			insert into fkpk.v2_uniques_temp2 select distinct(attacker_character_id), attacker_br_value, period, w from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp;
			insert into fkpk.v2_br_temp select w, period, w_name, attacker_br_value, count(*) from fkpk.v2_kills where attacker_weapon_id = w and timestamp between starting_timestamp and ending_timestamp group by attacker_br_value order by attacker_br_value asc;

		end if;
	
		-- insert into fkpk.v2_kill_aggregates
		-- values (w, period, starting_timestamp, ending_timestamp, @kills, @uniques, @kpu, @avgbr, @q1kpu, @q2kpu, @q3kpu, @q4kpu, @headshot);
	
end loop;

END$$
DELIMITER ;

