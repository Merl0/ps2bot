CREATE TABLE `v2_uniques_temp3` (
 `attacker_character_id` bigint(20) NOT NULL,
	`attacker_br_value` int(11) NOT NULL,
	`period` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
    PRIMARY KEY ( `attacker_character_id`, `attacker_br_value`, `period`, `item_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

