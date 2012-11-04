CREATE TABLE `user` (                                                                                   
          `id` int(11) NOT NULL AUTO_INCREMENT,                                                                 
          `username` varchar(50) NOT NULL,                                                                      
          `fname` varchar(20) NOT NULL,                                                                         
          `lname` varchar(20) NOT NULL,                                                                         
          `password` varchar(20) NOT NULL,                                                                      
          `email` varchar(50) NOT NULL,                                                                         
          `gender` int(2) NOT NULL,                                                                             
          `match_gender` int(2) NOT NULL,                                                                       
          `create_date` datetime NOT NULL,                                                                      
          `relationship_seek` int(32) NOT NULL,                                                                 
          `ethnicity` int(32) NOT NULL,                                                                         
          `about` varchar(2000) NOT NULL,                                                                       
          `birthday` datetime NOT NULL,                                                                         
          `country_id` int(11) NOT NULL,                                                                        
          `state_id` int(11) NOT NULL,                                                                          
          PRIMARY KEY (`id`)                                                                                    
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC  