CREATE TABLE `v2_veh_report` (
  `item_id` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,   
  `sum_deaths` int(11) DEFAULT NULL,
  `sum_q1deaths` int(11) DEFAULT NULL,
  `sum_q2deaths` int(11) DEFAULT NULL,
  `sum_q3deaths` int(11) DEFAULT NULL,
  `sum_q4deaths` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`,`faction_id`,`vehicle_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

