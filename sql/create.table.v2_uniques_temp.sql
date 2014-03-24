CREATE TABLE `v2_uniques_temp` (
  `item_id` int(11) DEFAULT NULL,
  `attacker_character_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`,`attacker_character_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

