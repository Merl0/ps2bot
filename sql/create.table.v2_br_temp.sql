CREATE TABLE `v2_br_temp` (
  `id` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `weap_name` varchar(45) DEFAULT NULL,
  `attacker_br_value` int(11) NOT NULL,
  `br_value_count` int(11) DEFAULT NULL,
  PRIMARY KEY ( `id`, `period`, `attacker_br_value`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

