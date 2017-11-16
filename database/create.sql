create database lportal character set utf8;

use lportal;

source database/testray_ootb.sql

update User_ set password_='testray', passwordEncrypted=false where emailAddress='sir.testalot@liferay.com';

update Release_ set servletContextName='com.liferay.osb.testray.service', schemaVersion='1.0.0' where servletContextName='osb-testray-portlet';