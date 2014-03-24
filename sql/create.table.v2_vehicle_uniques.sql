CREATE TABLE `v2_vehicle_uniques` (
  `period` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,   
  `uniques` int(11) DEFAULT NULL,
  `starting_timestamp` int(11) NOT NULL,
  `ending_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`period`,`faction_id`,`vehicle_id`),
  KEY `period` (`period`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

