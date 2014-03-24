-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`fkpk`@`%` PROCEDURE `aggregate_vKPU`(in period_in int(11), in starting_timestamp int(11), in ending_timestamp int(11))
BEGIN
    
	declare w int;
	declare v int;
    	  
	declare weapons cursor for select id from fkpk.v2_weapons where is_killer=1 order by id asc;

	open weapons;

		do_loop: loop
	
			set v = 1;
			
			fetch weapons into w;

			vehicle_loop:  loop
					
				if v = 1 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set flashDeaths=@v_deaths, flashKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 2 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set sundDeaths=@v_deaths, sundKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 3 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set lightDeaths=@v_deaths, lightKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 4 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set magDeaths=@v_deaths, magKPU=@v_kpu where item_id = w and period = period_in;
				end if;
	
				if v = 5 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set vanDeaths=@v_deaths, vanKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 6 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set prowlDeaths=@v_deaths, prowlKPU=@v_kpu where item_id = w and period = period_in;
				end if;
				
				if v = 7 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set scytheDeaths=@v_deaths, scytheKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 8 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set reaverDeaths=@v_deaths, reaverKPU=@v_kpu where item_id = w and period = period_in;
				end if;
				
				if v = 9 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set mossyDeaths=@v_deaths, mossyKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 10 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set libDeaths=@v_deaths, libKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 11 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set galDeaths=@v_deaths, galKPU=@v_kpu where item_id = w and period = period_in;
				end if;

				if v = 12 then
					call fkpk.vkpu_master_pull(v, w, starting_timestamp, ending_timestamp, period_in, @v_deaths, @v_kpu);
					update fkpk.v2_kills_vkpu_aggregates set harasDeaths=@v_deaths, harasKPU=@v_kpu where item_id = w and period = period_in;
				end if;


				set v=v+1;
	
				If v = 13 then
				
					call fkpk.v_a_totals_pull(w, starting_timestamp, ending_timestamp, period_in, @v_total_deaths, @v_total_kpu, @a_total_deaths, @a_total_kpu);
					update fkpk.v2_kills_vkpu_aggregates set v_deaths=@v_total_deaths, vKPU=@v_total_kpu, a_deaths=@a_total_deaths, aKPU=@a_total_kpu where item_id = w and period = period_in; 

					leave vehicle_loop;
				end if;	

			end loop;
		
			-- last weapon ID
			IF w = 777777 THEN
				CLOSE weapons;
				LEAVE do_loop;
			END IF;

	end loop;

END