delimiter $$

CREATE TABLE `v2_vehicle_deaths` (
  `attacker_player_guid` bigint(20) NOT NULL,
  `attacker_vehicle_id` int(11) DEFAULT NULL,
  `attacker_weapon_id` int(11) DEFAULT NULL,
  `character_id` bigint(20) NOT NULL,
  `faction_id` int(11) DEFAULT NULL,
  `projectile_id` int(11) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  `vehicle_definition_id` int(11) DEFAULT NULL,
  `world_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `attacker_faction_id` int(11) DEFAULT NULL,
  `attacker_br_value` int(11) DEFAULT NULL,
  `br_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`attacker_player_guid`,`character_id`,`timestamp`),
  KEY `weapon` (`attacker_weapon_id`),
  KEY `time` (`timestamp`),
  KEY `vehicle` (`vehicle_definition_id`),
  KEY `br` (`br_value`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$


