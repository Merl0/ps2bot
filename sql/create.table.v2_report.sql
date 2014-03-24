CREATE TABLE `v2_report` (
  `item_category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `w_name` varchar(45) DEFAULT NULL,
  `sum_kills` int(11) DEFAULT NULL,
  `avg_uniques` int(11) DEFAULT NULL,
  `avg_kpu` float DEFAULT NULL,
  `avg_kpu_stddev` float DEFAULT NULL,
  `avg_avgbr` float DEFAULT NULL,
  `avg_q1kpu` float DEFAULT NULL,
  `avg_q2kpu` float DEFAULT NULL,
  `avg_q3kpu` float DEFAULT NULL,
  `avg_q4kpu` float DEFAULT NULL,
  `sum_headshot` int(11) DEFAULT NULL,
  `sum_v_deaths` int(11) DEFAULT NULL,
  `avg_vkpu` float DEFAULT NULL,
  `sum_a_deaths` int(11) DEFAULT NULL,
  `avg_akpu` float DEFAULT NULL,
  PRIMARY KEY (`item_category_id`,`item_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

