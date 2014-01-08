GRANT ALL PRIVILEGES ON *.* TO 'lua'@'localhost' IDENTIFIED BY 'lua';

# mysql performanceblog.com
CREATE DATABASE mtest;
use mtest;
CREATE TABLE `new_table` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(45) DEFAULT NULL,
`age` tinyint(4) NOT NULL,
PRIMARY KEY (`id`),
KEY `name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

