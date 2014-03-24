CREATE TABLE `v2_vehicles` (
  `faction_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `image_path` varchar(45) DEFAULT NULL,
  `image_set_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `v_name` varchar(45) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`faction_id`,`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

