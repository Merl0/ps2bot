CREATE TABLE `v2_vehicle_aggregates` (
  `item_id` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,   
  `deaths` int(11) DEFAULT NULL,
  `q1deaths` int(11) DEFAULT NULL,
  `q2deaths` int(11) DEFAULT NULL,
  `q3deaths` int(11) DEFAULT NULL,
  `q4deaths` int(11) DEFAULT NULL,
  `starting_timestamp` int(11) NOT NULL,
  `ending_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`period`,`faction_id`,`vehicle_id`),
  KEY `period` (`period`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

