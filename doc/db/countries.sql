USE `springtest`;

create table `countries`
(
  `cou_id`                      int            not null,
  `cou_name`                    varchar(250) not null,
  `cc2`                         varchar(2),
  `cc3`                         varchar(3),
  `ccn`                         int(3),
  `is_developed`                varchar(1)  not null,
  `is_undesirable`              varchar(1)  not null,
  `cou_currency`                varchar(10),
  `not_important_for_searches`  int(1)         default 0,
  PRIMARY KEY (`cou_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;