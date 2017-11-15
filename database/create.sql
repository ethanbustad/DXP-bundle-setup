create database lportal character set utf8;

use lportal;

source database/testray_ootb.sql

update User_ set password_='testray', passwordEncrypted=false where emailAddress='sir.testalot@liferay.com';