create database lportal character set utf8;

create user 'pr_tester'@'localhost' identified by 'r3m3mb3r';
grant all privileges on lportal.* to 'pr_tester'@'localhost';
flush privileges;
