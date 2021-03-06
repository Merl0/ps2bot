CREATE TABLE `v2_kills_vkpu_aggregates` (
  `item_id` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `starting_timestamp` int(11) NOT NULL,
  `ending_timestamp` int(11) NOT NULL,
  `w_name` varchar(45) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `uniques` int(11) DEFAULT NULL,
  `kpu` float DEFAULT NULL,
  `kpu_stddev` float DEFAULT NULL,
  `avgbr` float DEFAULT NULL,
  `q1kpu` float DEFAULT NULL,
  `q2kpu` float DEFAULT NULL,
  `q3kpu` float DEFAULT NULL,
  `q4kpu` float DEFAULT NULL,
  `headshot` int(11) DEFAULT NULL,
  `v_deaths` int(11) DEFAULT NULL,
  `vKPU` float DEFAULT NULL,
  `a_deaths` int(11) DEFAULT NULL,
  `aKPU` float DEFAULT NULL,
  `flashDeaths` int(11) DEFAULT NULL,
  `flashKPU` float DEFAULT NULL,
  `sundDeaths` int(11) DEFAULT NULL,
  `sundKPU` float DEFAULT NULL,
  `lightDeaths` int(11) DEFAULT NULL,
  `lightKPU` float DEFAULT NULL,
  `magDeaths` int(11) DEFAULT NULL,
  `magKPU` float DEFAULT NULL,
  `vanDeaths` int(11) DEFAULT NULL,
  `vanKPU` float DEFAULT NULL,
  `prowlDeaths` int(11) DEFAULT NULL,
  `prowlKPU` float DEFAULT NULL,
  `scytheDeaths` int(11) DEFAULT NULL,
  `scytheKPU` float DEFAULT NULL,
  `reaverDeaths` int(11) DEFAULT NULL,
  `reaverKPU` float DEFAULT NULL,
  `mossyDeaths` int(11) DEFAULT NULL,
  `mossyKPU` float DEFAULT NULL,
  `libDeaths` int(11) DEFAULT NULL,
  `libKPU` float DEFAULT NULL,
  `galDeaths` int(11) DEFAULT NULL,
  `galKPU` float DEFAULT NULL,
  `harasDeaths` int(11) DEFAULT NULL,
  `harasKPU` float DEFAULT NULL,
PRIMARY KEY (`item_id`,`period`),
  KEY `period` (`period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

