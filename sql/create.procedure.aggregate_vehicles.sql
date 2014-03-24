-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`fkpk`@`%` PROCEDURE `aggregate_vehicles`(in period int(11), in starting_timestamp int(11), in ending_timestamp int(11))
BEGIN
    
	declare w int;
	declare v int;
    declare vf int;

	declare w_name varchar(45);
	 
	declare weapons cursor for select id from fkpk.v2_weapons where is_killer=1 order by id asc;

	set vf = 1;
	set v = 1;	

	faction_loop: loop
			
		vehicle_loop: loop

			open weapons;

			do_loop: loop

				-- check if VS and Vanguard
				If vf = 1 and v = 5 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if VS and Prowler
				If vf = 1 and v = 6 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if VS and Reaver
				If vf = 1 and v = 8 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if VS and Mossy
				If vf = 1 and v = 9 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if NC and Magrider
				If vf = 2 and v = 4 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if NC and Prowler
				If vf = 2 and v = 6 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if NC and Scythe
				If vf = 2 and v = 7 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if NC and Mossy
				If vf = 2 and v = 9 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if TR and Magrider
				If vf = 3 and v = 4 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if TR and Vanguard
				If vf = 3 and v = 5 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if TR and Scythe
				If vf = 3 and v = 7 then
					CLOSE weapons;
					leave do_loop;
				end if;

				-- check if TR and Reaver
				If vf = 3 and v = 8 then
					CLOSE weapons;
					leave do_loop;
				end if;

				fetch weapons into w;
												
				call fkpk.vehicle_master_pull(w, vf, v, starting_timestamp, ending_timestamp, @deaths, @q1deaths, @q2deaths, @q3deaths, @q4deaths);
	
				select name into w_name from fkpk.v2_weapons where id = w; 

				insert into fkpk.v2_vehicle_aggregates
				values (w, period, vf, v, w_name, @deaths, @q1deaths, @q2deaths, @q3deaths, @q4deaths, starting_timestamp, ending_timestamp);
				
				-- IF weapons finished then
				IF w = 777777 THEN
					CLOSE weapons;
					LEAVE do_loop;
				END IF;


			end loop;
		
			set v=v+1;
	
			If v = 13 then
				set v = 1;
				leave vehicle_loop;
			end if;
				
		end loop;

		-- increment faction #
		set vf = vf+1;

		If vf = 4 then
			leave faction_loop;
		end if;

		
-- end of faction loop	

end loop;

END