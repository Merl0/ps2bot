-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`fkpk`@`%` PROCEDURE `aggregate_vehicle_uniques`(in period int(11), in starting_timestamp int(11), in ending_timestamp int(11))
BEGIN
    
	
	declare v int;
    declare vf int;
	
	declare veh_name varchar(45);

	set vf = 1;
	set v = 1;	

	faction_loop: loop
			
		vehicle_loop: loop

			do_loop: loop

				-- check if VS and Vanguard
				If vf = 1 and v = 5 then
					leave do_loop;
				end if;

				-- check if VS and Prowler
				If vf = 1 and v = 6 then
					leave do_loop;
				end if;

				-- check if VS and Reaver
				If vf = 1 and v = 8 then
					leave do_loop;
				end if;

				-- check if VS and Mossy
				If vf = 1 and v = 9 then
					leave do_loop;
				end if;

				-- check if NC and Magrider
				If vf = 2 and v = 4 then
					leave do_loop;
				end if;

				-- check if NC and Prowler
				If vf = 2 and v = 6 then
					leave do_loop;
				end if;

				-- check if NC and Scythe
				If vf = 2 and v = 7 then
					leave do_loop;
				end if;

				-- check if NC and Mossy
				If vf = 2 and v = 9 then
					leave do_loop;
				end if;

				-- check if TR and Magrider
				If vf = 3 and v = 4 then
					leave do_loop;
				end if;

				-- check if TR and Vanguard
				If vf = 3 and v = 5 then
					leave do_loop;
				end if;

				-- check if TR and Scythe
				If vf = 3 and v = 7 then
					leave do_loop;
				end if;

				-- check if TR and Reaver
				If vf = 3 and v = 8 then
					leave do_loop;
				end if;

															
				call fkpk.vehicle_uniques_pull(vf, v, starting_timestamp, ending_timestamp, @uniques);
	
				select v_name into veh_name from fkpk.v2_vehicles where vehicle_id = v and faction_id = vf; 

				insert into fkpk.v2_vehicle_uniques
				values (period, vf, v, veh_name, @uniques, starting_timestamp, ending_timestamp);
				
				LEAVE do_loop;
			
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