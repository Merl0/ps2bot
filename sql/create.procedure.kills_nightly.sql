DELIMITER $$
CREATE DEFINER=`fkpk`@`%` PROCEDURE `kills_nightly`(out deleted_rows int, out time_elapsed int)
BEGIN
	DECLARE start_stamp int;
	DECLARE end_stamp int;
	DECLARE period_id int;

	SELECT UNIX_TIMESTAMP(NOW()) into start_stamp;

	-- get the timestamps
	CALL fkpk.get_time_brackets(@front, @back, @week);
	
	-- create a new time period
	INSERT INTO fkpk.v2_time_periods (start_time, end_time, is_daily) VALUES (@front, @back, 1);
	SELECT last_insert_id() into period_id;

	-- run garbage collection and kills/deaths assignment
	CALL fkpk.garbage_collection(@front, @back);

	-- run aggregates over timestamps
	CALL fkpk.aggregate_weapons(period_id, @front, @back);
	
	-- run faction aggregation
	CALL fkpk.aggregate_factions(period_id, @front, @back);

	-- run vehicle death aggregation
	call fkpk.aggregate_vehicles(period_id, @front, @back);

	-- run vehicle unqiues aggregation
	call fkpk.aggregate_vehicle_uniques(period_id, @front, @back);

	-- run vKPU aKPU aggregation
	call fkpk.aggregate_vKPU(period_id, @front, @back);

	-- generate report
	call fkpk.generate_report();
	call fkpk.generate_veh_report();

	-- delete before weekly
	DELETE FROM fkpk.v2_kills
	WHERE timestamp < @week;
	SELECT row_count() INTO deleted_rows;

	-- delete vehicle deaths
	DELETE FROM fkpk.v2_vehicle_deaths
	WHERE timestamp < @week;
	


	SELECT UNIX_TIMESTAMP(NOW()) into end_stamp;
	SET time_elapsed = end_stamp - start_stamp;

END$$
DELIMITER ;

