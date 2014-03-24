CREATE TABLE `v2_faction_aggregates` (
  `period` int(11) NOT NULL,
  `starting_timestamp` int(11) NOT NULL,
  `ending_timestamp` int(11) NOT NULL,
  `VS_daily_kills` int(11) DEFAULT NULL,
  `NC_daily_kills` int(11) DEFAULT NULL,
  `TR_daily_kills` int(11) DEFAULT NULL,
  PRIMARY KEY (`period`),
  KEY `period` (`period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

