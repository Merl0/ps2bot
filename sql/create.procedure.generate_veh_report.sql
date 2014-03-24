DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `generate_veh_report`()
BEGIN
    
	declare w int;
	declare v int;
    declare vf int;

	declare w_name varchar(45);
	
	declare weapons cursor for select id from fkpk.v2_weapons where is_killer=1 order by id asc;
	
	truncate table fkpk.v2_veh_report;

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
												
				call fkpk.veh_report_pull(w, vf, v, @sum_deaths, @sum_q1deaths, @sum_q2deaths, @sum_q3deaths, @sum_q4deaths);
	
				select name into w_name from fkpk.v2_weapons where id = w; 

				insert into fkpk.v2_veh_report
				values (w, vf, v, w_name, @sum_deaths, @sum_q1deaths, @sum_q2deaths, @sum_q3deaths, @sum_q4deaths);
				
				-- IF last weapon then
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