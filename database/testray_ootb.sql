--
-- Table structure for table `Account_`
--

CREATE TABLE `Account_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `accountId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `parentAccountId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `legalName` varchar(75) DEFAULT NULL,
  `legalId` varchar(75) DEFAULT NULL,
  `legalType` varchar(75) DEFAULT NULL,
  `sicCode` varchar(75) DEFAULT NULL,
  `tickerSymbol` varchar(75) DEFAULT NULL,
  `industry` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `size_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Account_`
--

LOCK TABLES `Account_` WRITE;
INSERT INTO `Account_` VALUES (0,20118,20116,0,NULL,'2017-06-03 00:42:22.899000','2017-06-03 00:42:22.899000',0,'Liferay DXP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `addressId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `street1` varchar(75) DEFAULT NULL,
  `street2` varchar(75) DEFAULT NULL,
  `street3` varchar(75) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `zip` varchar(75) DEFAULT NULL,
  `regionId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `typeId` bigint(20) DEFAULT NULL,
  `mailing` tinyint(4) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `IX_923BD178` (`companyId`,`classNameId`,`classPK`,`mailing`),
  KEY `IX_9226DBB4` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_5BC8B0D4` (`userId`),
  KEY `IX_8FCB620E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AnnouncementsDelivery`
--

CREATE TABLE `AnnouncementsDelivery` (
  `deliveryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `email` tinyint(4) DEFAULT NULL,
  `sms` tinyint(4) DEFAULT NULL,
  `website` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`deliveryId`),
  UNIQUE KEY `IX_BA4413D5` (`userId`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AnnouncementsDelivery`
--

LOCK TABLES `AnnouncementsDelivery` WRITE;
INSERT INTO `AnnouncementsDelivery` VALUES (31307,20116,31301,'general',0,0,0),(31308,20116,31301,'news',0,0,0),(31309,20116,31301,'test',0,0,0);
UNLOCK TABLES;

--
-- Table structure for table `AnnouncementsEntry`
--

CREATE TABLE `AnnouncementsEntry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `content` longtext,
  `url` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `displayDate` datetime(6) DEFAULT NULL,
  `expirationDate` datetime(6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `alert` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  KEY `IX_14F06A6B` (`classNameId`,`classPK`,`alert`),
  KEY `IX_D49C2E66` (`userId`),
  KEY `IX_F2949120` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AnnouncementsFlag`
--

CREATE TABLE `AnnouncementsFlag` (
  `flagId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `entryId` bigint(20) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`flagId`),
  UNIQUE KEY `IX_4539A99C` (`userId`,`entryId`,`value`),
  KEY `IX_9C7EB9F` (`entryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetCategory`
--

CREATE TABLE `AssetCategory` (
  `uuid_` varchar(75) DEFAULT NULL,
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `leftCategoryId` bigint(20) DEFAULT NULL,
  `rightCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `vocabularyId` bigint(20) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `IX_BE4DF2BF` (`parentCategoryId`,`name`,`vocabularyId`),
  UNIQUE KEY `IX_E8D019AA` (`uuid_`,`groupId`),
  KEY `IX_C7F39FCA` (`groupId`,`name`,`vocabularyId`),
  KEY `IX_852EA801` (`groupId`,`parentCategoryId`,`name`,`vocabularyId`),
  KEY `IX_87603842` (`groupId`,`parentCategoryId`,`vocabularyId`),
  KEY `IX_2008FACB` (`groupId`,`vocabularyId`),
  KEY `IX_D61ABE08` (`name`,`vocabularyId`),
  KEY `IX_B185E980` (`parentCategoryId`,`vocabularyId`),
  KEY `IX_BBAF6928` (`uuid_`,`companyId`),
  KEY `IX_287B1F89` (`vocabularyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetCategoryProperty`
--

CREATE TABLE `AssetCategoryProperty` (
  `categoryPropertyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `value` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`categoryPropertyId`),
  UNIQUE KEY `IX_DBD111AA` (`categoryId`,`key_`),
  KEY `IX_52340033` (`companyId`,`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetEntries_AssetCategories`
--

CREATE TABLE `AssetEntries_AssetCategories` (
  `companyId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  `entryId` bigint(20) NOT NULL,
  PRIMARY KEY (`categoryId`,`entryId`),
  KEY `IX_A188F560` (`categoryId`),
  KEY `IX_38A65B55` (`companyId`),
  KEY `IX_E119938A` (`entryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetEntries_AssetTags`
--

CREATE TABLE `AssetEntries_AssetTags` (
  `companyId` bigint(20) NOT NULL,
  `entryId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`entryId`,`tagId`),
  KEY `IX_112337B8` (`companyId`),
  KEY `IX_2ED82CAD` (`entryId`),
  KEY `IX_B2A61B55` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetEntry`
--

CREATE TABLE `AssetEntry` (
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `classTypeId` bigint(20) DEFAULT NULL,
  `listable` tinyint(4) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `startDate` datetime(6) DEFAULT NULL,
  `endDate` datetime(6) DEFAULT NULL,
  `publishDate` datetime(6) DEFAULT NULL,
  `expirationDate` datetime(6) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `summary` longtext,
  `url` longtext,
  `layoutUuid` varchar(75) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_1E9D371D` (`classNameId`,`classPK`),
  KEY `IX_7306C60` (`companyId`),
  KEY `IX_75D42FF9` (`expirationDate`),
  KEY `IX_6418BB52` (`groupId`,`classNameId`,`publishDate`,`expirationDate`),
  KEY `IX_82C4BEF6` (`groupId`,`classNameId`,`visible`),
  KEY `IX_1EBA6821` (`groupId`,`classUuid`),
  KEY `IX_FEC4A201` (`layoutUuid`),
  KEY `IX_2E4E3885` (`publishDate`),
  KEY `IX_9029E15A` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AssetEntry`
--

LOCK TABLES `AssetEntry` WRITE;
INSERT INTO `AssetEntry` VALUES (20139,20133,20116,20120,NULL,'2017-06-03 00:42:24.013000','2017-06-03 00:42:24.013000',20047,20137,'ab5865f5-96b0-81c6-7014-6d8f84e1148c',0,1,0,NULL,NULL,NULL,NULL,'text/html','Control Panel','','',NULL,NULL,0,0,0,0),(20148,20143,20116,20120,NULL,'2017-06-03 00:42:24.180000','2017-06-03 00:42:24.180000',20047,20146,'eff120d8-eb01-d9c0-a1a2-b30663af9427',0,1,0,NULL,NULL,NULL,NULL,'text/html','Welcome','','',NULL,NULL,0,0,0,0),(20161,20152,20116,20156,'Test Test','2017-06-03 00:42:24.575000','2017-06-03 00:42:24.575000',20087,20156,'c58b5756-7f65-79b7-35f5-d7cb3fc7ab4e',0,1,0,NULL,NULL,NULL,NULL,NULL,'Test Test','','',NULL,NULL,0,0,0,0),(20165,20140,20116,20120,NULL,'2017-06-03 00:42:24.771000','2017-06-03 00:42:24.771000',20047,20162,'1ab2b661-3b4e-b797-3082-b663db555c18',0,1,0,NULL,NULL,NULL,NULL,'text/html','Shared','','',NULL,NULL,0,0,0,0),(31015,31002,20116,20120,NULL,'2017-06-03 00:44:41.397000','2017-06-03 00:44:41.397000',20047,31013,'f1c033b3-c117-7701-63d3-20c4286de162',0,1,0,NULL,NULL,NULL,NULL,'text/html','Welcome','','',NULL,NULL,0,0,0,0),(31086,31081,20116,20120,NULL,'2017-06-03 00:44:59.390000','2017-06-03 00:44:59.390000',20047,31084,'ee592602-f485-dcb7-b76b-4ca242289251',0,1,0,NULL,NULL,NULL,NULL,'text/html','Content Display Page','','',NULL,NULL,0,0,0,0),(31149,31144,20116,20120,NULL,'2017-06-03 00:45:07.847000','2017-06-03 00:45:07.847000',20047,31147,'849cf9da-5b21-d0d4-3a1d-144eb04cde8b',0,1,0,NULL,NULL,NULL,NULL,'text/html','Wiki','','',NULL,NULL,0,0,0,0),(31163,31152,20116,20120,NULL,'2017-06-03 00:45:07.989000','2017-06-03 00:45:07.989000',20047,31161,'7bb22e84-99c7-12db-b9e6-ccf6e97d4f94',0,1,0,NULL,NULL,NULL,NULL,'text/html','Home','','',NULL,NULL,0,0,0,0),(31167,31152,20116,20120,NULL,'2017-06-03 00:45:08.058000','2017-06-03 00:45:08.058000',20047,31165,'2bdf9b7b-b250-3936-1ae5-6eb8c2588db6',0,1,0,NULL,NULL,NULL,NULL,'text/html','Wiki','','',NULL,NULL,0,0,0,0),(31177,31172,20116,20120,NULL,'2017-06-03 00:45:08.427000','2017-06-03 00:45:08.427000',20047,31175,'ce06ed44-8623-fde5-730e-b9364cabbfca',0,1,0,NULL,NULL,NULL,NULL,'text/html','Blog','','',NULL,NULL,0,0,0,0),(31208,31197,20116,20120,NULL,'2017-06-03 00:45:10.448000','2017-06-03 00:45:10.448000',20047,31206,'2186cde1-1553-d8e6-6741-20ded4f4bf9b',0,1,0,NULL,NULL,NULL,NULL,'text/html','Home','','',NULL,NULL,0,0,0,0),(31212,31197,20116,20120,NULL,'2017-06-03 00:45:10.496000','2017-06-03 00:45:10.496000',20047,31210,'f9f7e941-2e1c-839d-993f-59efe0f29844',0,1,0,NULL,NULL,NULL,NULL,'text/html','Documents and Media','','',NULL,NULL,0,0,0,0),(31216,31197,20116,20120,NULL,'2017-06-03 00:45:10.538000','2017-06-03 00:45:10.538000',20047,31214,'82fa815c-20a4-bf52-b1a5-3d24656402d9',0,1,0,NULL,NULL,NULL,NULL,'text/html','News','','',NULL,NULL,0,0,0,0),(31246,20158,20116,20156,'Test Test','2017-06-03 00:46:35.798000','2017-06-03 00:46:35.798000',20047,31244,'cb6618a5-cdbe-b969-1b92-1f6055377dbe',0,1,0,NULL,NULL,NULL,NULL,'text/html','Welcome','','',NULL,NULL,0,0,0,0),(31249,20158,20116,20156,'Test Test','2017-06-03 00:46:35.831000','2017-06-03 00:46:35.831000',20047,31247,'cf7318c2-870c-1c2c-05fd-288f369ddabe',0,1,0,NULL,NULL,NULL,NULL,'text/html','Welcome','','',NULL,NULL,0,0,0,0),(31263,20143,20116,20156,'Test Test','2017-06-03 00:46:57.093000','2017-06-03 00:46:57.167000',27704,31254,'b0b3ffaa-aba2-2cad-3c8d-3abb6c715408',0,1,1,NULL,NULL,'2017-06-03 00:46:57.093000',NULL,'text','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Liferay DXP</Name></root>','','',NULL,NULL,0,0,0,0),(31306,20152,20116,20156,'Test Test','2017-06-03 00:49:07.170000','2017-06-03 00:51:32.694000',20087,31301,'caa5bd34-4ed1-c0b9-57c7-0a90f54de7bf',0,1,0,NULL,NULL,NULL,NULL,NULL,'Sir Testalot','','',NULL,NULL,0,0,0,0);
UNLOCK TABLES;

--
-- Table structure for table `AssetLink`
--

CREATE TABLE `AssetLink` (
  `linkId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `entryId1` bigint(20) DEFAULT NULL,
  `entryId2` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`linkId`),
  UNIQUE KEY `IX_8F542794` (`entryId1`,`entryId2`,`type_`),
  KEY `IX_14D5A20D` (`entryId1`,`type_`),
  KEY `IX_91F132C` (`entryId2`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetTag`
--

CREATE TABLE `AssetTag` (
  `uuid_` varchar(75) DEFAULT NULL,
  `tagId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `assetCount` int(11) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`tagId`),
  UNIQUE KEY `IX_D63322F9` (`groupId`,`name`),
  UNIQUE KEY `IX_B6ACB166` (`uuid_`,`groupId`),
  KEY `IX_84C501E4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetTagStats`
--

CREATE TABLE `AssetTagStats` (
  `tagStatsId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `tagId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `assetCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`tagStatsId`),
  UNIQUE KEY `IX_56682CC4` (`tagId`,`classNameId`),
  KEY `IX_50702693` (`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `AssetVocabulary`
--

CREATE TABLE `AssetVocabulary` (
  `uuid_` varchar(75) DEFAULT NULL,
  `vocabularyId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `settings_` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`vocabularyId`),
  UNIQUE KEY `IX_C0AAD74D` (`groupId`,`name`),
  UNIQUE KEY `IX_1B2B8792` (`uuid_`,`groupId`),
  KEY `IX_B22D908C` (`companyId`),
  KEY `IX_C4E6FD10` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AssetVocabulary`
--

LOCK TABLES `AssetVocabulary` WRITE;
INSERT INTO `AssetVocabulary` VALUES ('3977ed49-f60e-57c8-1052-2cd78863fe41',20164,20152,20116,20120,NULL,'2017-06-03 00:42:24.791000','2017-06-03 00:42:24.791000','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>',NULL,NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `Audit_AuditEvent`
--

CREATE TABLE `Audit_AuditEvent` (
  `auditEventId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `eventType` varchar(75) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` varchar(75) DEFAULT NULL,
  `message` longtext,
  `clientHost` varchar(255) DEFAULT NULL,
  `clientIP` varchar(75) DEFAULT NULL,
  `serverName` varchar(255) DEFAULT NULL,
  `serverPort` int(11) DEFAULT NULL,
  `sessionID` varchar(255) DEFAULT NULL,
  `additionalInfo` longtext,
  PRIMARY KEY (`auditEventId`),
  KEY `IX_8FE31EDF` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `BackgroundTask`
--

CREATE TABLE `BackgroundTask` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `backgroundTaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `servletContextNames` varchar(255) DEFAULT NULL,
  `taskExecutorClassName` varchar(200) DEFAULT NULL,
  `taskContextMap` longtext,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusMessage` longtext,
  PRIMARY KEY (`backgroundTaskId`),
  KEY `IX_C5A6C78F` (`companyId`),
  KEY `IX_FBF5FAA2` (`completed`),
  KEY `IX_579C63B0` (`groupId`,`name`,`taskExecutorClassName`,`completed`),
  KEY `IX_C71C3B7` (`groupId`,`status`),
  KEY `IX_7A9FF471` (`groupId`,`taskExecutorClassName`,`completed`),
  KEY `IX_7E757D70` (`groupId`,`taskExecutorClassName`,`status`),
  KEY `IX_75638CDF` (`status`),
  KEY `IX_2FCFE748` (`taskExecutorClassName`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `BlogsEntry`
--

CREATE TABLE `BlogsEntry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `subtitle` longtext,
  `urlTitle` varchar(150) DEFAULT NULL,
  `description` longtext,
  `content` longtext,
  `displayDate` datetime(6) DEFAULT NULL,
  `allowPingbacks` tinyint(4) DEFAULT NULL,
  `allowTrackbacks` tinyint(4) DEFAULT NULL,
  `trackbacks` longtext,
  `coverImageCaption` longtext,
  `coverImageFileEntryId` bigint(20) DEFAULT NULL,
  `coverImageURL` longtext,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageFileEntryId` bigint(20) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_DB780A20` (`groupId`,`urlTitle`),
  UNIQUE KEY `IX_1B1040FD` (`uuid_`,`groupId`),
  KEY `IX_BB0C2905` (`companyId`,`displayDate`,`status`),
  KEY `IX_EB2DCE27` (`companyId`,`status`),
  KEY `IX_A5F57B61` (`companyId`,`userId`,`status`),
  KEY `IX_2672F77F` (`displayDate`,`status`),
  KEY `IX_F0E73383` (`groupId`,`displayDate`,`status`),
  KEY `IX_1EFD8EE9` (`groupId`,`status`),
  KEY `IX_DA04F689` (`groupId`,`userId`,`displayDate`,`status`),
  KEY `IX_49E15A23` (`groupId`,`userId`,`status`),
  KEY `IX_5E8307BB` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `BlogsStatsUser`
--

CREATE TABLE `BlogsStatsUser` (
  `statsUserId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `entryCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime(6) DEFAULT NULL,
  `ratingsTotalEntries` int(11) DEFAULT NULL,
  `ratingsTotalScore` double DEFAULT NULL,
  `ratingsAverageScore` double DEFAULT NULL,
  PRIMARY KEY (`statsUserId`),
  UNIQUE KEY `IX_82254C25` (`groupId`,`userId`),
  KEY `IX_90CDA39A` (`companyId`,`entryCount`),
  KEY `IX_28C78D5C` (`groupId`,`entryCount`),
  KEY `IX_507BA031` (`userId`,`lastPostDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `BookmarksEntry`
--

CREATE TABLE `BookmarksEntry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `description` longtext,
  `visits` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_EAA02A91` (`uuid_`,`groupId`),
  KEY `IX_276C8C13` (`companyId`,`status`),
  KEY `IX_146382F2` (`groupId`,`folderId`,`status`),
  KEY `IX_416AD7D5` (`groupId`,`status`),
  KEY `IX_C78B61AC` (`groupId`,`userId`,`folderId`,`status`),
  KEY `IX_9D9CF70F` (`groupId`,`userId`,`status`),
  KEY `IX_E848278F` (`resourceBlockId`),
  KEY `IX_89BEDC4F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `BookmarksFolder`
--

CREATE TABLE `BookmarksFolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_DC2F8927` (`uuid_`,`groupId`),
  KEY `IX_C27C9DBD` (`companyId`,`status`),
  KEY `IX_D16018A6` (`groupId`,`parentFolderId`,`status`),
  KEY `IX_28A49BB9` (`resourceBlockId`),
  KEY `IX_54F0ED65` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `BrowserTracker`
--

CREATE TABLE `BrowserTracker` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `browserTrackerId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `browserKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`browserTrackerId`),
  UNIQUE KEY `IX_E7B95510` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Calendar`
--

CREATE TABLE `Calendar` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `calendarResourceId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `timeZoneId` varchar(75) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `defaultCalendar` tinyint(4) DEFAULT NULL,
  `enableComments` tinyint(4) DEFAULT NULL,
  `enableRatings` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`calendarId`),
  UNIQUE KEY `IX_3AE311A` (`uuid_`,`groupId`),
  KEY `IX_97FC174E` (`groupId`,`calendarResourceId`,`defaultCalendar`),
  KEY `IX_F0FAF226` (`resourceBlockId`),
  KEY `IX_97656498` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `CalendarBooking`
--

CREATE TABLE `CalendarBooking` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarBookingId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `calendarId` bigint(20) DEFAULT NULL,
  `calendarResourceId` bigint(20) DEFAULT NULL,
  `parentCalendarBookingId` bigint(20) DEFAULT NULL,
  `vEventUid` varchar(255) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `location` longtext,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `allDay` tinyint(4) DEFAULT NULL,
  `recurrence` longtext,
  `firstReminder` bigint(20) DEFAULT NULL,
  `firstReminderType` varchar(75) DEFAULT NULL,
  `secondReminder` bigint(20) DEFAULT NULL,
  `secondReminderType` varchar(75) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`calendarBookingId`),
  UNIQUE KEY `IX_113A264E` (`calendarId`,`parentCalendarBookingId`),
  UNIQUE KEY `IX_8B23DA0E` (`calendarId`,`vEventUid`),
  UNIQUE KEY `IX_F4C61797` (`uuid_`,`groupId`),
  KEY `IX_470170B4` (`calendarId`,`status`),
  KEY `IX_B198FFC` (`calendarResourceId`),
  KEY `IX_F7B8A941` (`parentCalendarBookingId`,`status`),
  KEY `IX_22DFDB49` (`resourceBlockId`),
  KEY `IX_A21D9FD5` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `CalendarNotificationTemplate`
--

CREATE TABLE `CalendarNotificationTemplate` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarNotificationTemplateId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `calendarId` bigint(20) DEFAULT NULL,
  `notificationType` varchar(75) DEFAULT NULL,
  `notificationTypeSettings` varchar(75) DEFAULT NULL,
  `notificationTemplateType` varchar(75) DEFAULT NULL,
  `subject` varchar(75) DEFAULT NULL,
  `body` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`calendarNotificationTemplateId`),
  UNIQUE KEY `IX_4012E97F` (`uuid_`,`groupId`),
  KEY `IX_7727A482` (`calendarId`,`notificationType`,`notificationTemplateType`),
  KEY `IX_4D7D97BD` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `CalendarResource`
--

CREATE TABLE `CalendarResource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarResourceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `code_` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`calendarResourceId`),
  UNIQUE KEY `IX_16A12327` (`classNameId`,`classPK`),
  UNIQUE KEY `IX_4ABD2BC8` (`uuid_`,`groupId`),
  KEY `IX_76DDD0F7` (`active_`),
  KEY `IX_4470A59D` (`companyId`,`code_`,`active_`),
  KEY `IX_40678371` (`groupId`,`active_`),
  KEY `IX_55C2F8AA` (`groupId`,`code_`),
  KEY `IX_8BCB4D38` (`resourceBlockId`),
  KEY `IX_56A06BC6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ClassName_`
--

CREATE TABLE `ClassName_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `classNameId` bigint(20) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`classNameId`),
  UNIQUE KEY `IX_B27A301F` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ClassName_`
--

LOCK TABLES `ClassName_` WRITE;
INSERT INTO `ClassName_` VALUES (0,20001,'com.liferay.announcements.kernel.model.AnnouncementsDelivery'),(0,20002,'com.liferay.announcements.kernel.model.AnnouncementsEntry'),(0,20003,'com.liferay.announcements.kernel.model.AnnouncementsFlag'),(0,20004,'com.liferay.asset.kernel.model.AssetCategory'),(0,20005,'com.liferay.asset.kernel.model.AssetCategoryProperty'),(0,20006,'com.liferay.asset.kernel.model.AssetEntry'),(0,20007,'com.liferay.asset.kernel.model.AssetLink'),(0,20008,'com.liferay.asset.kernel.model.AssetTag'),(0,20009,'com.liferay.asset.kernel.model.AssetTagStats'),(0,20010,'com.liferay.asset.kernel.model.AssetVocabulary'),(0,20011,'com.liferay.blogs.kernel.model.BlogsEntry'),(0,20012,'com.liferay.blogs.kernel.model.BlogsStatsUser'),(0,20013,'com.liferay.counter.kernel.model.Counter'),(0,20014,'com.liferay.document.library.kernel.model.DLContent'),(0,20015,'com.liferay.document.library.kernel.model.DLFileEntry'),(0,20016,'com.liferay.document.library.kernel.model.DLFileEntryMetadata'),(0,20017,'com.liferay.document.library.kernel.model.DLFileEntryType'),(0,20018,'com.liferay.document.library.kernel.model.DLFileRank'),(0,20019,'com.liferay.document.library.kernel.model.DLFileShortcut'),(0,20020,'com.liferay.document.library.kernel.model.DLFileVersion'),(0,20021,'com.liferay.document.library.kernel.model.DLFolder'),(0,20022,'com.liferay.document.library.kernel.model.DLSyncEvent'),(0,20023,'com.liferay.expando.kernel.model.ExpandoColumn'),(0,20024,'com.liferay.expando.kernel.model.ExpandoRow'),(0,20025,'com.liferay.expando.kernel.model.ExpandoTable'),(0,20026,'com.liferay.expando.kernel.model.ExpandoValue'),(0,20027,'com.liferay.exportimport.kernel.model.ExportImportConfiguration'),(0,20028,'com.liferay.message.boards.kernel.model.MBBan'),(0,20029,'com.liferay.message.boards.kernel.model.MBCategory'),(0,20030,'com.liferay.message.boards.kernel.model.MBDiscussion'),(0,20031,'com.liferay.message.boards.kernel.model.MBMailingList'),(0,20032,'com.liferay.message.boards.kernel.model.MBMessage'),(0,20033,'com.liferay.message.boards.kernel.model.MBStatsUser'),(0,20034,'com.liferay.message.boards.kernel.model.MBThread'),(0,20035,'com.liferay.message.boards.kernel.model.MBThreadFlag'),(0,20036,'com.liferay.portal.kernel.model.Account'),(0,20037,'com.liferay.portal.kernel.model.Address'),(0,20038,'com.liferay.portal.kernel.model.BrowserTracker'),(0,20039,'com.liferay.portal.kernel.model.ClassName'),(0,20040,'com.liferay.portal.kernel.model.ClusterGroup'),(0,20041,'com.liferay.portal.kernel.model.Company'),(0,20042,'com.liferay.portal.kernel.model.Contact'),(0,20043,'com.liferay.portal.kernel.model.Country'),(0,20044,'com.liferay.portal.kernel.model.EmailAddress'),(0,20045,'com.liferay.portal.kernel.model.Group'),(0,20046,'com.liferay.portal.kernel.model.Image'),(0,20047,'com.liferay.portal.kernel.model.Layout'),(0,20048,'com.liferay.portal.kernel.model.LayoutBranch'),(0,20049,'com.liferay.portal.kernel.model.LayoutFriendlyURL'),(0,20050,'com.liferay.portal.kernel.model.LayoutPrototype'),(0,20051,'com.liferay.portal.kernel.model.LayoutRevision'),(0,20052,'com.liferay.portal.kernel.model.LayoutSet'),(0,20053,'com.liferay.portal.kernel.model.LayoutSetBranch'),(0,20054,'com.liferay.portal.kernel.model.LayoutSetPrototype'),(0,20055,'com.liferay.portal.kernel.model.ListType'),(0,20056,'com.liferay.portal.kernel.model.MembershipRequest'),(0,20057,'com.liferay.portal.kernel.model.OrgGroupRole'),(0,20058,'com.liferay.portal.kernel.model.OrgLabor'),(0,20059,'com.liferay.portal.kernel.model.Organization'),(0,20060,'com.liferay.portal.kernel.model.PasswordPolicy'),(0,20061,'com.liferay.portal.kernel.model.PasswordPolicyRel'),(0,20062,'com.liferay.portal.kernel.model.PasswordTracker'),(0,20063,'com.liferay.portal.kernel.model.Phone'),(0,20064,'com.liferay.portal.kernel.model.PluginSetting'),(0,20065,'com.liferay.portal.kernel.model.PortalPreferences'),(0,20066,'com.liferay.portal.kernel.model.Portlet'),(0,20067,'com.liferay.portal.kernel.model.PortletItem'),(0,20068,'com.liferay.portal.kernel.model.PortletPreferences'),(0,20069,'com.liferay.portal.kernel.model.RecentLayoutBranch'),(0,20070,'com.liferay.portal.kernel.model.RecentLayoutRevision'),(0,20071,'com.liferay.portal.kernel.model.RecentLayoutSetBranch'),(0,20072,'com.liferay.portal.kernel.model.Region'),(0,20073,'com.liferay.portal.kernel.model.Release'),(0,20074,'com.liferay.portal.kernel.model.Repository'),(0,20075,'com.liferay.portal.kernel.model.RepositoryEntry'),(0,20076,'com.liferay.portal.kernel.model.ResourceAction'),(0,20077,'com.liferay.portal.kernel.model.ResourceBlock'),(0,20078,'com.liferay.portal.kernel.model.ResourceBlockPermission'),(0,20079,'com.liferay.portal.kernel.model.ResourcePermission'),(0,20080,'com.liferay.portal.kernel.model.ResourceTypePermission'),(0,20081,'com.liferay.portal.kernel.model.Role'),(0,20082,'com.liferay.portal.kernel.model.ServiceComponent'),(0,20083,'com.liferay.portal.kernel.model.Subscription'),(0,20084,'com.liferay.portal.kernel.model.SystemEvent'),(0,20085,'com.liferay.portal.kernel.model.Team'),(0,20086,'com.liferay.portal.kernel.model.Ticket'),(0,20087,'com.liferay.portal.kernel.model.User'),(0,20088,'com.liferay.portal.kernel.model.UserGroup'),(0,20089,'com.liferay.portal.kernel.model.UserGroupGroupRole'),(0,20090,'com.liferay.portal.kernel.model.UserGroupRole'),(0,20091,'com.liferay.portal.kernel.model.UserIdMapper'),(0,20092,'com.liferay.portal.kernel.model.UserNotificationDelivery'),(0,20093,'com.liferay.portal.kernel.model.UserNotificationEvent'),(0,20094,'com.liferay.portal.kernel.model.UserTracker'),(0,20095,'com.liferay.portal.kernel.model.UserTrackerPath'),(0,20096,'com.liferay.portal.kernel.model.VirtualHost'),(0,20097,'com.liferay.portal.kernel.model.WebDAVProps'),(0,20098,'com.liferay.portal.kernel.model.Website'),(0,20099,'com.liferay.portal.kernel.model.WorkflowDefinitionLink'),(0,20100,'com.liferay.portal.kernel.model.WorkflowInstanceLink'),(0,20101,'com.liferay.portal.kernel.workflow.WorkflowTask'),(0,20102,'com.liferay.ratings.kernel.model.RatingsEntry'),(0,20103,'com.liferay.ratings.kernel.model.RatingsStats'),(0,20104,'com.liferay.social.kernel.model.SocialActivity'),(0,20105,'com.liferay.social.kernel.model.SocialActivityAchievement'),(0,20106,'com.liferay.social.kernel.model.SocialActivityCounter'),(0,20107,'com.liferay.social.kernel.model.SocialActivityLimit'),(0,20108,'com.liferay.social.kernel.model.SocialActivitySet'),(0,20109,'com.liferay.social.kernel.model.SocialActivitySetting'),(0,20110,'com.liferay.social.kernel.model.SocialRelation'),(0,20111,'com.liferay.social.kernel.model.SocialRequest'),(0,20112,'com.liferay.trash.kernel.model.TrashEntry'),(0,20113,'com.liferay.trash.kernel.model.TrashVersion'),(0,20114,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess'),(0,20135,'com.liferay.portal.kernel.model.UserPersonalSite'),(0,20175,'com.liferay.portal.kernel.theme.NavItem'),(0,22001,'com.liferay.portlet.calendar.model.CalEvent'),(0,27201,'com.liferay.bookmarks.model.BookmarksEntry'),(0,27202,'com.liferay.bookmarks.model.BookmarksFolder'),(0,27401,'com.liferay.invitation.invite.members.model.MemberRequest'),(0,27501,'com.liferay.microblogs.model.MicroblogsEntry'),(0,27601,'com.liferay.wiki.model.WikiNode'),(0,27602,'com.liferay.wiki.model.WikiPage'),(0,27603,'com.liferay.wiki.model.WikiPageResource'),(0,27701,'com.liferay.calendar.model.Calendar'),(0,27702,'com.liferay.calendar.model.CalendarBooking'),(0,27703,'com.liferay.calendar.model.CalendarNotificationTemplate'),(0,27704,'com.liferay.calendar.model.CalendarResource'),(0,28001,'com.liferay.polls.model.PollsChoice'),(0,28002,'com.liferay.polls.model.PollsQuestion'),(0,28003,'com.liferay.polls.model.PollsVote'),(0,28101,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition'),(0,28401,'com.liferay.portal.workflow.kaleo.model.KaleoAction'),(0,28402,'com.liferay.portal.workflow.kaleo.model.KaleoCondition'),(0,28403,'com.liferay.portal.workflow.kaleo.model.KaleoDefinition'),(0,28404,'com.liferay.portal.workflow.kaleo.model.KaleoInstance'),(0,28405,'com.liferay.portal.workflow.kaleo.model.KaleoInstanceToken'),(0,28406,'com.liferay.portal.workflow.kaleo.model.KaleoLog'),(0,28407,'com.liferay.portal.workflow.kaleo.model.KaleoNode'),(0,28408,'com.liferay.portal.workflow.kaleo.model.KaleoNotification'),(0,28409,'com.liferay.portal.workflow.kaleo.model.KaleoNotificationRecipient'),(0,28410,'com.liferay.portal.workflow.kaleo.model.KaleoTask'),(0,28411,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignment'),(0,28412,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignmentInstance'),(0,28413,'com.liferay.portal.workflow.kaleo.model.KaleoTaskInstanceToken'),(0,28414,'com.liferay.portal.workflow.kaleo.model.KaleoTimer'),(0,28415,'com.liferay.portal.workflow.kaleo.model.KaleoTimerInstanceToken'),(0,28416,'com.liferay.portal.workflow.kaleo.model.KaleoTransition'),(0,28501,'com.liferay.contacts.model.Entry'),(0,28601,'com.liferay.mobile.device.rules.model.MDRAction'),(0,28602,'com.liferay.mobile.device.rules.model.MDRRule'),(0,28603,'com.liferay.mobile.device.rules.model.MDRRuleGroup'),(0,28604,'com.liferay.mobile.device.rules.model.MDRRuleGroupInstance'),(0,28701,'com.liferay.portal.background.task.model.BackgroundTask'),(0,29001,'com.liferay.portal.lock.model.Lock'),(0,29033,'com.liferay.dynamic.data.mapping.model.DDMContent'),(0,29034,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstance'),(0,29035,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstanceLink'),(0,29036,'com.liferay.dynamic.data.mapping.model.DDMStorageLink'),(0,29037,'com.liferay.dynamic.data.mapping.model.DDMStructure'),(0,29038,'com.liferay.dynamic.data.mapping.model.DDMStructureLayout'),(0,29039,'com.liferay.dynamic.data.mapping.model.DDMStructureLink'),(0,29040,'com.liferay.dynamic.data.mapping.model.DDMStructureVersion'),(0,29041,'com.liferay.dynamic.data.mapping.model.DDMTemplate'),(0,29042,'com.liferay.dynamic.data.mapping.model.DDMTemplateLink'),(0,29043,'com.liferay.dynamic.data.mapping.model.DDMTemplateVersion'),(0,29045,'com.liferay.dynamic.data.lists.model.DDLRecord'),(0,29046,'com.liferay.dynamic.data.lists.model.DDLRecordSet'),(0,29047,'com.liferay.dynamic.data.lists.model.DDLRecordVersion'),(0,29101,'com.liferay.portlet.display.template.PortletDisplayTemplate'),(0,29147,'com.liferay.rss.web.util.RSSFeed'),(0,29154,'com.liferay.portal.kernel.servlet.taglib.ui.BreadcrumbEntry'),(0,29164,'com.liferay.portal.kernel.repository.model.FileEntry'),(0,29168,'com.liferay.portal.kernel.servlet.taglib.ui.LanguageEntry'),(0,29208,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcessLink'),(0,29301,'com.liferay.portal.security.audit.storage.model.AuditEvent'),(0,29401,'com.liferay.portal.security.service.access.policy.model.SAPEntry'),(0,29501,'com.liferay.marketplace.model.App'),(0,29502,'com.liferay.marketplace.model.Module'),(0,30149,'com.liferay.document.library.kernel.util.RawMetadataProcessor'),(0,30701,'com.liferay.sync.model.SyncDevice'),(0,30702,'com.liferay.sync.model.SyncDLFileVersionDiff'),(0,30703,'com.liferay.sync.model.SyncDLObject'),(0,30801,'com.liferay.journal.model.JournalArticle'),(0,30802,'com.liferay.journal.model.JournalArticleImage'),(0,30803,'com.liferay.journal.model.JournalArticleResource'),(0,30804,'com.liferay.journal.model.JournalContentSearch'),(0,30805,'com.liferay.journal.model.JournalFeed'),(0,30806,'com.liferay.journal.model.JournalFolder'),(0,31019,'com.liferay.testray.model.TestrayArchive'),(0,31020,'com.liferay.testray.model.TestrayAssignment'),(0,31021,'com.liferay.testray.model.TestrayBuild'),(0,31022,'com.liferay.testray.model.TestrayBuildMetric'),(0,31023,'com.liferay.testray.model.TestrayBuildType'),(0,31024,'com.liferay.testray.model.TestrayCase'),(0,31025,'com.liferay.testray.model.TestrayCaseResult'),(0,31026,'com.liferay.testray.model.TestrayCaseResultWarning'),(0,31027,'com.liferay.testray.model.TestrayCaseType'),(0,31028,'com.liferay.testray.model.TestrayComponent'),(0,31029,'com.liferay.testray.model.TestrayFactor'),(0,31030,'com.liferay.testray.model.TestrayFactorCategory'),(0,31031,'com.liferay.testray.model.TestrayFactorOption'),(0,31032,'com.liferay.testray.model.TestrayIssue'),(0,31033,'com.liferay.testray.model.TestrayProductVersion'),(0,31034,'com.liferay.testray.model.TestrayProject'),(0,31035,'com.liferay.testray.model.TestrayRun'),(0,31036,'com.liferay.testray.model.TestraySubtask'),(0,31037,'com.liferay.testray.model.TestraySuite'),(0,31038,'com.liferay.testray.model.TestrayTask'),(0,31039,'com.liferay.testray.model.TestrayTeam'),(0,31253,'com.liferay.dynamic.data.lists.model.DDLFormRecord');
UNLOCK TABLES;

--
-- Table structure for table `ClusterGroup`
--

CREATE TABLE `ClusterGroup` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `clusterGroupId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `clusterNodeIds` varchar(75) DEFAULT NULL,
  `wholeCluster` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`clusterGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `companyId` bigint(20) NOT NULL,
  `accountId` bigint(20) DEFAULT NULL,
  `webId` varchar(75) DEFAULT NULL,
  `key_` longtext,
  `mx` varchar(75) DEFAULT NULL,
  `homeURL` longtext,
  `logoId` bigint(20) DEFAULT NULL,
  `system` tinyint(4) DEFAULT NULL,
  `maxUsers` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`companyId`),
  UNIQUE KEY `IX_EC00543C` (`webId`),
  KEY `IX_38EFE3FD` (`logoId`),
  KEY `IX_12566EC2` (`mx`),
  KEY `IX_35E3E7C6` (`system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
INSERT INTO `Company` VALUES (1,20116,20118,'liferay.com','c0ceR5QQ36InKL08Z5Fp7A==','liferay.com',NULL,0,0,0,1);
UNLOCK TABLES;

--
-- Table structure for table `Configuration_`
--

CREATE TABLE `Configuration_` (
  `configurationId` varchar(255) NOT NULL,
  `dictionary` longtext,
  PRIMARY KEY (`configurationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Contact_`
--

CREATE TABLE `Contact_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `contactId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `accountId` bigint(20) DEFAULT NULL,
  `parentContactId` bigint(20) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `firstName` varchar(75) DEFAULT NULL,
  `middleName` varchar(75) DEFAULT NULL,
  `lastName` varchar(75) DEFAULT NULL,
  `prefixId` bigint(20) DEFAULT NULL,
  `suffixId` bigint(20) DEFAULT NULL,
  `male` tinyint(4) DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `smsSn` varchar(75) DEFAULT NULL,
  `facebookSn` varchar(75) DEFAULT NULL,
  `jabberSn` varchar(75) DEFAULT NULL,
  `skypeSn` varchar(75) DEFAULT NULL,
  `twitterSn` varchar(75) DEFAULT NULL,
  `employeeStatusId` varchar(75) DEFAULT NULL,
  `employeeNumber` varchar(75) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `jobClass` varchar(75) DEFAULT NULL,
  `hoursOfOperation` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `IX_B8C28C53` (`accountId`),
  KEY `IX_791914FA` (`classNameId`,`classPK`),
  KEY `IX_66D496A3` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Contact_`
--

LOCK TABLES `Contact_` WRITE;
INSERT INTO `Contact_` VALUES (0,20121,20116,20120,NULL,'2017-06-03 00:42:22.992000','2017-06-03 00:42:22.992000',20087,20120,20118,0,'default@liferay.com',NULL,NULL,NULL,0,0,1,'2017-06-03 00:42:22.868000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(0,20157,20116,20156,NULL,'2017-06-03 00:42:24.576000','2017-06-03 00:42:24.576000',20087,20156,20118,0,'test@liferay.com','Test',NULL,'Test',0,0,1,'1970-01-01 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,31302,20116,20156,'Test Test','2017-06-03 00:49:07.172000','2017-06-03 00:51:32.694000',20087,31301,20118,0,'sir.testalot@liferay.com','Sir',NULL,'Testalot',1,2,1,'1970-01-01 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `Contacts_Entry`
--

CREATE TABLE `Contacts_Entry` (
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `fullName` varchar(75) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `comments` longtext,
  PRIMARY KEY (`entryId`),
  KEY `IX_C257DE32` (`userId`,`emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Counter`
--

CREATE TABLE `Counter` (
  `name` varchar(75) NOT NULL,
  `currentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Counter`
--

LOCK TABLES `Counter` WRITE;
INSERT INTO `Counter` VALUES ('com.liferay.counter.kernel.model.Counter',31400),('com.liferay.portal.kernel.model.Layout#20133#true',1),('com.liferay.portal.kernel.model.Layout#20140#false',1),('com.liferay.portal.kernel.model.Layout#20143#false',1),('com.liferay.portal.kernel.model.Layout#20158#false',1),('com.liferay.portal.kernel.model.Layout#20158#true',1),('com.liferay.portal.kernel.model.Layout#31002#true',1),('com.liferay.portal.kernel.model.Layout#31081#true',1),('com.liferay.portal.kernel.model.Layout#31144#true',1),('com.liferay.portal.kernel.model.Layout#31152#true',2),('com.liferay.portal.kernel.model.Layout#31172#true',1),('com.liferay.portal.kernel.model.Layout#31197#true',3),('com.liferay.portal.kernel.model.ListType',100),('com.liferay.portal.kernel.model.ResourceAction',2500),('com.liferay.portal.kernel.model.ResourceBlock',100),('com.liferay.portal.kernel.model.ResourcePermission',1700);
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `countryId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `a2` varchar(75) DEFAULT NULL,
  `a3` varchar(75) DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `idd_` varchar(75) DEFAULT NULL,
  `zipRequired` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`countryId`),
  UNIQUE KEY `IX_717B97E1` (`a2`),
  UNIQUE KEY `IX_717B9BA2` (`a3`),
  UNIQUE KEY `IX_19DA007B` (`name`),
  KEY `IX_25D734CD` (`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
INSERT INTO `Country` VALUES (0,1,'canada','CA','CAN','124','001',1,1),(0,2,'china','CN','CHN','156','086',1,1),(0,3,'france','FR','FRA','250','033',1,1),(0,4,'germany','DE','DEU','276','049',1,1),(0,5,'hong-kong','HK','HKG','344','852',1,1),(0,6,'hungary','HU','HUN','348','036',1,1),(0,7,'israel','IL','ISR','376','972',1,1),(0,8,'italy','IT','ITA','380','039',1,1),(0,9,'japan','JP','JPN','392','081',0,1),(0,10,'south-korea','KR','KOR','410','082',1,1),(0,11,'netherlands','NL','NLD','528','031',1,1),(0,12,'portugal','PT','PRT','620','351',1,1),(0,13,'russia','RU','RUS','643','007',1,1),(0,14,'singapore','SG','SGP','702','065',1,1),(0,15,'spain','ES','ESP','724','034',1,1),(0,16,'turkey','TR','TUR','792','090',1,1),(0,17,'vietnam','VN','VNM','704','084',1,1),(0,18,'united-kingdom','GB','GBR','826','044',1,1),(0,19,'united-states','US','USA','840','001',1,1),(0,20,'afghanistan','AF','AFG','4','093',1,1),(0,21,'albania','AL','ALB','8','355',1,1),(0,22,'algeria','DZ','DZA','12','213',1,1),(0,23,'american-samoa','AS','ASM','16','684',1,1),(0,24,'andorra','AD','AND','20','376',1,1),(0,25,'angola','AO','AGO','24','244',0,1),(0,26,'anguilla','AI','AIA','660','264',1,1),(0,27,'antarctica','AQ','ATA','10','672',1,1),(0,28,'antigua-barbuda','AG','ATG','28','268',0,1),(0,29,'argentina','AR','ARG','32','054',1,1),(0,30,'armenia','AM','ARM','51','374',1,1),(0,31,'aruba','AW','ABW','533','297',0,1),(0,32,'australia','AU','AUS','36','061',1,1),(0,33,'austria','AT','AUT','40','043',1,1),(0,34,'azerbaijan','AZ','AZE','31','994',1,1),(0,35,'bahamas','BS','BHS','44','242',0,1),(0,36,'bahrain','BH','BHR','48','973',1,1),(0,37,'bangladesh','BD','BGD','50','880',1,1),(0,38,'barbados','BB','BRB','52','246',1,1),(0,39,'belarus','BY','BLR','112','375',1,1),(0,40,'belgium','BE','BEL','56','032',1,1),(0,41,'belize','BZ','BLZ','84','501',0,1),(0,42,'benin','BJ','BEN','204','229',0,1),(0,43,'bermuda','BM','BMU','60','441',1,1),(0,44,'bhutan','BT','BTN','64','975',1,1),(0,45,'bolivia','BO','BOL','68','591',1,1),(0,46,'bosnia-herzegovina','BA','BIH','70','387',1,1),(0,47,'botswana','BW','BWA','72','267',0,1),(0,48,'brazil','BR','BRA','76','055',1,1),(0,49,'british-virgin-islands','VG','VGB','92','284',1,1),(0,50,'brunei','BN','BRN','96','673',1,1),(0,51,'bulgaria','BG','BGR','100','359',1,1),(0,52,'burkina-faso','BF','BFA','854','226',0,1),(0,53,'burma-myanmar','MM','MMR','104','095',1,1),(0,54,'burundi','BI','BDI','108','257',0,1),(0,55,'cambodia','KH','KHM','116','855',1,1),(0,56,'cameroon','CM','CMR','120','237',1,1),(0,57,'cape-verde-island','CV','CPV','132','238',1,1),(0,58,'cayman-islands','KY','CYM','136','345',1,1),(0,59,'central-african-republic','CF','CAF','140','236',0,1),(0,60,'chad','TD','TCD','148','235',1,1),(0,61,'chile','CL','CHL','152','056',1,1),(0,62,'christmas-island','CX','CXR','162','061',1,1),(0,63,'cocos-islands','CC','CCK','166','061',1,1),(0,64,'colombia','CO','COL','170','057',1,1),(0,65,'comoros','KM','COM','174','269',0,1),(0,66,'republic-of-congo','CD','COD','180','242',0,1),(0,67,'democratic-republic-of-congo','CG','COG','178','243',0,1),(0,68,'cook-islands','CK','COK','184','682',0,1),(0,69,'costa-rica','CR','CRI','188','506',1,1),(0,70,'croatia','HR','HRV','191','385',1,1),(0,71,'cuba','CU','CUB','192','053',1,1),(0,72,'cyprus','CY','CYP','196','357',1,1),(0,73,'czech-republic','CZ','CZE','203','420',1,1),(0,74,'denmark','DK','DNK','208','045',1,1),(0,75,'djibouti','DJ','DJI','262','253',0,1),(0,76,'dominica','DM','DMA','212','767',0,1),(0,77,'dominican-republic','DO','DOM','214','809',1,1),(0,78,'ecuador','EC','ECU','218','593',1,1),(0,79,'egypt','EG','EGY','818','020',1,1),(0,80,'el-salvador','SV','SLV','222','503',1,1),(0,81,'equatorial-guinea','GQ','GNQ','226','240',0,1),(0,82,'eritrea','ER','ERI','232','291',0,1),(0,83,'estonia','EE','EST','233','372',1,1),(0,84,'ethiopia','ET','ETH','231','251',1,1),(0,85,'faeroe-islands','FO','FRO','234','298',1,1),(0,86,'falkland-islands','FK','FLK','238','500',1,1),(0,87,'fiji-islands','FJ','FJI','242','679',0,1),(0,88,'finland','FI','FIN','246','358',1,1),(0,89,'french-guiana','GF','GUF','254','594',1,1),(0,90,'french-polynesia','PF','PYF','258','689',1,1),(0,91,'gabon','GA','GAB','266','241',1,1),(0,92,'gambia','GM','GMB','270','220',0,1),(0,93,'georgia','GE','GEO','268','995',1,1),(0,94,'ghana','GH','GHA','288','233',0,1),(0,95,'gibraltar','GI','GIB','292','350',1,1),(0,96,'greece','GR','GRC','300','030',1,1),(0,97,'greenland','GL','GRL','304','299',1,1),(0,98,'grenada','GD','GRD','308','473',0,1),(0,99,'guadeloupe','GP','GLP','312','590',1,1),(0,100,'guam','GU','GUM','316','671',1,1),(0,101,'guatemala','GT','GTM','320','502',1,1),(0,102,'guinea','GN','GIN','324','224',0,1),(0,103,'guinea-bissau','GW','GNB','624','245',1,1),(0,104,'guyana','GY','GUY','328','592',0,1),(0,105,'haiti','HT','HTI','332','509',1,1),(0,106,'honduras','HN','HND','340','504',1,1),(0,107,'iceland','IS','ISL','352','354',1,1),(0,108,'india','IN','IND','356','091',1,1),(0,109,'indonesia','ID','IDN','360','062',1,1),(0,110,'iran','IR','IRN','364','098',1,1),(0,111,'iraq','IQ','IRQ','368','964',1,1),(0,112,'ireland','IE','IRL','372','353',0,1),(0,113,'ivory-coast','CI','CIV','384','225',1,1),(0,114,'jamaica','JM','JAM','388','876',1,1),(0,115,'jordan','JO','JOR','400','962',1,1),(0,116,'kazakhstan','KZ','KAZ','398','007',1,1),(0,117,'kenya','KE','KEN','404','254',1,1),(0,118,'kiribati','KI','KIR','408','686',0,1),(0,119,'kuwait','KW','KWT','414','965',1,1),(0,120,'north-korea','KP','PRK','408','850',0,1),(0,121,'kyrgyzstan','KG','KGZ','471','996',1,1),(0,122,'laos','LA','LAO','418','856',1,1),(0,123,'latvia','LV','LVA','428','371',1,1),(0,124,'lebanon','LB','LBN','422','961',1,1),(0,125,'lesotho','LS','LSO','426','266',1,1),(0,126,'liberia','LR','LBR','430','231',1,1),(0,127,'libya','LY','LBY','434','218',1,1),(0,128,'liechtenstein','LI','LIE','438','423',1,1),(0,129,'lithuania','LT','LTU','440','370',1,1),(0,130,'luxembourg','LU','LUX','442','352',1,1),(0,131,'macau','MO','MAC','446','853',0,1),(0,132,'macedonia','MK','MKD','807','389',1,1),(0,133,'madagascar','MG','MDG','450','261',1,1),(0,134,'malawi','MW','MWI','454','265',0,1),(0,135,'malaysia','MY','MYS','458','060',1,1),(0,136,'maldives','MV','MDV','462','960',1,1),(0,137,'mali','ML','MLI','466','223',0,1),(0,138,'malta','MT','MLT','470','356',1,1),(0,139,'marshall-islands','MH','MHL','584','692',1,1),(0,140,'martinique','MQ','MTQ','474','596',1,1),(0,141,'mauritania','MR','MRT','478','222',0,1),(0,142,'mauritius','MU','MUS','480','230',0,1),(0,143,'mayotte-island','YT','MYT','175','269',1,1),(0,144,'mexico','MX','MEX','484','052',1,1),(0,145,'micronesia','FM','FSM','583','691',1,1),(0,146,'moldova','MD','MDA','498','373',1,1),(0,147,'monaco','MC','MCO','492','377',1,1),(0,148,'mongolia','MN','MNG','496','976',1,1),(0,149,'montenegro','ME','MNE','499','382',1,1),(0,150,'montserrat','MS','MSR','500','664',0,1),(0,151,'morocco','MA','MAR','504','212',1,1),(0,152,'mozambique','MZ','MOZ','508','258',1,1),(0,153,'namibia','NA','NAM','516','264',1,1),(0,154,'nauru','NR','NRU','520','674',0,1),(0,155,'nepal','NP','NPL','524','977',1,1),(0,156,'netherlands-antilles','AN','ANT','530','599',1,1),(0,157,'new-caledonia','NC','NCL','540','687',1,1),(0,158,'new-zealand','NZ','NZL','554','064',1,1),(0,159,'nicaragua','NI','NIC','558','505',1,1),(0,160,'niger','NE','NER','562','227',1,1),(0,161,'nigeria','NG','NGA','566','234',1,1),(0,162,'niue','NU','NIU','570','683',0,1),(0,163,'norfolk-island','NF','NFK','574','672',1,1),(0,164,'norway','NO','NOR','578','047',1,1),(0,165,'oman','OM','OMN','512','968',1,1),(0,166,'pakistan','PK','PAK','586','092',1,1),(0,167,'palau','PW','PLW','585','680',1,1),(0,168,'palestine','PS','PSE','275','970',1,1),(0,169,'panama','PA','PAN','591','507',1,1),(0,170,'papua-new-guinea','PG','PNG','598','675',1,1),(0,171,'paraguay','PY','PRY','600','595',1,1),(0,172,'peru','PE','PER','604','051',1,1),(0,173,'philippines','PH','PHL','608','063',1,1),(0,174,'poland','PL','POL','616','048',1,1),(0,175,'puerto-rico','PR','PRI','630','787',1,1),(0,176,'qatar','QA','QAT','634','974',0,1),(0,177,'reunion-island','RE','REU','638','262',1,1),(0,178,'romania','RO','ROU','642','040',1,1),(0,179,'rwanda','RW','RWA','646','250',0,1),(0,180,'st-helena','SH','SHN','654','290',1,1),(0,181,'st-kitts','KN','KNA','659','869',0,1),(0,182,'st-lucia','LC','LCA','662','758',0,1),(0,183,'st-pierre-miquelon','PM','SPM','666','508',1,1),(0,184,'st-vincent','VC','VCT','670','784',1,1),(0,185,'san-marino','SM','SMR','674','378',1,1),(0,186,'sao-tome-principe','ST','STP','678','239',0,1),(0,187,'saudi-arabia','SA','SAU','682','966',1,1),(0,188,'senegal','SN','SEN','686','221',1,1),(0,189,'serbia','RS','SRB','688','381',1,1),(0,190,'seychelles','SC','SYC','690','248',0,1),(0,191,'sierra-leone','SL','SLE','694','249',0,1),(0,192,'slovakia','SK','SVK','703','421',1,1),(0,193,'slovenia','SI','SVN','705','386',1,1),(0,194,'solomon-islands','SB','SLB','90','677',0,1),(0,195,'somalia','SO','SOM','706','252',0,1),(0,196,'south-africa','ZA','ZAF','710','027',1,1),(0,197,'sri-lanka','LK','LKA','144','094',1,1),(0,198,'sudan','SD','SDN','736','095',1,1),(0,199,'suriname','SR','SUR','740','597',0,1),(0,200,'swaziland','SZ','SWZ','748','268',1,1),(0,201,'sweden','SE','SWE','752','046',1,1),(0,202,'switzerland','CH','CHE','756','041',1,1),(0,203,'syria','SY','SYR','760','963',0,1),(0,204,'taiwan','TW','TWN','158','886',1,1),(0,205,'tajikistan','TJ','TJK','762','992',1,1),(0,206,'tanzania','TZ','TZA','834','255',0,1),(0,207,'thailand','TH','THA','764','066',1,1),(0,208,'togo','TG','TGO','768','228',1,1),(0,209,'tonga','TO','TON','776','676',0,1),(0,210,'trinidad-tobago','TT','TTO','780','868',0,1),(0,211,'tunisia','TN','TUN','788','216',1,1),(0,212,'turkmenistan','TM','TKM','795','993',1,1),(0,213,'turks-caicos','TC','TCA','796','649',1,1),(0,214,'tuvalu','TV','TUV','798','688',0,1),(0,215,'uganda','UG','UGA','800','256',0,1),(0,216,'ukraine','UA','UKR','804','380',1,1),(0,217,'united-arab-emirates','AE','ARE','784','971',0,1),(0,218,'uruguay','UY','URY','858','598',1,1),(0,219,'uzbekistan','UZ','UZB','860','998',1,1),(0,220,'vanuatu','VU','VUT','548','678',0,1),(0,221,'vatican-city','VA','VAT','336','039',1,1),(0,222,'venezuela','VE','VEN','862','058',1,1),(0,223,'wallis-futuna','WF','WLF','876','681',1,1),(0,224,'western-samoa','WS','WSM','882','685',1,1),(0,225,'yemen','YE','YEM','887','967',0,1),(0,226,'zambia','ZM','ZMB','894','260',1,1),(0,227,'zimbabwe','ZW','ZWE','716','263',0,1),(0,228,'aland-islands','AX','ALA','248','359',1,1),(0,229,'bonaire-st-eustatius-saba','BQ','BES','535','599',1,1),(0,230,'bouvet-island','BV','BVT','74','047',1,1),(0,231,'british-indian-ocean-territory','IO','IOT','86','246',1,1),(0,232,'curacao','CW','CUW','531','599',1,1),(0,233,'french-southern-territories','TF','ATF','260','033',0,1),(0,234,'guernsey','GG','GGY','831','044',1,1),(0,235,'heard-island-mcdonald-islands','HM','HMD','334','061',1,1),(0,236,'isle-of-man','IM','IMN','833','044',1,1),(0,237,'jersey','JE','JEY','832','044',1,1),(0,238,'northern-mariana-islands','MP','MNP','580','670',1,1),(0,239,'pitcairn','PN','PCN','612','649',1,1),(0,240,'south-georgia-south-sandwich-islands','GS','SGS','239','044',1,1),(0,241,'south-sudan','SS','SSD','728','211',1,1),(0,242,'sint-maarten','SX','SXM','534','721',1,1),(0,243,'st-barthelemy','BL','BLM','652','590',1,1),(0,244,'st-martin','MF','MAF','663','590',1,1),(0,245,'tokelau','TK','TKL','772','690',0,1),(0,246,'timor-leste','TL','TLS','626','670',1,1),(0,247,'united-states-minor-outlying-islands','UM','UMI','581','699',1,1),(0,248,'united-states-virgin-islands','VI','VIR','850','340',1,1),(0,249,'western-sahara','EH','ESH','732','212',1,1);
UNLOCK TABLES;

--
-- Table structure for table `DDLRecord`
--

CREATE TABLE `DDLRecord` (
  `uuid_` varchar(75) DEFAULT NULL,
  `recordId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `versionUserId` bigint(20) DEFAULT NULL,
  `versionUserName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `recordSetId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `displayIndex` int(11) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`recordId`),
  UNIQUE KEY `IX_B4328F39` (`uuid_`,`groupId`),
  KEY `IX_6A6C1C85` (`companyId`),
  KEY `IX_AAC564D3` (`recordSetId`,`userId`),
  KEY `IX_384AB6F7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDLRecordSet`
--

CREATE TABLE `DDLRecordSet` (
  `uuid_` varchar(75) DEFAULT NULL,
  `recordSetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `DDMStructureId` bigint(20) DEFAULT NULL,
  `recordSetKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `minDisplayRows` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `settings_` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`recordSetId`),
  UNIQUE KEY `IX_56DAB121` (`groupId`,`recordSetKey`),
  UNIQUE KEY `IX_270BA5E1` (`uuid_`,`groupId`),
  KEY `IX_5938C39F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDLRecordVersion`
--

CREATE TABLE `DDLRecordVersion` (
  `recordVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `recordSetId` bigint(20) DEFAULT NULL,
  `recordId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `displayIndex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`recordVersionId`),
  UNIQUE KEY `IX_C79E347` (`recordId`,`version`),
  KEY `IX_762ADC7` (`recordId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMContent`
--

CREATE TABLE `DDMContent` (
  `uuid_` varchar(75) DEFAULT NULL,
  `contentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `data_` longtext,
  PRIMARY KEY (`contentId`),
  UNIQUE KEY `IX_EB9BDE28` (`uuid_`,`groupId`),
  KEY `IX_E3BAF436` (`companyId`),
  KEY `IX_50BF1038` (`groupId`),
  KEY `IX_3A9C0626` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMDataProviderInstance`
--

CREATE TABLE `DDMDataProviderInstance` (
  `uuid_` varchar(75) DEFAULT NULL,
  `dataProviderInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `definition` longtext,
  `type_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`dataProviderInstanceId`),
  UNIQUE KEY `IX_B4E180D9` (`uuid_`,`groupId`),
  KEY `IX_DB54A6E5` (`companyId`),
  KEY `IX_1333A2A7` (`groupId`),
  KEY `IX_C903C097` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMDataProviderInstanceLink`
--

CREATE TABLE `DDMDataProviderInstanceLink` (
  `dataProviderInstanceLinkId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `dataProviderInstanceId` bigint(20) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`dataProviderInstanceLinkId`),
  UNIQUE KEY `IX_8C878342` (`dataProviderInstanceId`,`structureId`),
  KEY `IX_CB823541` (`structureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMStorageLink`
--

CREATE TABLE `DDMStorageLink` (
  `uuid_` varchar(75) DEFAULT NULL,
  `storageLinkId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`storageLinkId`),
  UNIQUE KEY `IX_702D1AD5` (`classPK`),
  KEY `IX_81776090` (`structureId`),
  KEY `IX_DB81EB42` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMStructure`
--

CREATE TABLE `DDMStructure` (
  `uuid_` varchar(75) DEFAULT NULL,
  `structureId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `versionUserId` bigint(20) DEFAULT NULL,
  `versionUserName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `parentStructureId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `structureKey` varchar(75) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `definition` longtext,
  `storageType` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`structureId`),
  UNIQUE KEY `IX_C8785130` (`groupId`,`classNameId`,`structureKey`),
  UNIQUE KEY `IX_85C7EBE2` (`uuid_`,`groupId`),
  KEY `IX_31817A62` (`classNameId`),
  KEY `IX_4FBAC092` (`companyId`,`classNameId`),
  KEY `IX_43395316` (`groupId`,`parentStructureId`),
  KEY `IX_657899A8` (`parentStructureId`),
  KEY `IX_20FDE04C` (`structureKey`),
  KEY `IX_F9FB8D60` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMStructureLayout`
--

CREATE TABLE `DDMStructureLayout` (
  `uuid_` varchar(75) DEFAULT NULL,
  `structureLayoutId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `structureVersionId` bigint(20) DEFAULT NULL,
  `definition` longtext,
  PRIMARY KEY (`structureLayoutId`),
  UNIQUE KEY `IX_B7158C0A` (`structureVersionId`),
  UNIQUE KEY `IX_C9A0402C` (`uuid_`,`groupId`),
  KEY `IX_A90FF72A` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMStructureLink`
--

CREATE TABLE `DDMStructureLink` (
  `structureLinkId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`structureLinkId`),
  UNIQUE KEY `IX_E43143A3` (`classNameId`,`classPK`,`structureId`),
  KEY `IX_17692B58` (`structureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DDMStructureLink`
--

LOCK TABLES `DDMStructureLink` WRITE;
INSERT INTO `DDMStructureLink` VALUES (30130,20116,20017,30126,30127),(30135,20116,20017,30131,30120),(30136,20116,20017,30131,30132),(30141,20116,20017,30137,30117),(30142,20116,20017,30137,30138),(30147,20116,20017,30143,30144),(30148,20116,20017,30143,30123);
UNLOCK TABLES;

--
-- Table structure for table `DDMStructureVersion`
--

CREATE TABLE `DDMStructureVersion` (
  `structureVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `parentStructureId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `definition` longtext,
  `storageType` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`structureVersionId`),
  UNIQUE KEY `IX_64C3C42` (`structureId`,`version`),
  KEY `IX_17B3C96C` (`structureId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMTemplate`
--

CREATE TABLE `DDMTemplate` (
  `uuid_` varchar(75) DEFAULT NULL,
  `templateId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `versionUserId` bigint(20) DEFAULT NULL,
  `versionUserName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `resourceClassNameId` bigint(20) DEFAULT NULL,
  `templateKey` varchar(75) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `mode_` varchar(75) DEFAULT NULL,
  `language` varchar(75) DEFAULT NULL,
  `script` longtext,
  `cacheable` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` varchar(75) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`templateId`),
  UNIQUE KEY `IX_E6DFAB84` (`groupId`,`classNameId`,`templateKey`),
  UNIQUE KEY `IX_1AA75CE3` (`uuid_`,`groupId`),
  KEY `IX_B6356F93` (`classNameId`,`classPK`,`type_`),
  KEY `IX_32F83D16` (`classPK`),
  KEY `IX_F0C3449` (`groupId`,`classNameId`,`classPK`,`type_`,`mode_`),
  KEY `IX_B1C33EA6` (`groupId`,`classPK`),
  KEY `IX_33BEF579` (`language`),
  KEY `IX_127A35B0` (`smallImageId`),
  KEY `IX_CAE41A28` (`templateKey`),
  KEY `IX_C4F283C8` (`type_`),
  KEY `IX_D4C2C221` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMTemplateLink`
--

CREATE TABLE `DDMTemplateLink` (
  `templateLinkId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`templateLinkId`),
  UNIQUE KEY `IX_6F3B3E9C` (`classNameId`,`classPK`),
  KEY `IX_85278170` (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DDMTemplateVersion`
--

CREATE TABLE `DDMTemplateVersion` (
  `templateVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `language` varchar(75) DEFAULT NULL,
  `script` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`templateVersionId`),
  UNIQUE KEY `IX_8854A128` (`templateId`,`version`),
  KEY `IX_66382FC6` (`templateId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLContent`
--

CREATE TABLE `DLContent` (
  `contentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `path_` varchar(255) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `data_` longblob,
  `size_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  UNIQUE KEY `IX_FDD1AAA8` (`companyId`,`repositoryId`,`path_`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLFileEntry`
--

CREATE TABLE `DLFileEntry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `extraSettings` longtext,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `readCount` int(11) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `largeImageId` bigint(20) DEFAULT NULL,
  `custom1ImageId` bigint(20) DEFAULT NULL,
  `custom2ImageId` bigint(20) DEFAULT NULL,
  `manualCheckInRequired` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`fileEntryId`),
  UNIQUE KEY `IX_DF37D92E` (`groupId`,`folderId`,`fileName`),
  UNIQUE KEY `IX_5391712` (`groupId`,`folderId`,`name`),
  UNIQUE KEY `IX_ED5CA615` (`groupId`,`folderId`,`title`),
  UNIQUE KEY `IX_BC2E7E6A` (`uuid_`,`groupId`),
  KEY `IX_5444C427` (`companyId`,`fileEntryTypeId`),
  KEY `IX_772ECDE7` (`fileEntryTypeId`),
  KEY `IX_8F6C75D0` (`folderId`,`name`),
  KEY `IX_BAF654E5` (`groupId`,`fileEntryTypeId`),
  KEY `IX_29D0AF28` (`groupId`,`folderId`,`fileEntryTypeId`),
  KEY `IX_D20C434D` (`groupId`,`userId`,`folderId`),
  KEY `IX_D9492CF6` (`mimeType`),
  KEY `IX_1B352F4A` (`repositoryId`,`folderId`),
  KEY `IX_25F5CAB9` (`smallImageId`,`largeImageId`,`custom1ImageId`,`custom2ImageId`),
  KEY `IX_31079DE8` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLFileEntryMetadata`
--

CREATE TABLE `DLFileEntryMetadata` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryMetadataId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `DDMStructureId` bigint(20) DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `fileVersionId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`fileEntryMetadataId`),
  UNIQUE KEY `IX_7332B44F` (`DDMStructureId`,`fileVersionId`),
  KEY `IX_4F40FE5E` (`fileEntryId`),
  KEY `IX_1FE9C04` (`fileVersionId`),
  KEY `IX_E69431B7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLFileEntryType`
--

CREATE TABLE `DLFileEntryType` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryTypeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `fileEntryTypeKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`fileEntryTypeId`),
  UNIQUE KEY `IX_5B6BEF5F` (`groupId`,`fileEntryTypeKey`),
  UNIQUE KEY `IX_1399D844` (`uuid_`,`groupId`),
  KEY `IX_5B03E942` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DLFileEntryType`
--

LOCK TABLES `DLFileEntryType` WRITE;
INSERT INTO `DLFileEntryType` VALUES ('28395f71-4a53-a754-7fc2-18302684df65',0,0,0,0,NULL,'2017-06-03 00:44:26.367000','2017-06-03 00:44:26.367000','BASIC-DOCUMENT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">basic-document</Name></root>',NULL,NULL),('2ceba7c6-02d1-f9e4-7e6f-18acf6b444d7',30126,20152,20116,20120,NULL,'2017-06-03 00:44:25.240000','2017-06-03 00:44:25.240000','CONTRACT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">合同</Name><Name language-id=\"es_ES\">Contratos</Name><Name language-id=\"ja_JP\">コントラクト</Name><Name language-id=\"nl_NL\">Contracten</Name><Name language-id=\"hu_HU\">Szerződés</Name><Name language-id=\"pt_BR\">Contrato</Name><Name language-id=\"de_DE\">Vertrag</Name><Name language-id=\"iw_IL\">חוזים</Name><Name language-id=\"fi_FI\">Sopimus</Name><Name language-id=\"ca_ES\">Contractes</Name><Name language-id=\"fr_FR\">Contrats</Name><Name language-id=\"en_US\">Contract</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">合同</Description><Description language-id=\"es_ES\">Contratos</Description><Description language-id=\"ja_JP\">コントラクト</Description><Description language-id=\"nl_NL\">Contracten</Description><Description language-id=\"hu_HU\">Szerződés</Description><Description language-id=\"pt_BR\">Contrato</Description><Description language-id=\"de_DE\">Vertrag</Description><Description language-id=\"iw_IL\">חוזים</Description><Description language-id=\"fi_FI\">Sopimus</Description><Description language-id=\"ca_ES\">Contractes</Description><Description language-id=\"fr_FR\">Contrats</Description><Description language-id=\"en_US\">Contract</Description></root>',NULL),('254bfcf2-cadf-66bd-abdc-f03e069d7238',30131,20152,20116,20120,NULL,'2017-06-03 00:44:25.311000','2017-06-03 00:44:25.311000','MARKETING BANNER','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">营销标语</Name><Name language-id=\"es_ES\">Banner comercial</Name><Name language-id=\"ja_JP\">マーケティングバナー</Name><Name language-id=\"nl_NL\">Marketingbanner</Name><Name language-id=\"hu_HU\">Hírdetési csík</Name><Name language-id=\"pt_BR\">Banner de Marketing</Name><Name language-id=\"de_DE\">Marketingbanner</Name><Name language-id=\"iw_IL\">באנר שיווקי</Name><Name language-id=\"fi_FI\">Markkinointimainospalkki</Name><Name language-id=\"ca_ES\">Bàner de màrqueting</Name><Name language-id=\"fr_FR\">Bannière commerciale</Name><Name language-id=\"en_US\">Marketing Banner</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">营销标语</Description><Description language-id=\"es_ES\">Banner comercial</Description><Description language-id=\"ja_JP\">マーケティングバナー</Description><Description language-id=\"nl_NL\">Marketingbanner</Description><Description language-id=\"hu_HU\">Hírdetési csík</Description><Description language-id=\"pt_BR\">Banner de Marketing</Description><Description language-id=\"de_DE\">Marketingbanner</Description><Description language-id=\"iw_IL\">באנר שיווקי</Description><Description language-id=\"fi_FI\">Markkinointimainospalkki</Description><Description language-id=\"ca_ES\">Bàner de màrqueting</Description><Description language-id=\"fr_FR\">Bannière commerciale</Description><Description language-id=\"en_US\">Marketing Banner</Description></root>',NULL),('96846bd2-a7df-fe4f-7dd3-2d69d118d17b',30137,20152,20116,20120,NULL,'2017-06-03 00:44:25.414000','2017-06-03 00:44:25.414000','ONLINE TRAINING','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">在线培训</Name><Name language-id=\"es_ES\">Formación en línea</Name><Name language-id=\"ja_JP\">オンライントレーニング</Name><Name language-id=\"nl_NL\">Online training</Name><Name language-id=\"hu_HU\">Online tanfolyam</Name><Name language-id=\"pt_BR\">Treinamento Online</Name><Name language-id=\"de_DE\">Online-Training</Name><Name language-id=\"iw_IL\">הכשרה מקוונת</Name><Name language-id=\"fi_FI\">Online koulutus</Name><Name language-id=\"ca_ES\">Fromació en línia</Name><Name language-id=\"fr_FR\">Formation en ligne</Name><Name language-id=\"en_US\">Online Training</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">在线培训</Description><Description language-id=\"es_ES\">Formación en línea</Description><Description language-id=\"ja_JP\">オンライントレーニング</Description><Description language-id=\"nl_NL\">Online training</Description><Description language-id=\"hu_HU\">Online tanfolyam</Description><Description language-id=\"pt_BR\">Treinamento Online</Description><Description language-id=\"de_DE\">Online-Training</Description><Description language-id=\"iw_IL\">הכשרה מקוונת</Description><Description language-id=\"fi_FI\">Online koulutus</Description><Description language-id=\"ca_ES\">Fromació en línia</Description><Description language-id=\"fr_FR\">Formation en ligne</Description><Description language-id=\"en_US\">Online Training</Description></root>',NULL),('b82e543a-ccef-40b3-16c8-2383cb28afe7',30143,20152,20116,20120,NULL,'2017-06-03 00:44:25.480000','2017-06-03 00:44:25.480000','SALES PRESENTATION','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">销售报告</Name><Name language-id=\"es_ES\">Presentación de ventas</Name><Name language-id=\"ja_JP\">セールスプレゼンテーション</Name><Name language-id=\"nl_NL\">Verkooppresentatie</Name><Name language-id=\"hu_HU\">Kereskedői előadás</Name><Name language-id=\"pt_BR\">Apresentação de Vendas</Name><Name language-id=\"de_DE\">Vertriebspräsentation</Name><Name language-id=\"iw_IL\">מצגת מכירות</Name><Name language-id=\"fi_FI\">Myynti esitys</Name><Name language-id=\"ca_ES\">Presentació de vendes</Name><Name language-id=\"fr_FR\">Présentation des ventes</Name><Name language-id=\"en_US\">Sales Presentation</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">销售报告</Description><Description language-id=\"es_ES\">Presentación de ventas</Description><Description language-id=\"ja_JP\">セールスプレゼンテーション</Description><Description language-id=\"nl_NL\">Verkooppresentatie</Description><Description language-id=\"hu_HU\">Kereskedői előadás</Description><Description language-id=\"pt_BR\">Apresentação de Vendas</Description><Description language-id=\"de_DE\">Vertriebspräsentation</Description><Description language-id=\"iw_IL\">מצגת מכירות</Description><Description language-id=\"fi_FI\">Myynti esitys</Description><Description language-id=\"ca_ES\">Presentació de vendes</Description><Description language-id=\"fr_FR\">Présentation des ventes</Description><Description language-id=\"en_US\">Sales Presentation</Description></root>',NULL);
UNLOCK TABLES;

--
-- Table structure for table `DLFileEntryTypes_DLFolders`
--

CREATE TABLE `DLFileEntryTypes_DLFolders` (
  `companyId` bigint(20) NOT NULL,
  `fileEntryTypeId` bigint(20) NOT NULL,
  `folderId` bigint(20) NOT NULL,
  PRIMARY KEY (`fileEntryTypeId`,`folderId`),
  KEY `IX_2E64D9F9` (`companyId`),
  KEY `IX_5BB6AD6C` (`fileEntryTypeId`),
  KEY `IX_6E00A2EC` (`folderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLFileRank`
--

CREATE TABLE `DLFileRank` (
  `fileRankId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fileRankId`),
  KEY `IX_38F0315` (`companyId`,`userId`,`fileEntryId`),
  KEY `IX_A65A1F8B` (`fileEntryId`),
  KEY `IX_4E96195B` (`groupId`,`userId`,`active_`),
  KEY `IX_EED06670` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLFileShortcut`
--

CREATE TABLE `DLFileShortcut` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileShortcutId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `toFileEntryId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`fileShortcutId`),
  UNIQUE KEY `IX_FDB4A946` (`uuid_`,`groupId`),
  KEY `IX_8571953E` (`companyId`,`status`),
  KEY `IX_17EE3098` (`groupId`,`folderId`,`active_`,`status`),
  KEY `IX_4B7247F6` (`toFileEntryId`),
  KEY `IX_29AE81C4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLFileVersion`
--

CREATE TABLE `DLFileVersion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `fileName` varchar(255) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `changeLog` varchar(75) DEFAULT NULL,
  `extraSettings` longtext,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `checksum` varchar(75) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`fileVersionId`),
  UNIQUE KEY `IX_E2815081` (`fileEntryId`,`version`),
  UNIQUE KEY `IX_C99B2650` (`uuid_`,`groupId`),
  KEY `IX_A0A283F4` (`companyId`,`status`),
  KEY `IX_D47BB14D` (`fileEntryId`,`status`),
  KEY `IX_DFD809D3` (`groupId`,`folderId`,`status`),
  KEY `IX_9BE769ED` (`groupId`,`folderId`,`title`,`version`),
  KEY `IX_FFB3395C` (`mimeType`),
  KEY `IX_95E9E44E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLFolder`
--

CREATE TABLE `DLFolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `mountPoint` tinyint(4) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `lastPostDate` datetime(6) DEFAULT NULL,
  `defaultFileEntryTypeId` bigint(20) DEFAULT NULL,
  `hidden_` tinyint(4) DEFAULT NULL,
  `restrictionType` int(11) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_902FD874` (`groupId`,`parentFolderId`,`name`),
  UNIQUE KEY `IX_3CC1DED2` (`uuid_`,`groupId`),
  KEY `IX_E79BE432` (`companyId`,`status`),
  KEY `IX_C88430AB` (`groupId`,`mountPoint`,`parentFolderId`,`hidden_`,`status`),
  KEY `IX_CE360BF6` (`groupId`,`parentFolderId`,`hidden_`,`status`),
  KEY `IX_51556082` (`parentFolderId`,`name`),
  KEY `IX_6F63F140` (`repositoryId`,`mountPoint`),
  KEY `IX_6747B2BC` (`repositoryId`,`parentFolderId`),
  KEY `IX_DA448450` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `DLSyncEvent`
--

CREATE TABLE `DLSyncEvent` (
  `syncEventId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `modifiedTime` bigint(20) DEFAULT NULL,
  `event` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`syncEventId`),
  UNIQUE KEY `IX_57D82B06` (`typePK`),
  KEY `IX_3D8E1607` (`modifiedTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `EmailAddress`
--

CREATE TABLE `EmailAddress` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `emailAddressId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `typeId` bigint(20) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`emailAddressId`),
  KEY `IX_2A2CB130` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_7B43CD8` (`userId`),
  KEY `IX_F74AB912` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ExpandoColumn`
--

CREATE TABLE `ExpandoColumn` (
  `columnId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `defaultData` longtext,
  `typeSettings` longtext,
  PRIMARY KEY (`columnId`),
  UNIQUE KEY `IX_FEFC8DA7` (`tableId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ExpandoColumn`
--

LOCK TABLES `ExpandoColumn` WRITE;
INSERT INTO `ExpandoColumn` VALUES (20167,20116,20166,'accessSecret',15,'',''),(20168,20116,20166,'accessToken',15,'',''),(20169,20116,20166,'requestSecret',15,'',''),(20170,20116,20166,'requestToken',15,'',''),(20173,20116,20172,'googleAccessToken',15,'','hidden=true\nvisible-with-update-permission=false\n'),(20174,20116,20172,'googleRefreshToken',15,'','hidden=true\nvisible-with-update-permission=false\n');
UNLOCK TABLES;

--
-- Table structure for table `ExpandoRow`
--

CREATE TABLE `ExpandoRow` (
  `rowId_` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowId_`),
  UNIQUE KEY `IX_81EFBFF5` (`tableId`,`classPK`),
  KEY `IX_49EB3118` (`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ExpandoTable`
--

CREATE TABLE `ExpandoTable` (
  `tableId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`tableId`),
  UNIQUE KEY `IX_37562284` (`companyId`,`classNameId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ExpandoTable`
--

LOCK TABLES `ExpandoTable` WRITE;
INSERT INTO `ExpandoTable` VALUES (20172,20116,20087,'CUSTOM_FIELDS'),(20166,20116,20087,'MP');
UNLOCK TABLES;

--
-- Table structure for table `ExpandoValue`
--

CREATE TABLE `ExpandoValue` (
  `valueId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `columnId` bigint(20) DEFAULT NULL,
  `rowId_` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `data_` longtext,
  PRIMARY KEY (`valueId`),
  UNIQUE KEY `IX_9DDD21E5` (`columnId`,`rowId_`),
  UNIQUE KEY `IX_D27B03E7` (`tableId`,`columnId`,`classPK`),
  KEY `IX_B29FEF17` (`classNameId`,`classPK`),
  KEY `IX_9112A7A0` (`rowId_`),
  KEY `IX_1BD3F4C` (`tableId`,`classPK`),
  KEY `IX_B71E92D5` (`tableId`,`rowId_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ExportImportConfiguration`
--

CREATE TABLE `ExportImportConfiguration` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `exportImportConfigurationId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `type_` int(11) DEFAULT NULL,
  `settings_` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`exportImportConfigurationId`),
  KEY `IX_1827A2E5` (`companyId`),
  KEY `IX_38FA468D` (`groupId`,`status`),
  KEY `IX_47CC6234` (`groupId`,`type_`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Group_`
--

CREATE TABLE `Group_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `groupId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `creatorUserId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `parentGroupId` bigint(20) DEFAULT NULL,
  `liveGroupId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `groupKey` varchar(150) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` int(11) DEFAULT NULL,
  `typeSettings` longtext,
  `manualMembership` tinyint(4) DEFAULT NULL,
  `membershipRestriction` int(11) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `site` tinyint(4) DEFAULT NULL,
  `remoteStagingGroupCount` int(11) DEFAULT NULL,
  `inheritContent` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `IX_D0D5E397` (`companyId`,`classNameId`,`classPK`),
  UNIQUE KEY `IX_A729E3A6` (`companyId`,`classNameId`,`liveGroupId`,`groupKey`),
  UNIQUE KEY `IX_5BDDB872` (`companyId`,`friendlyURL`),
  UNIQUE KEY `IX_ACD2B296` (`companyId`,`groupKey`),
  UNIQUE KEY `IX_AACD15F0` (`companyId`,`liveGroupId`,`groupKey`),
  UNIQUE KEY `IX_754FBB1C` (`uuid_`,`groupId`),
  KEY `IX_8257E37B` (`classNameId`,`classPK`),
  KEY `IX_BD3CB13A` (`classNameId`,`groupId`,`companyId`,`parentGroupId`),
  KEY `IX_DDC91A87` (`companyId`,`active_`),
  KEY `IX_ABE2D54` (`companyId`,`classNameId`,`parentGroupId`),
  KEY `IX_D4BFF38B` (`companyId`,`parentGroupId`,`site`,`inheritContent`),
  KEY `IX_63A2AABD` (`companyId`,`site`),
  KEY `IX_16218A38` (`liveGroupId`),
  KEY `IX_7B590A7A` (`type_`,`active_`),
  KEY `IX_26CC761A` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Group_`
--

LOCK TABLES `Group_` WRITE;
INSERT INTO `Group_` VALUES (0,'944a6acb-9e90-4e9e-30fd-e1fb6306e339',20133,20116,20120,20045,20133,0,0,'/20133/','Control Panel','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Control Panel</Name></root>',NULL,3,'',1,0,'/control_panel',0,0,0,1),(0,'2cfe5456-3457-cc2c-0e96-f5b87325bae1',20140,20116,20120,20045,20140,0,0,'/20140/','Forms','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Forms</Name></root>',NULL,3,'',1,0,'/forms',0,0,0,1),(2,'f5867516-caff-dd2c-bc34-821fbbcc0efd',20143,20116,20120,20045,20143,0,0,'/20143/','Guest','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Guest</Name></root>',NULL,1,'false-robots.txt=User-Agent: *_SAFE_NEWLINE_CHARACTER_Disallow:_SAFE_NEWLINE_CHARACTER_Sitemap: http://localhost/sitemap.xml\nmergeGuestPublicPages=false\n',1,0,'/guest',1,0,0,1),(0,'7954e4b7-55b2-1acc-e565-67f557bffae9',20149,20116,20120,20135,20120,0,0,'/20149/','User Personal Site','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">User Personal Site</Name></root>',NULL,3,'',1,0,'/personal_site',0,0,0,1),(0,'f01a7147-8a27-410d-6041-79432cef1677',20152,20116,20120,20041,20116,0,0,'/20152/','20116','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Global</Name></root>',NULL,0,'',1,0,'/global',1,0,0,1),(0,'34615e89-6fc9-573b-1e21-16d57f0d584b',20158,20116,20156,20087,20156,0,0,'/20158/','20156',NULL,NULL,0,'',1,0,'/test',0,0,0,1),(0,'27d56a89-8c65-3f27-6485-4a043b508ff8',31002,20116,20120,20054,31001,0,0,'/31002/','31001','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Testray Theme</Name></root>',NULL,0,'',1,0,'/template-31001',0,0,0,1),(0,'7ca525e4-18fc-0e74-86e9-49fae136f6f0',31081,20116,20120,20050,31080,0,0,'/31081/','31080','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">选择显示页面</Name><Name language-id=\"es_ES\">Seleccione una página de visualización</Name><Name language-id=\"ja_JP\">コンテンツディスプレイページ</Name><Name language-id=\"nl_NL\">Kies een weergavepagina</Name><Name language-id=\"hu_HU\">Tartalom megjelenítő olda</Name><Name language-id=\"pt_BR\">Página de Exibição de Conteúdo</Name><Name language-id=\"de_DE\">Anzeigeseite auswählen</Name><Name language-id=\"iw_IL\">בחר דף תצוגה</Name><Name language-id=\"fi_FI\">Web-sisälllön esityssivu</Name><Name language-id=\"ca_ES\">Escolliu una pàgina de presentació</Name><Name language-id=\"fr_FR\">Choisir une page d\'affichage</Name><Name language-id=\"en_US\">Content Display Page</Name></root>',NULL,0,'',1,0,'/template-31080',0,0,0,1),(0,'3869c4f1-591c-e645-763e-9f7e4ec31f08',31144,20116,20120,20050,31143,0,0,'/31144/','31143','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">Wiki</Name><Name language-id=\"es_ES\">Wiki</Name><Name language-id=\"ja_JP\">ウィキ</Name><Name language-id=\"nl_NL\">Wiki</Name><Name language-id=\"hu_HU\">Wiki</Name><Name language-id=\"pt_BR\">Wiki</Name><Name language-id=\"de_DE\">Wiki</Name><Name language-id=\"iw_IL\">ויקי</Name><Name language-id=\"fi_FI\">Wiki</Name><Name language-id=\"ca_ES\">Wiki</Name><Name language-id=\"fr_FR\">Wiki</Name><Name language-id=\"en_US\">Wiki</Name></root>',NULL,0,'',1,0,'/template-31143',0,0,0,1),(0,'3be766da-50d8-73f4-cdc4-c212af906649',31152,20116,20120,20054,31151,0,0,'/31152/','31151','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">社区网站</Name><Name language-id=\"es_ES\">Sitio de la Comunidad</Name><Name language-id=\"ja_JP\">コミュニティーサイト</Name><Name language-id=\"nl_NL\">Community website</Name><Name language-id=\"hu_HU\">Közösségi webhely</Name><Name language-id=\"pt_BR\">Site da Comunidade</Name><Name language-id=\"de_DE\">Community-Site</Name><Name language-id=\"iw_IL\">אתר קהילה</Name><Name language-id=\"fi_FI\">Yhteisösivusto</Name><Name language-id=\"ca_ES\">Lloc comunitari</Name><Name language-id=\"fr_FR\">Site de communauté</Name><Name language-id=\"en_US\">Community Site</Name></root>',NULL,0,'',1,0,'/template-31151',0,0,0,1),(0,'6c9891cd-3deb-1d5f-7b87-f9a34bb0ce04',31172,20116,20120,20050,31171,0,0,'/31172/','31171','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">博客</Name><Name language-id=\"es_ES\">Blog</Name><Name language-id=\"ja_JP\">ブログ</Name><Name language-id=\"nl_NL\">Blog</Name><Name language-id=\"hu_HU\">Blog</Name><Name language-id=\"pt_BR\">Blog</Name><Name language-id=\"de_DE\">Blog</Name><Name language-id=\"iw_IL\">בלוג</Name><Name language-id=\"fi_FI\">Blogit</Name><Name language-id=\"ca_ES\">Bloc</Name><Name language-id=\"fr_FR\">Blogue</Name><Name language-id=\"en_US\">Blog</Name></root>',NULL,0,'',1,0,'/template-31171',0,0,0,1),(0,'b985fa89-fdf2-3d90-3fcf-74e2cd360eb5',31197,20116,20120,20054,31196,0,0,'/31197/','31196','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">内网</Name><Name language-id=\"es_ES\">Sitio de intranet</Name><Name language-id=\"ja_JP\">イントラネットサイト</Name><Name language-id=\"nl_NL\">Intranet Website</Name><Name language-id=\"hu_HU\">Intranetes webhely</Name><Name language-id=\"pt_BR\">Site da Intranet</Name><Name language-id=\"de_DE\">Intranet-Site</Name><Name language-id=\"iw_IL\">אתר אינטראנט</Name><Name language-id=\"fi_FI\">Intranet sivusto</Name><Name language-id=\"ca_ES\">Lloc web tipus Intranet</Name><Name language-id=\"fr_FR\">Site intranet</Name><Name language-id=\"en_US\">Intranet Site</Name></root>',NULL,0,'',1,0,'/template-31196',0,0,0,1),(0,'8693ed8a-b876-3721-eb87-cc7364a96378',31303,20116,31301,20087,31301,0,0,'/31303/','31301',NULL,NULL,0,'',1,0,'/sir.testalot',0,0,0,1);
UNLOCK TABLES;

--
-- Table structure for table `Groups_Orgs`
--

CREATE TABLE `Groups_Orgs` (
  `companyId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `organizationId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`organizationId`),
  KEY `IX_8BFD4548` (`companyId`),
  KEY `IX_75267DCA` (`groupId`),
  KEY `IX_6BBB7682` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Groups_Roles`
--

CREATE TABLE `Groups_Roles` (
  `companyId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`roleId`),
  KEY `IX_557D8550` (`companyId`),
  KEY `IX_84471FD2` (`groupId`),
  KEY `IX_3103EF3D` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Groups_UserGroups`
--

CREATE TABLE `Groups_UserGroups` (
  `companyId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`userGroupId`),
  KEY `IX_676FC818` (`companyId`),
  KEY `IX_31FB749A` (`groupId`),
  KEY `IX_3B69160F` (`userGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `IM_MemberRequest`
--

CREATE TABLE `IM_MemberRequest` (
  `memberRequestId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `receiverUserId` bigint(20) DEFAULT NULL,
  `invitedRoleId` bigint(20) DEFAULT NULL,
  `invitedTeamId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`memberRequestId`),
  KEY `IX_4C831DF9` (`groupId`,`receiverUserId`,`status`),
  KEY `IX_B4BCD9B4` (`key_`),
  KEY `IX_B312EB0F` (`receiverUserId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Image`
--

CREATE TABLE `Image` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `imageId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `size_` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `IX_6A925A4D` (`size_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
INSERT INTO `Image` VALUES (0,20171,20116,'2017-06-03 00:42:25.102000','png',256,256,39937);
UNLOCK TABLES;

--
-- Table structure for table `JournalArticle`
--

CREATE TABLE `JournalArticle` (
  `uuid_` varchar(75) DEFAULT NULL,
  `id_` bigint(20) NOT NULL,
  `resourcePrimKey` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `articleId` varchar(75) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `title` longtext,
  `urlTitle` varchar(150) DEFAULT NULL,
  `description` longtext,
  `content` longtext,
  `DDMStructureKey` varchar(75) DEFAULT NULL,
  `DDMTemplateKey` varchar(75) DEFAULT NULL,
  `layoutUuid` varchar(75) DEFAULT NULL,
  `displayDate` datetime(6) DEFAULT NULL,
  `expirationDate` datetime(6) DEFAULT NULL,
  `reviewDate` datetime(6) DEFAULT NULL,
  `indexable` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_85C52EEC` (`groupId`,`articleId`,`version`),
  UNIQUE KEY `IX_3463D95B` (`uuid_`,`groupId`),
  KEY `IX_17806804` (`DDMStructureKey`),
  KEY `IX_75CCA4D1` (`DDMTemplateKey`),
  KEY `IX_C761B675` (`classNameId`,`DDMTemplateKey`),
  KEY `IX_323DF109` (`companyId`,`status`),
  KEY `IX_E82F322B` (`companyId`,`version`,`status`),
  KEY `IX_EA05E9E1` (`displayDate`,`status`),
  KEY `IX_D8EB0D84` (`groupId`,`DDMStructureKey`),
  KEY `IX_31B74F51` (`groupId`,`DDMTemplateKey`),
  KEY `IX_4D5CD982` (`groupId`,`articleId`,`status`),
  KEY `IX_353BD560` (`groupId`,`classNameId`,`DDMStructureKey`),
  KEY `IX_6E801BF5` (`groupId`,`classNameId`,`DDMTemplateKey`),
  KEY `IX_9CE6E0FA` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_A2534AC2` (`groupId`,`classNameId`,`layoutUuid`),
  KEY `IX_F35391E8` (`groupId`,`folderId`,`status`),
  KEY `IX_3C028C1E` (`groupId`,`layoutUuid`),
  KEY `IX_301D024B` (`groupId`,`status`),
  KEY `IX_D2D249E8` (`groupId`,`urlTitle`,`status`),
  KEY `IX_43A0F80F` (`groupId`,`userId`,`classNameId`),
  KEY `IX_3F1EA19E` (`layoutUuid`),
  KEY `IX_451D63EC` (`resourcePrimKey`,`indexable`,`status`),
  KEY `IX_3E2765FC` (`resourcePrimKey`,`status`),
  KEY `IX_EF9B7028` (`smallImageId`),
  KEY `IX_71520099` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `JournalArticleImage`
--

CREATE TABLE `JournalArticleImage` (
  `articleImageId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `elInstanceId` varchar(75) DEFAULT NULL,
  `elName` varchar(75) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  `tempImage` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`articleImageId`),
  UNIQUE KEY `IX_103D6207` (`groupId`,`articleId`,`version`,`elInstanceId`,`elName`,`languageId`),
  KEY `IX_D4121315` (`tempImage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `JournalArticleResource`
--

CREATE TABLE `JournalArticleResource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `resourcePrimKey` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`resourcePrimKey`),
  UNIQUE KEY `IX_88DF994A` (`groupId`,`articleId`),
  UNIQUE KEY `IX_84AB0309` (`uuid_`,`groupId`),
  KEY `IX_CC7576C7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `JournalContentSearch`
--

CREATE TABLE `JournalContentSearch` (
  `contentSearchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `layoutId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`contentSearchId`),
  UNIQUE KEY `IX_C3AA93B8` (`groupId`,`privateLayout`,`layoutId`,`portletId`,`articleId`),
  KEY `IX_9207CB31` (`articleId`),
  KEY `IX_6838E427` (`groupId`,`articleId`),
  KEY `IX_7CC7D73E` (`groupId`,`privateLayout`,`articleId`),
  KEY `IX_8DAF8A35` (`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `JournalFeed`
--

CREATE TABLE `JournalFeed` (
  `uuid_` varchar(75) DEFAULT NULL,
  `id_` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `feedId` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `DDMStructureKey` varchar(75) DEFAULT NULL,
  `DDMTemplateKey` varchar(75) DEFAULT NULL,
  `DDMRendererTemplateKey` varchar(75) DEFAULT NULL,
  `delta` int(11) DEFAULT NULL,
  `orderByCol` varchar(75) DEFAULT NULL,
  `orderByType` varchar(75) DEFAULT NULL,
  `targetLayoutFriendlyUrl` varchar(255) DEFAULT NULL,
  `targetPortletId` varchar(200) DEFAULT NULL,
  `contentField` varchar(75) DEFAULT NULL,
  `feedFormat` varchar(75) DEFAULT NULL,
  `feedVersion` double DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_65576CBC` (`groupId`,`feedId`),
  UNIQUE KEY `IX_39031F51` (`uuid_`,`groupId`),
  KEY `IX_CB37A10F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `JournalFolder`
--

CREATE TABLE `JournalFolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `restrictionType` int(11) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_65026705` (`groupId`,`parentFolderId`,`name`),
  UNIQUE KEY `IX_E002061` (`uuid_`,`groupId`),
  KEY `IX_C36B0443` (`companyId`,`status`),
  KEY `IX_E988689E` (`groupId`,`name`),
  KEY `IX_EFD9CAC` (`groupId`,`parentFolderId`,`status`),
  KEY `IX_54F89E1F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoAction`
--

CREATE TABLE `KaleoAction` (
  `kaleoActionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `executionType` varchar(20) DEFAULT NULL,
  `script` longtext,
  `scriptLanguage` varchar(75) DEFAULT NULL,
  `scriptRequiredContexts` longtext,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`kaleoActionId`),
  KEY `IX_50E9112C` (`companyId`),
  KEY `IX_4B2545E8` (`kaleoClassName`,`kaleoClassPK`,`executionType`),
  KEY `IX_F95A622` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `KaleoAction`
--

LOCK TABLES `KaleoAction` WRITE;
INSERT INTO `KaleoAction` VALUES (29005,0,20116,20120,NULL,'2017-06-03 00:42:35.486000','2017-06-03 00:42:35.486000','com.liferay.portal.workflow.kaleo.model.KaleoNode',29004,29003,'approved','approve',NULL,'onEntry','\n					\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus(\"approved\"), workflowContext);\n					\n				','groovy',NULL,0),(29024,0,20116,20120,NULL,'2017-06-03 00:42:35.570000','2017-06-03 00:42:35.570000','com.liferay.portal.workflow.kaleo.model.KaleoNode',29023,29003,'update','reject',NULL,'onAssignment','\n					\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus(\"denied\"), workflowContext);\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus(\"pending\"), workflowContext);\n					\n				','groovy',NULL,0);
UNLOCK TABLES;

--
-- Table structure for table `KaleoCondition`
--

CREATE TABLE `KaleoCondition` (
  `kaleoConditionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `script` longtext,
  `scriptLanguage` varchar(75) DEFAULT NULL,
  `scriptRequiredContexts` longtext,
  PRIMARY KEY (`kaleoConditionId`),
  KEY `IX_FEE46067` (`companyId`),
  KEY `IX_DC978A5D` (`kaleoDefinitionId`),
  KEY `IX_86CBD4C` (`kaleoNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoDefinition`
--

CREATE TABLE `KaleoDefinition` (
  `kaleoDefinitionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `content` longtext,
  `version` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  `startKaleoNodeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`kaleoDefinitionId`),
  KEY `IX_408542BA` (`companyId`,`active_`),
  KEY `IX_4C23F11B` (`companyId`,`name`,`active_`),
  KEY `IX_EC14F81A` (`companyId`,`name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoDraftDefinition`
--

CREATE TABLE `KaleoDraftDefinition` (
  `kaleoDraftDefinitionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `content` longtext,
  `version` int(11) DEFAULT NULL,
  `draftVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`kaleoDraftDefinitionId`),
  UNIQUE KEY `IX_A500C06` (`companyId`,`name`,`version`,`draftVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoInstance`
--

CREATE TABLE `KaleoInstance` (
  `kaleoInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoDefinitionName` varchar(200) DEFAULT NULL,
  `kaleoDefinitionVersion` int(11) DEFAULT NULL,
  `rootKaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime(6) DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoInstanceId`),
  KEY `IX_58D85ECB` (`className`,`classPK`),
  KEY `IX_BF5839F8` (`companyId`,`kaleoDefinitionName`,`kaleoDefinitionVersion`,`completionDate`),
  KEY `IX_C6D7A867` (`companyId`,`userId`),
  KEY `IX_ACF16238` (`kaleoDefinitionId`,`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoInstanceToken`
--

CREATE TABLE `KaleoInstanceToken` (
  `kaleoInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `parentKaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `currentKaleoNodeId` bigint(20) DEFAULT NULL,
  `currentKaleoNodeName` varchar(200) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`kaleoInstanceTokenId`),
  KEY `IX_360D34D9` (`companyId`,`parentKaleoInstanceTokenId`,`completionDate`),
  KEY `IX_7BDB04B4` (`kaleoDefinitionId`),
  KEY `IX_F42AAFF6` (`kaleoInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoLog`
--

CREATE TABLE `KaleoLog` (
  `kaleoLogId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `terminalKaleoNode` tinyint(4) DEFAULT NULL,
  `kaleoActionId` bigint(20) DEFAULT NULL,
  `kaleoActionName` varchar(200) DEFAULT NULL,
  `kaleoActionDescription` longtext,
  `previousKaleoNodeId` bigint(20) DEFAULT NULL,
  `previousKaleoNodeName` varchar(200) DEFAULT NULL,
  `previousAssigneeClassName` varchar(200) DEFAULT NULL,
  `previousAssigneeClassPK` bigint(20) DEFAULT NULL,
  `currentAssigneeClassName` varchar(200) DEFAULT NULL,
  `currentAssigneeClassPK` bigint(20) DEFAULT NULL,
  `type_` varchar(50) DEFAULT NULL,
  `comment_` longtext,
  `startDate` datetime(6) DEFAULT NULL,
  `endDate` datetime(6) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoLogId`),
  KEY `IX_73B5F4DE` (`companyId`),
  KEY `IX_E66A153A` (`kaleoClassName`,`kaleoClassPK`,`kaleoInstanceTokenId`,`type_`),
  KEY `IX_6C64B7D4` (`kaleoDefinitionId`),
  KEY `IX_5BC6AB16` (`kaleoInstanceId`),
  KEY `IX_470B9FF8` (`kaleoInstanceTokenId`,`type_`),
  KEY `IX_B0CDCA38` (`kaleoTaskInstanceTokenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoNode`
--

CREATE TABLE `KaleoNode` (
  `kaleoNodeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `metadata` longtext,
  `description` longtext,
  `type_` varchar(20) DEFAULT NULL,
  `initial_` tinyint(4) DEFAULT NULL,
  `terminal` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kaleoNodeId`),
  KEY `IX_F28C443E` (`companyId`,`kaleoDefinitionId`),
  KEY `IX_32E94DD6` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoNotification`
--

CREATE TABLE `KaleoNotification` (
  `kaleoNotificationId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `executionType` varchar(20) DEFAULT NULL,
  `template` longtext,
  `templateLanguage` varchar(75) DEFAULT NULL,
  `notificationTypes` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`kaleoNotificationId`),
  KEY `IX_38829497` (`companyId`),
  KEY `IX_F3362E93` (`kaleoClassName`,`kaleoClassPK`,`executionType`),
  KEY `IX_4B968E8D` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoNotificationRecipient`
--

CREATE TABLE `KaleoNotificationRecipient` (
  `kaleoNotificationRecipientId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNotificationId` bigint(20) DEFAULT NULL,
  `recipientClassName` varchar(200) DEFAULT NULL,
  `recipientClassPK` bigint(20) DEFAULT NULL,
  `recipientRoleType` int(11) DEFAULT NULL,
  `recipientScript` longtext,
  `recipientScriptLanguage` varchar(75) DEFAULT NULL,
  `recipientScriptContexts` longtext,
  `address` varchar(255) DEFAULT NULL,
  `notificationReceptionType` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`kaleoNotificationRecipientId`),
  KEY `IX_2C8C4AF4` (`companyId`),
  KEY `IX_AA6697EA` (`kaleoDefinitionId`),
  KEY `IX_7F4FED02` (`kaleoNotificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoProcess`
--

CREATE TABLE `KaleoProcess` (
  `uuid_` varchar(75) DEFAULT NULL,
  `kaleoProcessId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `DDLRecordSetId` bigint(20) DEFAULT NULL,
  `DDMTemplateId` bigint(20) DEFAULT NULL,
  `workflowDefinitionName` varchar(75) DEFAULT NULL,
  `workflowDefinitionVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`kaleoProcessId`),
  UNIQUE KEY `IX_C6B8ACEB` (`uuid_`,`groupId`),
  KEY `IX_65CA6CC9` (`DDLRecordSetId`),
  KEY `IX_A29A06D5` (`groupId`),
  KEY `IX_C1C03029` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoProcessLink`
--

CREATE TABLE `KaleoProcessLink` (
  `kaleoProcessLinkId` bigint(20) NOT NULL,
  `kaleoProcessId` bigint(20) DEFAULT NULL,
  `workflowTaskName` varchar(75) DEFAULT NULL,
  `DDMTemplateId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`kaleoProcessLinkId`),
  UNIQUE KEY `IX_10E0E9D0` (`kaleoProcessId`,`workflowTaskName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoTask`
--

CREATE TABLE `KaleoTask` (
  `kaleoTaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`kaleoTaskId`),
  KEY `IX_E1F8B23D` (`companyId`),
  KEY `IX_3FFA633` (`kaleoDefinitionId`),
  KEY `IX_77B3F1A2` (`kaleoNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoTaskAssignment`
--

CREATE TABLE `KaleoTaskAssignment` (
  `kaleoTaskAssignmentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `assigneeClassName` varchar(200) DEFAULT NULL,
  `assigneeClassPK` bigint(20) DEFAULT NULL,
  `assigneeActionId` varchar(75) DEFAULT NULL,
  `assigneeScript` longtext,
  `assigneeScriptLanguage` varchar(75) DEFAULT NULL,
  `assigneeScriptRequiredContexts` longtext,
  PRIMARY KEY (`kaleoTaskAssignmentId`),
  KEY `IX_611732B0` (`companyId`),
  KEY `IX_1087068E` (`kaleoClassName`,`kaleoClassPK`,`assigneeClassName`),
  KEY `IX_575C03A6` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoTaskAssignmentInstance`
--

CREATE TABLE `KaleoTaskAssignmentInstance` (
  `kaleoTaskAssignmentInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskId` bigint(20) DEFAULT NULL,
  `kaleoTaskName` varchar(200) DEFAULT NULL,
  `assigneeClassName` varchar(200) DEFAULT NULL,
  `assigneeClassPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`kaleoTaskAssignmentInstanceId`),
  KEY `IX_3BD436FD` (`assigneeClassName`,`assigneeClassPK`),
  KEY `IX_6E3CDA1B` (`companyId`),
  KEY `IX_38A47B17` (`groupId`,`assigneeClassPK`),
  KEY `IX_C851011` (`kaleoDefinitionId`),
  KEY `IX_67A9EE93` (`kaleoInstanceId`),
  KEY `IX_D4C2235B` (`kaleoTaskInstanceTokenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoTaskInstanceToken`
--

CREATE TABLE `KaleoTaskInstanceToken` (
  `kaleoTaskInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskId` bigint(20) DEFAULT NULL,
  `kaleoTaskName` varchar(200) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completionUserId` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime(6) DEFAULT NULL,
  `dueDate` datetime(6) DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoTaskInstanceTokenId`),
  KEY `IX_A3271995` (`className`,`classPK`),
  KEY `IX_997FE723` (`companyId`),
  KEY `IX_608E9519` (`kaleoDefinitionId`),
  KEY `IX_B857A115` (`kaleoInstanceId`,`kaleoTaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoTimer`
--

CREATE TABLE `KaleoTimer` (
  `kaleoTimerId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `blocking` tinyint(4) DEFAULT NULL,
  `description` longtext,
  `duration` double DEFAULT NULL,
  `scale` varchar(75) DEFAULT NULL,
  `recurrenceDuration` double DEFAULT NULL,
  `recurrenceScale` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`kaleoTimerId`),
  KEY `IX_1A479F32` (`kaleoClassName`,`kaleoClassPK`,`blocking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoTimerInstanceToken`
--

CREATE TABLE `KaleoTimerInstanceToken` (
  `kaleoTimerInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTimerId` bigint(20) DEFAULT NULL,
  `kaleoTimerName` varchar(200) DEFAULT NULL,
  `blocking` tinyint(4) DEFAULT NULL,
  `completionUserId` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime(6) DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoTimerInstanceTokenId`),
  KEY `IX_DB96C55B` (`kaleoInstanceId`),
  KEY `IX_9932524C` (`kaleoInstanceTokenId`,`completed`,`blocking`),
  KEY `IX_13A5BA2C` (`kaleoInstanceTokenId`,`kaleoTimerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `KaleoTransition`
--

CREATE TABLE `KaleoTransition` (
  `kaleoTransitionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `sourceKaleoNodeId` bigint(20) DEFAULT NULL,
  `sourceKaleoNodeName` varchar(200) DEFAULT NULL,
  `targetKaleoNodeId` bigint(20) DEFAULT NULL,
  `targetKaleoNodeName` varchar(200) DEFAULT NULL,
  `defaultTransition` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kaleoTransitionId`),
  KEY `IX_41D6C6D` (`companyId`),
  KEY `IX_479F3063` (`kaleoDefinitionId`),
  KEY `IX_A38E2194` (`kaleoNodeId`,`defaultTransition`),
  KEY `IX_85268A11` (`kaleoNodeId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Layout`
--

CREATE TABLE `Layout` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `plid` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `layoutId` bigint(20) DEFAULT NULL,
  `parentLayoutId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `title` longtext,
  `description` longtext,
  `keywords` longtext,
  `robots` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `typeSettings` longtext,
  `hidden_` tinyint(4) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `iconImageId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `priority` int(11) DEFAULT NULL,
  `layoutPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  `sourcePrototypeLayoutUuid` varchar(75) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`plid`),
  UNIQUE KEY `IX_BC2C4231` (`groupId`,`privateLayout`,`friendlyURL`),
  UNIQUE KEY `IX_7162C27C` (`groupId`,`privateLayout`,`layoutId`),
  UNIQUE KEY `IX_E118C537` (`uuid_`,`groupId`,`privateLayout`),
  KEY `IX_881EABCB` (`companyId`,`layoutPrototypeUuid`),
  KEY `IX_7399B71E` (`groupId`,`privateLayout`,`parentLayoutId`,`priority`),
  KEY `IX_8CE8C0D9` (`groupId`,`privateLayout`,`sourcePrototypeLayoutUuid`),
  KEY `IX_1A1B61D2` (`groupId`,`privateLayout`,`type_`),
  KEY `IX_23922F7D` (`iconImageId`),
  KEY `IX_B529BFD3` (`layoutPrototypeUuid`),
  KEY `IX_3BC009C0` (`privateLayout`,`iconImageId`),
  KEY `IX_39A18ECC` (`sourcePrototypeLayoutUuid`),
  KEY `IX_2CE4BE84` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Layout`
--

LOCK TABLES `Layout` WRITE;
INSERT INTO `Layout` VALUES (0,'ab5865f5-96b0-81c6-7014-6d8f84e1148c',20137,20133,20116,20120,NULL,'2017-06-03 00:42:24.013000','2017-06-03 00:42:24.013000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Control Panel</Name></root>',NULL,NULL,NULL,NULL,'control_panel','privateLayout=true\n',0,'/manage',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(3,'eff120d8-eb01-d9c0-a1a2-b30663af9427',20146,20143,20116,20120,NULL,'2017-06-03 00:42:24.180000','2017-06-03 00:47:05.337000',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=1_WAR_osbtestrayportlet\nlayout-template-id=1_column\n',0,'/home',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(0,'1ab2b661-3b4e-b797-3082-b663db555c18',20162,20140,20116,20120,NULL,'2017-06-03 00:42:24.771000','2017-06-03 00:42:24.771000',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Shared</Name></root>',NULL,NULL,NULL,NULL,'shared_portlet','layoutUpdateable=false\n',1,'/shared',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(1,'f1c033b3-c117-7701-63d3-20c4286de162',31013,31002,20116,20120,NULL,'2017-06-03 00:44:41.397000','2017-06-03 00:44:41.432000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>',NULL,NULL,NULL,'portlet','column-1=58,\ncolumn-2=47,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(5,'ee592602-f485-dcb7-b76b-4ca242289251',31084,31081,20116,20120,NULL,'2017-06-03 00:44:59.390000','2017-06-03 00:44:59.467000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">选择显示页面</Name><Name language-id=\"es_ES\">Seleccione una página de visualización</Name><Name language-id=\"ja_JP\">コンテンツディスプレイページ</Name><Name language-id=\"nl_NL\">Kies een weergavepagina</Name><Name language-id=\"hu_HU\">Tartalom megjelenítő olda</Name><Name language-id=\"pt_BR\">Página de Exibição de Conteúdo</Name><Name language-id=\"de_DE\">Anzeigeseite auswählen</Name><Name language-id=\"iw_IL\">בחר דף תצוגה</Name><Name language-id=\"fi_FI\">Web-sisälllön esityssivu</Name><Name language-id=\"ca_ES\">Escolliu una pàgina de presentació</Name><Name language-id=\"fr_FR\">Choisir une page d\'affichage</Name><Name language-id=\"en_US\">Content Display Page</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet_INSTANCE_OqRv4xxzym8J,com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet_INSTANCE_wUMSh3KxKp3I,\ncolumn-2=com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_ATudlnym75jV,\ndefault-asset-publisher-portlet-id=com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_ATudlnym75jV\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/layout',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(4,'849cf9da-5b21-d0d4-3a1d-144eb04cde8b',31147,31144,20116,20120,NULL,'2017-06-03 00:45:07.847000','2017-06-03 00:45:07.902000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">Wiki</Name><Name language-id=\"es_ES\">Wiki</Name><Name language-id=\"ja_JP\">ウィキ</Name><Name language-id=\"nl_NL\">Wiki</Name><Name language-id=\"hu_HU\">Wiki</Name><Name language-id=\"pt_BR\">Wiki</Name><Name language-id=\"de_DE\">Wiki</Name><Name language-id=\"iw_IL\">ויקי</Name><Name language-id=\"fi_FI\">Wiki</Name><Name language-id=\"ca_ES\">Wiki</Name><Name language-id=\"fr_FR\">Wiki</Name><Name language-id=\"en_US\">Wiki</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_wiki_web_portlet_WikiPortlet,\ncolumn-2=com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet_INSTANCE_XUbVD8LKAW0i,com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet_INSTANCE_xAL6hxkynzkh,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(5,'7bb22e84-99c7-12db-b9e6-ccf6e97d4f94',31161,31152,20116,20120,NULL,'2017-06-03 00:45:07.989000','2017-06-03 00:45:08.049000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">主页</Name><Name language-id=\"es_ES\">Inicio</Name><Name language-id=\"ja_JP\">ホーム</Name><Name language-id=\"nl_NL\">Startpagina</Name><Name language-id=\"hu_HU\">Nyitólap</Name><Name language-id=\"pt_BR\">Início</Name><Name language-id=\"de_DE\">Startseite</Name><Name language-id=\"iw_IL\">בית</Name><Name language-id=\"fi_FI\">Etusivu</Name><Name language-id=\"ca_ES\">Inici</Name><Name language-id=\"fr_FR\">Accueil</Name><Name language-id=\"en_US\">Home</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_message_boards_web_portlet_MBPortlet,\ncolumn-2=com_liferay_polls_web_portlet_PollsDisplayPortlet_INSTANCE_8tcwRY13nTc7,com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet,com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_7MVRkUKVNXQL,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/home',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(3,'2bdf9b7b-b250-3936-1ae5-6eb8c2588db6',31165,31152,20116,20120,NULL,'2017-06-03 00:45:08.058000','2017-06-03 00:45:08.098000',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">维基</Name><Name language-id=\"es_ES\">Wiki</Name><Name language-id=\"ja_JP\">ウィキ</Name><Name language-id=\"nl_NL\">Wiki</Name><Name language-id=\"hu_HU\">Wiki</Name><Name language-id=\"pt_BR\">Wiki</Name><Name language-id=\"de_DE\">Wiki</Name><Name language-id=\"iw_IL\">ויקי</Name><Name language-id=\"fi_FI\">Wiki</Name><Name language-id=\"ca_ES\">Wiki</Name><Name language-id=\"fr_FR\">Wiki</Name><Name language-id=\"en_US\">Wiki</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_wiki_web_portlet_WikiPortlet,\ncolumn-2=com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet_INSTANCE_sJ8AZzAiKqKL,com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet_INSTANCE_EmujG4kH1cnY,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/wiki',0,NULL,NULL,'',1,NULL,0,NULL,NULL),(4,'ce06ed44-8623-fde5-730e-b9364cabbfca',31175,31172,20116,20120,NULL,'2017-06-03 00:45:08.427000','2017-06-03 00:45:08.513000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">博客</Name><Name language-id=\"es_ES\">Blog</Name><Name language-id=\"ja_JP\">ブログ</Name><Name language-id=\"nl_NL\">Blog</Name><Name language-id=\"hu_HU\">Blog</Name><Name language-id=\"pt_BR\">Blog</Name><Name language-id=\"de_DE\">Blog</Name><Name language-id=\"iw_IL\">בלוג</Name><Name language-id=\"fi_FI\">Blogit</Name><Name language-id=\"ca_ES\">Bloc</Name><Name language-id=\"fr_FR\">Blogue</Name><Name language-id=\"en_US\">Blog</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_blogs_web_portlet_BlogsPortlet,\ncolumn-2=com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet_INSTANCE_fRcO6Kh0xAsr,com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(4,'2186cde1-1553-d8e6-6741-20ded4f4bf9b',31206,31197,20116,20120,NULL,'2017-06-03 00:45:10.448000','2017-06-03 00:45:10.487000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">主页</Name><Name language-id=\"es_ES\">Inicio</Name><Name language-id=\"ja_JP\">ホーム</Name><Name language-id=\"nl_NL\">Startpagina</Name><Name language-id=\"hu_HU\">Nyitólap</Name><Name language-id=\"pt_BR\">Início</Name><Name language-id=\"de_DE\">Startseite</Name><Name language-id=\"iw_IL\">בית</Name><Name language-id=\"fi_FI\">Etusivu</Name><Name language-id=\"ca_ES\">Inici</Name><Name language-id=\"fr_FR\">Accueil</Name><Name language-id=\"en_US\">Home</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_social_activities_web_portlet_SocialActivitiesPortlet,\ncolumn-2=com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet,com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_qKobDZX0fIeE,\nlayout-template-id=2_columns_i\nprivateLayout=true\n',0,'/home',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(2,'f9f7e941-2e1c-839d-993f-59efe0f29844',31210,31197,20116,20120,NULL,'2017-06-03 00:45:10.496000','2017-06-03 00:45:10.528000',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">文档和媒体</Name><Name language-id=\"es_ES\">Documentos y multimedia</Name><Name language-id=\"ja_JP\">ドキュメントとメディア</Name><Name language-id=\"nl_NL\">Documenten en Media</Name><Name language-id=\"hu_HU\">Dokumentumok és médiafájlok</Name><Name language-id=\"pt_BR\">Documentos e Mídias</Name><Name language-id=\"de_DE\">Dokumente &amp; Medien</Name><Name language-id=\"iw_IL\">Documents and Media</Name><Name language-id=\"fi_FI\">Asiakirjat ja media</Name><Name language-id=\"ca_ES\">Documents i fitxers multimèdia</Name><Name language-id=\"fr_FR\">Documents and Media</Name><Name language-id=\"en_US\">Documents and Media</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_document_library_web_portlet_DLPortlet_INSTANCE_DosAtw97wyP6,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/documents',0,NULL,NULL,'',1,NULL,0,NULL,NULL),(4,'82fa815c-20a4-bf52-b1a5-3d24656402d9',31214,31197,20116,20120,NULL,'2017-06-03 00:45:10.538000','2017-06-03 00:45:10.580000',1,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">News</Name><Name language-id=\"es_ES\">News</Name><Name language-id=\"ja_JP\">News</Name><Name language-id=\"nl_NL\">News</Name><Name language-id=\"hu_HU\">News</Name><Name language-id=\"pt_BR\">News</Name><Name language-id=\"de_DE\">News</Name><Name language-id=\"iw_IL\">News</Name><Name language-id=\"fi_FI\">News</Name><Name language-id=\"ca_ES\">News</Name><Name language-id=\"fr_FR\">News</Name><Name language-id=\"en_US\">News</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_rss_web_portlet_RSSPortlet_INSTANCE_5NoGbyyAOC0A,\ncolumn-2=com_liferay_rss_web_portlet_RSSPortlet_INSTANCE_jjW53y25JcWe,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/news',0,NULL,NULL,'',2,NULL,0,NULL,NULL),(1,'cb6618a5-cdbe-b969-1b92-1f6055377dbe',31244,20158,20116,20156,'Test Test','2017-06-03 00:46:35.798000','2017-06-03 00:46:35.815000',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>',NULL,NULL,NULL,NULL,'portlet','column-1=com_liferay_site_my_sites_web_portlet_MySitesPortlet,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/home',0,NULL,NULL,'',0,NULL,0,NULL,NULL),(1,'cf7318c2-870c-1c2c-05fd-288f369ddabe',31247,20158,20116,20156,'Test Test','2017-06-03 00:46:35.831000','2017-06-03 00:46:35.845000',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>',NULL,NULL,NULL,NULL,'portlet','layout-template-id=1_column\n',0,'/home',0,NULL,NULL,'',0,NULL,0,NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `LayoutBranch`
--

CREATE TABLE `LayoutBranch` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `layoutBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `master` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutBranchId`),
  UNIQUE KEY `IX_FD57097D` (`layoutSetBranchId`,`plid`,`name`),
  KEY `IX_A705FF94` (`layoutSetBranchId`,`plid`,`master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `LayoutFriendlyURL`
--

CREATE TABLE `LayoutFriendlyURL` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutFriendlyURLId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`layoutFriendlyURLId`),
  UNIQUE KEY `IX_A6FC2B28` (`groupId`,`privateLayout`,`friendlyURL`,`languageId`),
  UNIQUE KEY `IX_C5762E72` (`plid`,`languageId`),
  UNIQUE KEY `IX_326525D6` (`uuid_`,`groupId`),
  KEY `IX_EAB317C8` (`companyId`),
  KEY `IX_59051329` (`plid`,`friendlyURL`),
  KEY `IX_F4321A54` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LayoutFriendlyURL`
--

LOCK TABLES `LayoutFriendlyURL` WRITE;
INSERT INTO `LayoutFriendlyURL` VALUES (0,'b930d243-686d-bc22-5742-1339ee4579a9',20138,20133,20116,20120,NULL,'2017-06-03 00:42:24.056000','2017-06-03 00:42:24.056000',20137,1,'/manage','en_US',NULL),(0,'c682e74d-8dd6-4f78-3755-4bcf57c5ba17',20147,20143,20116,20120,NULL,'2017-06-03 00:42:24.212000','2017-06-03 00:42:24.212000',20146,0,'/home','en_US',NULL),(0,'fcc56b20-0a9b-0056-8641-82294f997a41',20163,20140,20116,20120,NULL,'2017-06-03 00:42:24.775000','2017-06-03 00:42:24.775000',20162,0,'/shared','en_US',NULL),(0,'235f94f7-0461-15b1-6455-b27e2af5cb44',31014,31002,20116,20120,NULL,'2017-06-03 00:44:41.404000','2017-06-03 00:44:41.404000',31013,1,'/home','en_US',NULL),(0,'51622eab-ddf0-71cb-19dc-364129d2ec1f',31085,31081,20116,20120,NULL,'2017-06-03 00:44:59.402000','2017-06-03 00:44:59.402000',31084,1,'/layout','en_US',NULL),(0,'cda2ca2a-4fef-d46d-8e7b-362c05847ed3',31148,31144,20116,20120,NULL,'2017-06-03 00:45:07.856000','2017-06-03 00:45:07.856000',31147,1,'/layout','en_US',NULL),(0,'53ef3660-ca11-1b28-573e-a14085937b5b',31162,31152,20116,20120,NULL,'2017-06-03 00:45:07.999000','2017-06-03 00:45:07.999000',31161,1,'/home','en_US',NULL),(0,'c3bd2af7-d5d9-1cae-ac86-cad61ea87e5d',31166,31152,20116,20120,NULL,'2017-06-03 00:45:08.068000','2017-06-03 00:45:08.068000',31165,1,'/wiki','en_US',NULL),(0,'275484ef-b297-2efa-a1f1-82d2bcf035bc',31176,31172,20116,20120,NULL,'2017-06-03 00:45:08.436000','2017-06-03 00:45:08.436000',31175,1,'/layout','en_US',NULL),(0,'afbda46f-aef2-df8e-099f-2c669f879f55',31207,31197,20116,20120,NULL,'2017-06-03 00:45:10.458000','2017-06-03 00:45:10.458000',31206,1,'/home','en_US',NULL),(0,'50f724ba-9392-d281-20cd-d07fb6a66bd5',31211,31197,20116,20120,NULL,'2017-06-03 00:45:10.506000','2017-06-03 00:45:10.506000',31210,1,'/documents','en_US',NULL),(0,'9cfdd32e-16c4-515d-842f-4bb57345574c',31215,31197,20116,20120,NULL,'2017-06-03 00:45:10.546000','2017-06-03 00:45:10.546000',31214,1,'/news','en_US',NULL),(0,'95ddbe0a-8e38-79b8-4101-68bc8f5f500d',31245,20158,20116,20156,'Test Test','2017-06-03 00:46:35.804000','2017-06-03 00:46:35.804000',31244,1,'/home','en_US',NULL),(0,'b3ccf235-f248-7fde-1ed3-de8b4185de11',31248,20158,20116,20156,'Test Test','2017-06-03 00:46:35.837000','2017-06-03 00:46:35.837000',31247,0,'/home','en_US',NULL);
UNLOCK TABLES;

--
-- Table structure for table `LayoutPrototype`
--

CREATE TABLE `LayoutPrototype` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutPrototypeId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `settings_` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutPrototypeId`),
  KEY `IX_557A639F` (`companyId`,`active_`),
  KEY `IX_63ED2532` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LayoutPrototype`
--

LOCK TABLES `LayoutPrototype` WRITE;
INSERT INTO `LayoutPrototype` VALUES (0,'5bec9264-8601-8954-1ee7-503fc90c7728',31080,20116,20120,NULL,'2017-06-03 00:44:59.343000','2017-06-03 00:44:59.343000','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">选择显示页面</Name><Name language-id=\"es_ES\">Seleccione una página de visualización</Name><Name language-id=\"ja_JP\">コンテンツディスプレイページ</Name><Name language-id=\"nl_NL\">Kies een weergavepagina</Name><Name language-id=\"hu_HU\">Tartalom megjelenítő olda</Name><Name language-id=\"pt_BR\">Página de Exibição de Conteúdo</Name><Name language-id=\"de_DE\">Anzeigeseite auswählen</Name><Name language-id=\"iw_IL\">בחר דף תצוגה</Name><Name language-id=\"fi_FI\">Web-sisälllön esityssivu</Name><Name language-id=\"ca_ES\">Escolliu una pàgina de presentació</Name><Name language-id=\"fr_FR\">Choisir une page d\'affichage</Name><Name language-id=\"en_US\">Content Display Page</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">在此页创建、编辑和浏览网页内容。搜索可用的内容、探索带有标签的相关内容，并浏览内容类别。</Description><Description language-id=\"es_ES\">Cree, edite y explore contenidos web de esta página. Busque contenido adicional, explore contenido relacionado con etiquetas y hojee las categorías del contenido.</Description><Description language-id=\"ja_JP\">このページからWebコンテンツの作成、編集ができます。コンテンツの検索、タグを利用した関連するコンテンツの検索と、コンテンツのカテゴリを閲覧できます</Description><Description language-id=\"nl_NL\">U kunt vanaf deze pagina webinhoud aanmaken, bewerken en ontdekken. Zoek beschikbare inhoud, ontdek gerelateerde inhoud met tag en blader door inhoudscategorieën.</Description><Description language-id=\"hu_HU\">Hozzon létre, szerkesszen és fedezzen fel webes tartalmat erről az oldalról. Keressen elérhető tartalmat, fedezze fel a kapcsolódó tartalmat címkékkel és böngésszen tartalomkategóriákat.</Description><Description language-id=\"pt_BR\">Crie, edite e explore conteúdo web a partir desta página. Pesquise conteúdo disponível, explore o conteúdo relacionado com tags e navegue as categorias de conteúdo.</Description><Description language-id=\"de_DE\">Erstellen, bearbeiten und finden von Webcontent dieser Seite. Durchsuchen Sie verfügbare Inhalte, erkunden Sie ähnliche Inhalte über Schlagwörter und durchsuchen Sie Kategorien.</Description><Description language-id=\"iw_IL\">צור, ערוך וחקור תוכן רשת מעמוד זה. חפש תוכן זמין, חקור תוכן קשור עם תגיות ודפדף בין קטגוריות התוכן.</Description><Description language-id=\"fi_FI\">Luo, muokkaa ja tutustu web-sisältöön tältä sivulta. Hae saatavilla olevaa sisältöä, tutustu aiheeseen liittyvään sisältöön tunnisteilla ja selaa sisältöluokkia.</Description><Description language-id=\"ca_ES\">Crear, editar, i explorar el contingut web des d\'aquesta pàgina. Cercar contingut disponible, explorar contingut relacionat amb les etiquetes i navegar per les categories de contingut.</Description><Description language-id=\"fr_FR\">Créer, éditer et explorer le contenu web de cette page. Rechercher un contenu disponible, explorer le contenu à l\'aide des tags et parcourir les catégories du contenu.</Description><Description language-id=\"en_US\">Create, edit, and explore web content from this page. Search available content, explore related content with tags, and browse content categories.</Description></root>',NULL,1),(0,'f03fb77b-f4a9-6625-0514-d6224863c221',31143,20116,20120,NULL,'2017-06-03 00:45:07.816000','2017-06-03 00:45:07.816000','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">Wiki</Name><Name language-id=\"es_ES\">Wiki</Name><Name language-id=\"ja_JP\">ウィキ</Name><Name language-id=\"nl_NL\">Wiki</Name><Name language-id=\"hu_HU\">Wiki</Name><Name language-id=\"pt_BR\">Wiki</Name><Name language-id=\"de_DE\">Wiki</Name><Name language-id=\"iw_IL\">ויקי</Name><Name language-id=\"fi_FI\">Wiki</Name><Name language-id=\"ca_ES\">Wiki</Name><Name language-id=\"fr_FR\">Wiki</Name><Name language-id=\"en_US\">Wiki</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">通过此页的Wiki与成员协作。通过标签搜索相关的内容，快速导航、轻松的类别。</Description><Description language-id=\"es_ES\">Colabora con los miembros a través de la wiki en esta página. Descubre el contenido relacionado a través de etiquetas y navega rápida y fácilmente por las categorías.</Description><Description language-id=\"ja_JP\">このページのウィキを通じてメンバーとコラボレーションできます。タグを利用して関連するコンテンツを見つけたり、カテゴリを使って簡単に情報をたどることができます</Description><Description language-id=\"nl_NL\">Werk samen met leden via de wiki op deze pagina. Ontdek verwante inhoud via tags en navigeer snel en eenvoudig met behulp van categorieën.</Description><Description language-id=\"hu_HU\">Működjön együtt a tagokkal az ezen az oldalon található wiki-n keresztül. Fedezzen fel kapcsolódó tartalmat címkékkel, és navigáljon gyorsan és könnyen kategóriákkal.</Description><Description language-id=\"pt_BR\">Colabore com os membros através do wiki nesta página. Descubra conteúdo relacionado através de etiquetas e navegue rápida e facilmente com as categorias.</Description><Description language-id=\"de_DE\">Arbeiten Sie mit Hilfe des Wikis dieser Seite mit anderen Mitgliedern zusammen. Entdecken Sie in Verbindung stehende Inhalte über Tags und navigieren Sie schnell und einfach mit Kategorien.</Description><Description language-id=\"iw_IL\">שתפו פעולה עם חברים באמצעות הוויקי בדף זה. גלו תוכן קשור באמצעות תגיות ונווטו מהר ובקלות בין קטגוריות.</Description><Description language-id=\"fi_FI\">Tee yhteistyötä jäsenten kanssa wikin kautta tällä sivulla. Tutustu aiheeseen liittyvään sisältöön tunnisteiden kautta ja siirry helposti ja nopeasti luokkien välillä.</Description><Description language-id=\"ca_ES\">Col·labora amb els membres a través de la wiki en aquesta pàgina. Descobreix el contingut relacionat a través d\'etiquetes i navega d\'una forma ràpida i fàcil amb les categories.</Description><Description language-id=\"fr_FR\">Collaborez avec les membres par le bias de wiki sur cette page. Découvrez le contenu lié par le biais des tags et naviguez rapidement et facilement avec les catégories.</Description><Description language-id=\"en_US\">Collaborate with members through the wiki on this page. Discover related content through tags, and navigate quickly and easily with categories.</Description></root>',NULL,1),(0,'e6d7adaa-5043-a888-d5b2-0f6a09299c46',31171,20116,20120,NULL,'2017-06-03 00:45:08.397000','2017-06-03 00:45:08.397000','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">博客</Name><Name language-id=\"es_ES\">Blog</Name><Name language-id=\"ja_JP\">ブログ</Name><Name language-id=\"nl_NL\">Blog</Name><Name language-id=\"hu_HU\">Blog</Name><Name language-id=\"pt_BR\">Blog</Name><Name language-id=\"de_DE\">Blog</Name><Name language-id=\"iw_IL\">בלוג</Name><Name language-id=\"fi_FI\">Blogit</Name><Name language-id=\"ca_ES\">Bloc</Name><Name language-id=\"fr_FR\">Blogue</Name><Name language-id=\"en_US\">Blog</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">在页面中创建，编辑并且预览博客。通便签导出主题，并也博客中的其他成员联系。</Description><Description language-id=\"es_ES\">Cree, edite y vea blogs desde esta página. Explore los temas usando etiquetas y conecte con otros miembros del blog.</Description><Description language-id=\"ja_JP\">このページからブログの作成、編集、閲覧ができます。タグを使用して記事を検索したり、ブログの他のメンバーを結びつけることができます。</Description><Description language-id=\"nl_NL\">Vanaf deze pagina kunt u blogs aanmaken, bewerken en bekijken. Ontdek onderwerpen aan de hand van tags, en verbind met andere leden die bloggen.</Description><Description language-id=\"hu_HU\">Hozz létre, szerkessz és tekints meg blogokat erről az oldalról. Fedetd fel a témákat a címkék segítségével és lépj kapcsolatba a többi blog taggal.</Description><Description language-id=\"pt_BR\">Crie, edite e visualize blogs a partir desta página. Explore tópicos utilizando tags e conecte-se a outros membros deste blog.</Description><Description language-id=\"de_DE\">Erstellen, bearbeiten und ansehen von Blogs dieser Seite. Erkunden Sie Themen mit Hilfe von Tags und verbinden Sie sich mit anderen Mitgliedern, die bloggen.</Description><Description language-id=\"iw_IL\">צור, ערוך וצפה בבלוגים מעמוד זה. חקור נושאים באמצעות תגיות והתחבר עם חברים אחרים שכותבים בלוגים.</Description><Description language-id=\"fi_FI\">Luo, muokkaa ja näytä tämän sivun blogit. Selaa aiheita käytämällä tunnisteita ja tutustu muihin tämän blogin kirjoittajiin.</Description><Description language-id=\"ca_ES\">Crear, editar i veure els blogs d\'aquesta pàgina. Explorar temes fent ús de les etiquetes i connectar-se amb altres membres d\'aquest blog.</Description><Description language-id=\"fr_FR\">Créer, éditer et visualiser les blogs de cette page. Explorer les sujets en utilisant des tags et se connecter à d\'autres membres de ce blog.</Description><Description language-id=\"en_US\">Create, edit, and view blogs from this page. Explore topics using tags, and connect with other members that blog.</Description></root>',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `LayoutRevision`
--

CREATE TABLE `LayoutRevision` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `layoutRevisionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `layoutBranchId` bigint(20) DEFAULT NULL,
  `parentLayoutRevisionId` bigint(20) DEFAULT NULL,
  `head` tinyint(4) DEFAULT NULL,
  `major` tinyint(4) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `name` longtext,
  `title` longtext,
  `description` longtext,
  `keywords` longtext,
  `robots` longtext,
  `typeSettings` longtext,
  `iconImageId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`layoutRevisionId`),
  KEY `IX_43E8286A` (`head`,`plid`),
  KEY `IX_E10AC39` (`layoutSetBranchId`,`head`,`plid`),
  KEY `IX_38C5DF14` (`layoutSetBranchId`,`layoutBranchId`,`head`,`plid`),
  KEY `IX_13984800` (`layoutSetBranchId`,`layoutBranchId`,`plid`),
  KEY `IX_4A84AF43` (`layoutSetBranchId`,`parentLayoutRevisionId`,`plid`),
  KEY `IX_70DA9ECB` (`layoutSetBranchId`,`plid`,`status`),
  KEY `IX_7FFAE700` (`layoutSetBranchId`,`status`),
  KEY `IX_8EC3D2BC` (`plid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `LayoutSet`
--

CREATE TABLE `LayoutSet` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `layoutSetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `logoId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `pageCount` int(11) DEFAULT NULL,
  `settings_` longtext,
  `layoutSetPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetId`),
  UNIQUE KEY `IX_48550691` (`groupId`,`privateLayout`),
  KEY `IX_72BBA8B7` (`layoutSetPrototypeUuid`),
  KEY `IX_1B698D9` (`privateLayout`,`logoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LayoutSet`
--

LOCK TABLES `LayoutSet` WRITE;
INSERT INTO `LayoutSet` VALUES (1,20134,20133,20116,'2017-06-03 00:42:23.873000','2017-06-03 00:42:24.093000',1,0,'classic_WAR_classictheme','01','',1,'',NULL,0),(0,20136,20133,20116,'2017-06-03 00:42:23.920000','2017-06-03 00:42:23.920000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(0,20141,20140,20116,'2017-06-03 00:42:24.141000','2017-06-03 00:42:24.141000',1,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(1,20142,20140,20116,'2017-06-03 00:42:24.142000','2017-06-03 00:42:24.779000',0,0,'classic_WAR_classictheme','01','',1,'',NULL,0),(0,20144,20143,20116,'2017-06-03 00:42:24.161000','2017-06-03 00:42:24.161000',1,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(5,20145,20143,20116,'2017-06-03 00:42:24.163000','2017-06-03 00:48:48.436000',0,20171,'osbtestray_WAR_testraytheme','01','',1,'showSiteName=true\n',NULL,0),(0,20150,20149,20116,'2017-06-03 00:42:24.286000','2017-06-03 00:42:24.286000',1,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(0,20151,20149,20116,'2017-06-03 00:42:24.287000','2017-06-03 00:42:24.287000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(0,20153,20152,20116,'2017-06-03 00:42:24.314000','2017-06-03 00:42:24.314000',1,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(0,20154,20152,20116,'2017-06-03 00:42:24.316000','2017-06-03 00:42:24.316000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(2,20159,20158,20116,'2017-06-03 00:42:24.580000','2017-06-03 00:46:35.808000',1,0,'userdashboard_WAR_userdashboardtheme','01','',1,'',NULL,0),(2,20160,20158,20116,'2017-06-03 00:42:24.582000','2017-06-03 00:46:35.840000',0,0,'userprofile_WAR_userprofiletheme','01','',1,'',NULL,0),(7,31003,31002,20116,'2017-06-03 00:44:40.924000','2017-06-03 00:44:41.432000',1,0,'classic_WAR_classictheme','01','',1,'',NULL,0),(1,31004,31002,20116,'2017-06-03 00:44:40.937000','2017-06-03 00:44:41.376000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(1,31082,31081,20116,'2017-06-03 00:44:59.372000','2017-06-03 00:44:59.406000',1,0,'classic_WAR_classictheme','01','',1,'',NULL,0),(0,31083,31081,20116,'2017-06-03 00:44:59.373000','2017-06-03 00:44:59.373000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(1,31145,31144,20116,'2017-06-03 00:45:07.836000','2017-06-03 00:45:07.860000',1,0,'classic_WAR_classictheme','01','',1,'',NULL,0),(0,31146,31144,20116,'2017-06-03 00:45:07.836000','2017-06-03 00:45:07.836000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(16,31153,31152,20116,'2017-06-03 00:45:07.931000','2017-06-03 00:45:08.098000',1,0,'classic_WAR_classictheme','01','',2,'',NULL,0),(0,31154,31152,20116,'2017-06-03 00:45:07.932000','2017-06-03 00:45:07.932000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(1,31173,31172,20116,'2017-06-03 00:45:08.415000','2017-06-03 00:45:08.439000',1,0,'classic_WAR_classictheme','01','',1,'',NULL,0),(0,31174,31172,20116,'2017-06-03 00:45:08.416000','2017-06-03 00:45:08.416000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(20,31198,31197,20116,'2017-06-03 00:45:10.382000','2017-06-03 00:45:10.580000',1,0,'classic_WAR_classictheme','01','',3,'',NULL,0),(0,31199,31197,20116,'2017-06-03 00:45:10.383000','2017-06-03 00:45:10.383000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(0,31304,31303,20116,'2017-06-03 00:49:07.183000','2017-06-03 00:49:07.183000',1,0,'classic_WAR_classictheme','01','',0,'',NULL,0),(0,31305,31303,20116,'2017-06-03 00:49:07.184000','2017-06-03 00:49:07.184000',0,0,'classic_WAR_classictheme','01','',0,'',NULL,0);
UNLOCK TABLES;

--
-- Table structure for table `LayoutSetBranch`
--

CREATE TABLE `LayoutSetBranch` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `layoutSetBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `master` tinyint(4) DEFAULT NULL,
  `logoId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `settings_` longtext,
  `layoutSetPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetBranchId`),
  UNIQUE KEY `IX_5FF18552` (`groupId`,`privateLayout`,`name`),
  KEY `IX_CCF0DA29` (`groupId`,`privateLayout`,`master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `LayoutSetPrototype`
--

CREATE TABLE `LayoutSetPrototype` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `settings_` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetPrototypeId`),
  KEY `IX_9178FC71` (`companyId`,`active_`),
  KEY `IX_D9FFCA84` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LayoutSetPrototype`
--

LOCK TABLES `LayoutSetPrototype` WRITE;
INSERT INTO `LayoutSetPrototype` VALUES (9,'06eac0c4-cc81-9f19-9c4e-6c7f72c5777f',31001,20116,20120,NULL,'2017-06-03 00:44:40.848000','2017-06-03 00:44:41.432000','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Testray Theme</Name></root>',NULL,'layoutsUpdateable=true\n',1),(17,'3709de20-4262-6226-0724-cb0d1046f597',31151,20116,20120,NULL,'2017-06-03 00:45:07.914000','2017-06-03 00:45:08.098000','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">社区网站</Name><Name language-id=\"es_ES\">Sitio de la Comunidad</Name><Name language-id=\"ja_JP\">コミュニティーサイト</Name><Name language-id=\"nl_NL\">Community website</Name><Name language-id=\"hu_HU\">Közösségi webhely</Name><Name language-id=\"pt_BR\">Site da Comunidade</Name><Name language-id=\"de_DE\">Community-Site</Name><Name language-id=\"iw_IL\">אתר קהילה</Name><Name language-id=\"fi_FI\">Yhteisösivusto</Name><Name language-id=\"ca_ES\">Lloc comunitari</Name><Name language-id=\"fr_FR\">Site de communauté</Name><Name language-id=\"en_US\">Community Site</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">有论坛和Wiki的站点</Description><Description language-id=\"es_ES\">Sitio con foro y wiki</Description><Description language-id=\"ja_JP\">ウィキとフォーラムのサイト</Description><Description language-id=\"nl_NL\">Site met forum en wiki</Description><Description language-id=\"hu_HU\">Webhely Fórumokkal és Wikivel</Description><Description language-id=\"pt_BR\">Site com Fóruns e Wiki</Description><Description language-id=\"de_DE\">Site mit Forum und Wiki</Description><Description language-id=\"iw_IL\">אתר עם פורומים עם וויקים</Description><Description language-id=\"fi_FI\">Sivusto foorumeilla ja wikillä</Description><Description language-id=\"ca_ES\">Llocs amb fòrums i Wiki</Description><Description language-id=\"fr_FR\">Site avec forums et wiki</Description><Description language-id=\"en_US\">Site with Forums and Wiki</Description></root>','layoutsUpdateable=true\n',1),(21,'23b843d5-36c0-a88a-8abc-6a55cf9d11c0',31196,20116,20120,NULL,'2017-06-03 00:45:10.358000','2017-06-03 00:45:10.580000','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Name language-id=\"zh_CN\">内网</Name><Name language-id=\"es_ES\">Sitio de intranet</Name><Name language-id=\"ja_JP\">イントラネットサイト</Name><Name language-id=\"nl_NL\">Intranet Website</Name><Name language-id=\"hu_HU\">Intranetes webhely</Name><Name language-id=\"pt_BR\">Site da Intranet</Name><Name language-id=\"de_DE\">Intranet-Site</Name><Name language-id=\"iw_IL\">אתר אינטראנט</Name><Name language-id=\"fi_FI\">Intranet sivusto</Name><Name language-id=\"ca_ES\">Lloc web tipus Intranet</Name><Name language-id=\"fr_FR\">Site intranet</Name><Name language-id=\"en_US\">Intranet Site</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Description language-id=\"zh_CN\">有内容和新闻的网站</Description><Description language-id=\"es_ES\">Sitio con documentos y noticias</Description><Description language-id=\"ja_JP\">ドキュメントとニュースのサイト</Description><Description language-id=\"nl_NL\">Site met documenten en nieuws</Description><Description language-id=\"hu_HU\">Webhely dokumentumokkal és hírekkel</Description><Description language-id=\"pt_BR\">Site com Documentos e Notícias</Description><Description language-id=\"de_DE\">Site mit Dokumenten und Nachrichten</Description><Description language-id=\"iw_IL\">אתר עם מסמכים וחדשות</Description><Description language-id=\"fi_FI\">Asiakirjoja ja uutisia sisältävä sivusto</Description><Description language-id=\"ca_ES\">Lloc amb documents i notícies</Description><Description language-id=\"fr_FR\">Site avec documents et actualités</Description><Description language-id=\"en_US\">Site with Documents and News</Description></root>','layoutsUpdateable=true\n',1);
UNLOCK TABLES;

--
-- Table structure for table `ListType`
--

CREATE TABLE `ListType` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `listTypeId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`listTypeId`),
  KEY `IX_77729718` (`name`,`type_`),
  KEY `IX_2932DD37` (`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ListType`
--

LOCK TABLES `ListType` WRITE;
INSERT INTO `ListType` VALUES (0,1,NULL,'com.liferay.portal.kernel.model.Contact.prefix'),(0,2,NULL,'com.liferay.portal.kernel.model.Contact.suffix'),(0,10000,'billing','com.liferay.portal.kernel.model.Account.address'),(0,10001,'other','com.liferay.portal.kernel.model.Account.address'),(0,10002,'p-o-box','com.liferay.portal.kernel.model.Account.address'),(0,10003,'shipping','com.liferay.portal.kernel.model.Account.address'),(0,10004,'email-address','com.liferay.portal.kernel.model.Account.emailAddress'),(0,10005,'email-address-2','com.liferay.portal.kernel.model.Account.emailAddress'),(0,10006,'email-address-3','com.liferay.portal.kernel.model.Account.emailAddress'),(0,10007,'fax','com.liferay.portal.kernel.model.Account.phone'),(0,10008,'local','com.liferay.portal.kernel.model.Account.phone'),(0,10009,'other','com.liferay.portal.kernel.model.Account.phone'),(0,10010,'toll-free','com.liferay.portal.kernel.model.Account.phone'),(0,10011,'tty','com.liferay.portal.kernel.model.Account.phone'),(0,10012,'intranet','com.liferay.portal.kernel.model.Account.website'),(0,10013,'public','com.liferay.portal.kernel.model.Account.website'),(0,11000,'business','com.liferay.portal.kernel.model.Contact.address'),(0,11001,'other','com.liferay.portal.kernel.model.Contact.address'),(0,11002,'personal','com.liferay.portal.kernel.model.Contact.address'),(0,11003,'email-address','com.liferay.portal.kernel.model.Contact.emailAddress'),(0,11004,'email-address-2','com.liferay.portal.kernel.model.Contact.emailAddress'),(0,11005,'email-address-3','com.liferay.portal.kernel.model.Contact.emailAddress'),(0,11006,'business','com.liferay.portal.kernel.model.Contact.phone'),(0,11007,'business-fax','com.liferay.portal.kernel.model.Contact.phone'),(0,11008,'mobile-phone','com.liferay.portal.kernel.model.Contact.phone'),(0,11009,'other','com.liferay.portal.kernel.model.Contact.phone'),(0,11010,'pager','com.liferay.portal.kernel.model.Contact.phone'),(0,11011,'personal','com.liferay.portal.kernel.model.Contact.phone'),(0,11012,'personal-fax','com.liferay.portal.kernel.model.Contact.phone'),(0,11013,'tty','com.liferay.portal.kernel.model.Contact.phone'),(0,11014,'dr','com.liferay.portal.kernel.model.Contact.prefix'),(0,11015,'mr','com.liferay.portal.kernel.model.Contact.prefix'),(0,11016,'mrs','com.liferay.portal.kernel.model.Contact.prefix'),(0,11017,'ms','com.liferay.portal.kernel.model.Contact.prefix'),(0,11020,'ii','com.liferay.portal.kernel.model.Contact.suffix'),(0,11021,'iii','com.liferay.portal.kernel.model.Contact.suffix'),(0,11022,'iv','com.liferay.portal.kernel.model.Contact.suffix'),(0,11023,'jr','com.liferay.portal.kernel.model.Contact.suffix'),(0,11024,'phd','com.liferay.portal.kernel.model.Contact.suffix'),(0,11025,'sr','com.liferay.portal.kernel.model.Contact.suffix'),(0,11026,'blog','com.liferay.portal.kernel.model.Contact.website'),(0,11027,'business','com.liferay.portal.kernel.model.Contact.website'),(0,11028,'other','com.liferay.portal.kernel.model.Contact.website'),(0,11029,'personal','com.liferay.portal.kernel.model.Contact.website'),(0,12000,'billing','com.liferay.portal.kernel.model.Organization.address'),(0,12001,'other','com.liferay.portal.kernel.model.Organization.address'),(0,12002,'p-o-box','com.liferay.portal.kernel.model.Organization.address'),(0,12003,'shipping','com.liferay.portal.kernel.model.Organization.address'),(0,12004,'email-address','com.liferay.portal.kernel.model.Organization.emailAddress'),(0,12005,'email-address-2','com.liferay.portal.kernel.model.Organization.emailAddress'),(0,12006,'email-address-3','com.liferay.portal.kernel.model.Organization.emailAddress'),(0,12007,'fax','com.liferay.portal.kernel.model.Organization.phone'),(0,12008,'local','com.liferay.portal.kernel.model.Organization.phone'),(0,12009,'other','com.liferay.portal.kernel.model.Organization.phone'),(0,12010,'toll-free','com.liferay.portal.kernel.model.Organization.phone'),(0,12011,'tty','com.liferay.portal.kernel.model.Organization.phone'),(0,12012,'administrative','com.liferay.portal.kernel.model.Organization.service'),(0,12013,'contracts','com.liferay.portal.kernel.model.Organization.service'),(0,12014,'donation','com.liferay.portal.kernel.model.Organization.service'),(0,12015,'retail','com.liferay.portal.kernel.model.Organization.service'),(0,12016,'training','com.liferay.portal.kernel.model.Organization.service'),(0,12017,'full-member','com.liferay.portal.kernel.model.Organization.status'),(0,12018,'provisional-member','com.liferay.portal.kernel.model.Organization.status'),(0,12019,'intranet','com.liferay.portal.kernel.model.Organization.website'),(0,12020,'public','com.liferay.portal.kernel.model.Organization.website');
UNLOCK TABLES;

--
-- Table structure for table `Lock_`
--

CREATE TABLE `Lock_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `lockId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `className` varchar(75) DEFAULT NULL,
  `key_` varchar(200) DEFAULT NULL,
  `owner` varchar(1024) DEFAULT NULL,
  `inheritable` tinyint(4) DEFAULT NULL,
  `expirationDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`lockId`),
  UNIQUE KEY `IX_228562AD` (`className`,`key_`),
  KEY `IX_E3F1286B` (`expirationDate`),
  KEY `IX_2C418EAE` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBBan`
--

CREATE TABLE `MBBan` (
  `uuid_` varchar(75) DEFAULT NULL,
  `banId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `banUserId` bigint(20) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`banId`),
  UNIQUE KEY `IX_8ABC4E3B` (`groupId`,`banUserId`),
  UNIQUE KEY `IX_2A3B68F6` (`uuid_`,`groupId`),
  KEY `IX_69951A25` (`banUserId`),
  KEY `IX_48814BBA` (`userId`),
  KEY `IX_4F841574` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBCategory`
--

CREATE TABLE `MBCategory` (
  `uuid_` varchar(75) DEFAULT NULL,
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `displayStyle` varchar(75) DEFAULT NULL,
  `threadCount` int(11) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime(6) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `IX_F7D28C2F` (`uuid_`,`groupId`),
  KEY `IX_D1642361` (`categoryId`,`groupId`,`parentCategoryId`,`status`),
  KEY `IX_E15A5DB5` (`companyId`,`status`),
  KEY `IX_C295DBEE` (`groupId`,`parentCategoryId`,`status`),
  KEY `IX_DA84A9F7` (`groupId`,`status`),
  KEY `IX_13DF4E6D` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBDiscussion`
--

CREATE TABLE `MBDiscussion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `discussionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`discussionId`),
  UNIQUE KEY `IX_33A4DE38` (`classNameId`,`classPK`),
  UNIQUE KEY `IX_B5CA2DC` (`threadId`),
  UNIQUE KEY `IX_F7AAC799` (`uuid_`,`groupId`),
  KEY `IX_7E965757` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBMailingList`
--

CREATE TABLE `MBMailingList` (
  `uuid_` varchar(75) DEFAULT NULL,
  `mailingListId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `inProtocol` varchar(75) DEFAULT NULL,
  `inServerName` varchar(75) DEFAULT NULL,
  `inServerPort` int(11) DEFAULT NULL,
  `inUseSSL` tinyint(4) DEFAULT NULL,
  `inUserName` varchar(75) DEFAULT NULL,
  `inPassword` varchar(75) DEFAULT NULL,
  `inReadInterval` int(11) DEFAULT NULL,
  `outEmailAddress` varchar(75) DEFAULT NULL,
  `outCustom` tinyint(4) DEFAULT NULL,
  `outServerName` varchar(75) DEFAULT NULL,
  `outServerPort` int(11) DEFAULT NULL,
  `outUseSSL` tinyint(4) DEFAULT NULL,
  `outUserName` varchar(75) DEFAULT NULL,
  `outPassword` varchar(75) DEFAULT NULL,
  `allowAnonymous` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`mailingListId`),
  UNIQUE KEY `IX_76CE9CDD` (`groupId`,`categoryId`),
  UNIQUE KEY `IX_E858F170` (`uuid_`,`groupId`),
  KEY `IX_BFEB984F` (`active_`),
  KEY `IX_FC61676E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBMessage`
--

CREATE TABLE `MBMessage` (
  `uuid_` varchar(75) DEFAULT NULL,
  `messageId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  `rootMessageId` bigint(20) DEFAULT NULL,
  `parentMessageId` bigint(20) DEFAULT NULL,
  `subject` varchar(75) DEFAULT NULL,
  `body` longtext,
  `format` varchar(75) DEFAULT NULL,
  `anonymous` tinyint(4) DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `allowPingbacks` tinyint(4) DEFAULT NULL,
  `answer` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  UNIQUE KEY `IX_8D12316E` (`uuid_`,`groupId`),
  KEY `IX_F6687633` (`classNameId`,`classPK`,`status`),
  KEY `IX_1AD93C16` (`companyId`,`status`),
  KEY `IX_4257DB85` (`groupId`,`categoryId`,`status`),
  KEY `IX_CBFDBF0A` (`groupId`,`categoryId`,`threadId`,`answer`),
  KEY `IX_385E123E` (`groupId`,`categoryId`,`threadId`,`status`),
  KEY `IX_ED39AC98` (`groupId`,`status`),
  KEY `IX_377858D2` (`groupId`,`userId`,`status`),
  KEY `IX_9D7C3B23` (`threadId`,`answer`),
  KEY `IX_A7038CD7` (`threadId`,`parentMessageId`),
  KEY `IX_9DC8E57` (`threadId`,`status`),
  KEY `IX_4A4BB4ED` (`userId`,`classNameId`,`classPK`,`status`),
  KEY `IX_3321F142` (`userId`,`classNameId`,`status`),
  KEY `IX_57CA9FEC` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBStatsUser`
--

CREATE TABLE `MBStatsUser` (
  `statsUserId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`statsUserId`),
  UNIQUE KEY `IX_9168E2C9` (`groupId`,`userId`),
  KEY `IX_847F92B5` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBThread`
--

CREATE TABLE `MBThread` (
  `uuid_` varchar(75) DEFAULT NULL,
  `threadId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `rootMessageId` bigint(20) DEFAULT NULL,
  `rootMessageUserId` bigint(20) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  `lastPostByUserId` bigint(20) DEFAULT NULL,
  `lastPostDate` datetime(6) DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `question` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`threadId`),
  UNIQUE KEY `IX_3A200B7B` (`uuid_`,`groupId`),
  KEY `IX_41F6DC8A` (`categoryId`,`priority`),
  KEY `IX_50F1904A` (`groupId`,`categoryId`,`lastPostDate`),
  KEY `IX_485F7E98` (`groupId`,`categoryId`,`status`),
  KEY `IX_E1E7142B` (`groupId`,`status`),
  KEY `IX_AEDD9CB5` (`lastPostDate`,`priority`),
  KEY `IX_CC993ECB` (`rootMessageId`),
  KEY `IX_F8CA2AB9` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MBThreadFlag`
--

CREATE TABLE `MBThreadFlag` (
  `uuid_` varchar(75) DEFAULT NULL,
  `threadFlagId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`threadFlagId`),
  UNIQUE KEY `IX_33781904` (`userId`,`threadId`),
  UNIQUE KEY `IX_FEB0FC87` (`uuid_`,`groupId`),
  KEY `IX_8CB0A24A` (`threadId`),
  KEY `IX_DCE308C5` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MDRAction`
--

CREATE TABLE `MDRAction` (
  `uuid_` varchar(75) DEFAULT NULL,
  `actionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `ruleGroupInstanceId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(255) DEFAULT NULL,
  `typeSettings` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`actionId`),
  UNIQUE KEY `IX_75BE36AD` (`uuid_`,`groupId`),
  KEY `IX_FD90786C` (`ruleGroupInstanceId`),
  KEY `IX_C58A516B` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MDRRule`
--

CREATE TABLE `MDRRule` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `ruleGroupId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(255) DEFAULT NULL,
  `typeSettings` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ruleId`),
  UNIQUE KEY `IX_F3EFDCB3` (`uuid_`,`groupId`),
  KEY `IX_4F4293F1` (`ruleGroupId`),
  KEY `IX_7DEA8DF1` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MDRRuleGroup`
--

CREATE TABLE `MDRRuleGroup` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleGroupId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ruleGroupId`),
  UNIQUE KEY `IX_46665CC4` (`uuid_`,`groupId`),
  KEY `IX_5849891C` (`groupId`),
  KEY `IX_CC14DC2` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MDRRuleGroupInstance`
--

CREATE TABLE `MDRRuleGroupInstance` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleGroupInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `ruleGroupId` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ruleGroupInstanceId`),
  UNIQUE KEY `IX_808A0036` (`classNameId`,`classPK`,`ruleGroupId`),
  UNIQUE KEY `IX_9CBC6A39` (`uuid_`,`groupId`),
  KEY `IX_22DAB85C` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_BF3E642B` (`ruleGroupId`),
  KEY `IX_25C9D1F7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Marketplace_App`
--

CREATE TABLE `Marketplace_App` (
  `uuid_` varchar(75) DEFAULT NULL,
  `appId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `remoteAppId` bigint(20) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `description` longtext,
  `category` varchar(75) DEFAULT NULL,
  `iconURL` longtext,
  `version` varchar(75) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`appId`),
  KEY `IX_94A7EF25` (`category`),
  KEY `IX_865B7BD5` (`companyId`),
  KEY `IX_20F14D93` (`remoteAppId`),
  KEY `IX_A7807DA7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Marketplace_App`
--

LOCK TABLES `Marketplace_App` WRITE;
INSERT INTO `Marketplace_App` VALUES ('d8559937-4abe-9283-c1aa-ea3394c54592',29504,20116,0,NULL,'2017-06-03 00:44:28.907000','2017-06-03 00:44:28.907000',74593955,'Liferay Foundation','Apps and Features: System Settings, Web Content Editors, Web Content Template Languages, Theme Tools, Mobile Device Rules, Facebook Authentication, LDAP Authentication, NTLM Authentication, OpenID Authentication, OpenSSO Authentication, Remote Authentication (AuthVerifiers), SSO-based Authentication, Token-based Authentication, Portal Scripting, Elasticsearch Support, Solr Support, Documents and Media Store Implementations, and more.The Foundation suite provides applications and features that extend the functionality provided by Liferay\'s core. Much of the functionality that belonged to Liferay\'s core prior to Liferay 7 has been extracted into the modules of the Foundation suite. The authentication modules provide a variety of mechanisms for allowing users and remote applications to authenticate to Liferay. The LDAP Authentication module allows administrators to establish connections to one or more LDAP directories from which users can be imported or exported. The SSO modules allow users to authenticate to Liferay using a variety of single-sign on solutions. The Token-based Authentication module allows users or remote applications to authenticate to Liferay without a password. The Scripting modules allow scripts to be written to invoke Liferay\'s API in several languages including Groovy, Beanshell, Python, Ruby, and JavaScript.','Utility','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/89509922','7.0.17',1),('78e77b87-817c-372b-e074-126b1764ee5f',29704,20116,0,NULL,'2017-06-03 00:44:29.594000','2017-06-03 00:44:29.594000',74593617,'Liferay Collaboration','The Liferay Collaboration suite provides applications and features that help users share ideas, implement them, and produce terrific results. Its apps such as Message Boards and Blogs help users start discussions, ask questions, share ideas, and connect with other users. Wiki allows users to share in-depth information. And Alerts and Announcements facilitate broadcasting information and notifications.As users collaborate, they\'re sure to produce important files. The suite\'s Documents and Media Library allows users to store files, share them, and publish them. It not only works with Liferay\'s built-in repository but also allows you to integrate with external repositories, such CMIS repositories. Users can add and share all kinds of files, including documents, presentations, images, and videos. And the suite\'s Documents and Media app and Media Gallery help users display files the way they like them.As users engage in site activities, you\'ll want to recognize them and connect them with other users. The suite\'s social networking apps and features enable you to attribute social equity to active users automatically by increasing their rank on the site. You can even highlight user activities to show your site\'s liveliness. The Mentions feature facilitates notifying specific users in the context of site content, discussions, and comments. The social apps also help users share their thoughts on the your sites and other social sites, such as Facebook and Twitter. Combined with the suite\'s collaboration and document management features, the Collaboration suiteâs social features help develop awesome communities, foster high morale, and make work interesting.Apps and Features: Activities, Alerts, Announcements, Blogs, Bookmarks, Comments, Friends/My Sites/Portal/Site Members Directory, Documents and Media, Friend Requests, Image Uploader, Invite Members, Media Gallery, Message Boards, Mentions, Microblogs, Page Flags/Comments/Ratings, Quick Note, Requests, Social Activity, User/Group Statistics, Wiki.This suite may contain modules that depend on Foundation suite modules.','Communication','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/89509459','7.0.15',1),('dd46c777-5252-de3a-73f4-cde1fa085666',29785,20116,0,NULL,'2017-06-03 00:44:29.572000','2017-06-03 00:44:29.572000',25019275,'Liferay Marketplace','Liferay Marketplace is an integral part of the Liferay platform experience for all users. Enterprise subscribers also have exclusive access to Liferay Subscription Apps through the Liferay Marketplace. Log in with your Liferay account to browse hundreds of apps to help you build your business or technical solution.','Utility','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/77124985','7',1),('17be6824-a609-1cb4-e572-544361e56fba',29791,20116,0,NULL,'2017-06-03 00:44:29.837000','2017-06-03 00:44:29.837000',15100579,'Liferay IP Geocoder','This IP Geocoder app locates your geological position, often in conjunction with other apps, such as the Google Maps app. This app utilizes Max Mind\'s GeoIP City Database. IP geolocation can be performed by associating a geographic location with the Internet Protocol (IP) address of the user with a physical address. Geolocation usually works by automatically looking up an IP address on a WHOIS service and retrieving the registrant\'s physical address. This app will appear in your Application menu once installed.','Utility','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/75992210','3.0.0',0),('7d712bed-6522-d7f9-073c-6b6769bdcff7',29796,20116,0,NULL,'2017-06-03 00:44:28.877000','2017-06-03 00:44:28.877000',45261909,'Liferay OAuth Provider','The OAuth app authorizes third-party applications to interact with a Liferay user\'s applications. OAuth is a \"handshake mechanism\" that redirects Liferay users to a service provider, where they can tell the service provider to allow a plugin limited access to their Liferay accounts. This keeps the plugin from storing any of the user\'s credentials, avoiding security risks. The OAuth app provides two portlets that allow for registering a plugin for OAuth and authorizing OAuth users, respectively. Once the plugin is registered for OAuth and accessed, the user is redirected to the service provider to delegate user authentication.This app will appear in your Control Panel and My Account menu.','Security','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/77134116','3.0.0',0),('78531772-8282-86f2-6a86-f51b38e48b39',29800,20116,0,NULL,'2017-06-03 00:44:27.825000','2017-06-03 00:44:27.825000',74860500,'Liferay Static','The Static app contains an important group of extenders and utilities that Liferay statically installs before installing any dynamic OSGi modules. The app\'s functionality includes a log4j extender, an OSGi WAB extender, configuration utilities, OSGi deployment utilities, target platform indexing, and more.','Utility','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/89512423','7.0.18',1),('932d35a0-b291-2efb-c6c9-03779d0ff6b9',29837,20116,0,NULL,'2017-06-03 00:44:29.854000','2017-06-03 00:44:29.854000',71774947,'Liferay Connected Services Client','The Liferay Connected Services app connects your Liferay instance to Liferay Connected Services (LCS). LCS is an online service that offers fix pack management, server metrics, Liferay subscription management, and more. LCS provides single-click download and install of fix packs, even across a cluster. The server metrics service provides information on how your Liferay instance is running. This includes data on pages, portlets, memory usage, JVM performance, and more. Note that the fix pack and subscription management features require an active Liferay subscription.In order to offer the best service possible, we store the following information about your servers on the LCS servers: patches installed on each server, portal.properties (except sensitive data), JVM metrics, portal and portlet metrics, cache and server metrics. Sensitive data is defined as any key-value pair containing usernames or passwords.This app will appear in your Control Panel once installed.','Utility','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/80559645','3.0.0',0),('2518e046-c572-27db-f321-ab475731adc0',29839,20116,0,NULL,'2017-06-03 00:44:28.894000','2017-06-03 00:44:28.894000',15188537,'Liferay Sharepoint Connector','The SharePoint Connector app lets users interact with files in SharePoint libraries from within a Liferay Documents and Media library. This app makes available in the Documents and Media Library a SharePoint repository type for mounting SharePoint libraries. Within such a repository, users can view, add, modify, and move files and folders. The app propagates actions performed in the SharePoint library to the SharePoint repository in the Liferay Documents and Media Library, and vice versa.Here are some of the app\'s capabilities:* Reading/writing documents and folders* Document check-in, check-out, and undo check-out* Downloading documents* Moving folders and documents within the repository* Getting revision history* Reverting to a revisionThe current version of the app requires Liferay DXP Digital Enterprise 7.0+ and works with both SharePoint 2013 and SharePoint 2010.Connect your Liferay Digital Experience Platform with your SharePoint libraries today!The current version of this app depends on modules in the Liferay Collaboration App Suite and the Liferay Foundation App Suite.','Utility','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/77084635','3.0.3',0),('e6d74830-f9ce-6469-4525-8d7a9fa84810',29841,20116,0,NULL,'2017-06-03 00:44:29.547000','2017-06-03 00:44:29.547000',31709100,'Liferay Sync Connector','The Sync Connector app lets users connect to their portals from the Liferay Sync desktop and mobile clients. It also lets administrators control how these clients interact with their portal. Once installed, the Sync Connector app provides the portal services required by the clients. No additional portal configuration is required. However, portal administrators can use the Sync Admin portlet installed with this app to control what sites are available for Sync. They can also use this portlet to disable Sync across the portal.After installing, the Sync Admin portlet is available in the Control Panelâs Configuration section.Please visit http://www.liferay.com/products/liferay-sync/features for more information on downloading the Liferay Sync desktop and mobile clients. Liferay Sync is compatible with Windows, Mac OS, iOS, and Android. The Sync Connector app requires version 3.0+ of the Sync desktop or mobile client.','Productivity','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/77134064','4.0.1',0),('a9b1b5c3-3adc-77e6-3ba8-7b3a5e48810c',29847,20116,0,NULL,'2017-06-03 00:44:28.672000','2017-06-03 00:44:28.672000',74593865,'Liferay Forms and Workflow','Apps and Features: Calendar, Dynamic Data Lists, Dynamic Data Mapping, Forms, Polls, WorkflowAn increase in productivity means you\'re saving time and effort; youâre becoming more efficient. The Forms and Workflow apps help you do that by giving you built-in calendars and the ability to create your own forms and list applications. These are powerful, flexible apps that can be quickly leveraged for basic tasks, or carefully configured and mastered to perfect business processes.Need a quick survey or complex Sign Up form? Use the Liferay Forms app and make any forms you want. If there\'s a forms feature you need, this app probably has it.Maybe you need an entire list application, and you need it today. Dynamic Data Lists lets you do it without any developer expertise.Do you need personal calendars for your users, and/or site calendars? Do you need the calendar to be highly configurable? Use the Calendar app.Would you like to initiate a review process when new content, or any new asset, is created? The Kaleo Workflow Engine lets you send any asset through review before it gets published.Want to quickly get the opinion of your users on something? The Polls app is extremely easy to use. This suite may contain modules that depend on Foundation suite modules.','Productivity','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/89509743','7.0.15',1),('5d24131d-c566-31cc-c615-ff145e32cb81',29907,20116,0,NULL,'2017-06-03 00:44:28.237000','2017-06-03 00:44:28.237000',74594163,'Liferay Web Experience','Apps and Features: Application Display Templates, Asset Publisher, Breadcrumb, Categories, Google Analytics, IFrame, Language, Navigation, Recycle Bin, Related Content, RSS, Search, Site and Page Templates, Sitemap, Sites Directory, Tags, Web Content, XSL ContentThe Web Experience suite provides features that help create, manage, and track content. The Web Content app lets you express your ideas and plans by creating dynamic content that can be structured to fit a specific design. You can also use templates to design web content for an appealing look and feel. Templates can be used in other realms of Liferay besides web content too. Site and Page Templates let you reproduce sites and pages that have been organized to address specific needs. Application Display Templates are another type of Liferay template that lets you develop the look and feel of applications. The IFrame and XSL Content apps let you create other forms of content by embedding HTML and XSL content on a site page.As administrators create content, organization is critical to keeping things tidy in your site. The suite\'s Tags and Categories apps lets you organize your web content to follow an organizational hierarchy. These organizational apps also aid with Liferay\'s Search app, which you can utilize to dynamically search content you\'ve created. The suite\'s Navigation, Breadcrumb, Sitemap, and Sites Directory apps aid in Liferay\'s organizational structure, providing a top level view of sites and their pages that have been created. To promote content in an organized way, the Asset Publisher and Related Assets apps broadcast assets and their related information. Inevitably, some content you create becomes stale and requires removal; the Recycle Bin app lets you delete content, with the option to restore that content.As a site accumulates content, administrators should have a way to easily track their content. The Google Analytics app allows the use of Google\'s tool set for analyzing site traffic data. The suite\'s RSS app provides a web feed used to publish updated works such as blog entries and news articles. The suite\'s Language app provides a way to change Liferay\'s language to cater to your site\'s international audience. This suite\'s content creation and organization focus lets site administrators develop dynamic content, organize content for easy managing, and track content for ideas to better improve the content creation process in the future.This suite may contain modules that depend on Foundation suite modules.','Productivity','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/89512535','7.0.17',1),('a30cff59-e72c-ba71-7d9a-33300c90b725',30023,20116,0,NULL,'2017-06-03 00:44:28.664000','2017-06-03 00:44:28.664000',15098914,'Liferay Documentum Connector','You can use this hook to integrate Liferay and its Documents and Media functionality with Documentum. Before configuring Documentum, you must install this app. To use this hook, set dl.hook.impl=liferay.documentum.hook.DocumentumHook. If you are using Documentum, there are additional settings that must be configured in the ${liferay_home}/documentum-hook/docroot/WEB-INF/src/dfc.properties and documentum-hook/docroot/WEB-INF/src/portlet.properties files. This app installs as a new Repository Type option in the Documents and Media Library.','Productivity','https://web.liferay.com/web/guest/marketplace/-/mp/asset/icon/77084234','3.0.1',1);
UNLOCK TABLES;

--
-- Table structure for table `Marketplace_Module`
--

CREATE TABLE `Marketplace_Module` (
  `uuid_` varchar(75) DEFAULT NULL,
  `moduleId` bigint(20) NOT NULL,
  `appId` bigint(20) DEFAULT NULL,
  `bundleSymbolicName` varchar(500) DEFAULT NULL,
  `bundleVersion` varchar(75) DEFAULT NULL,
  `contextName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  KEY `IX_5848F52D` (`appId`,`bundleSymbolicName`(255),`bundleVersion`),
  KEY `IX_C6938724` (`appId`,`contextName`),
  KEY `IX_DD03D499` (`bundleSymbolicName`(255)),
  KEY `IX_F2F1E964` (`contextName`),
  KEY `IX_A7EFD80E` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Marketplace_Module`
--

LOCK TABLES `Marketplace_Module` WRITE;
INSERT INTO `Marketplace_Module` VALUES ('d0aed10c-6605-b9d9-8b7d-986bf0ae85d2',30155,29800,'com.liferay.osgi.util','3.0.9',NULL),('50168bd6-483f-1a93-6ade-9d03f7fb595b',30156,29800,'com.liferay.petra.xml','1.0.7',NULL),('6c7cac8a-5d6a-5f53-78d1-9fe9fe4287df',30157,29800,'com.liferay.portal.configuration.metatype','2.0.7',NULL),('75f05ad1-926c-a488-3045-43feed9ac3e9',30158,29800,'com.liferay.portal.configuration.persistence','2.0.6',NULL),('fe5d0394-ecfd-eb23-8452-a649173bb298',30159,29800,'com.liferay.portal.log4j.extender','2.0.3',NULL),('d2a996c6-500e-6087-f019-1d7746987a2e',30160,29800,'com.liferay.portal.lpkg.deployer','2.0.12',NULL),('57e685a2-1d18-81f3-31f7-13910714b7e2',30161,29800,'com.liferay.portal.osgi.web.portlet.tracker','2.0.10',NULL),('76d0d8ae-78af-ee3d-b971-b11ad7633aca',30162,29800,'com.liferay.portal.osgi.web.servlet.context.helper','2.1.10',NULL),('7cb94628-8ccc-e896-95eb-652f0d486d9d',30163,29800,'com.liferay.portal.osgi.web.servlet.jsp.compiler','2.0.22',NULL),('7331566d-a3b5-3aa7-6227-cc1d5bc900fc',30164,29800,'com.liferay.portal.osgi.web.wab.extender','2.0.16',NULL),('2ab5bff7-4cb0-67c0-51d5-ad7771e572f4',30165,29800,'com.liferay.portal.osgi.web.wab.generator','2.1.25',NULL),('7213dce2-3313-91d4-70e5-74ae3a7b5355',30166,29800,'com.liferay.portal.osgi.web.wab.reference.support','1.0.4',NULL),('c93756d7-f4ed-9d75-2b54-c5af796e1e77',30167,29800,'com.liferay.portal.profile','1.0.4',NULL),('4f34420e-2717-9320-cc41-90b7e7d3e6f7',30168,29800,'com.liferay.portal.remote.dependency.manager.tccl','2.0.2',NULL),('fdce45b3-a032-a359-2c33-00e2acf903b1',30169,29800,'com.liferay.portal.target.platform.indexer','4.0.2',NULL),('196b82f1-5900-9144-e8da-2435f2c7e215',30170,29800,'com.sun.el.javax.el','3.0.0',NULL),('5039b1d6-3fe9-433a-2a9c-af9f26a0ed78',30171,29800,'javax.servlet.jsp-api','2.3.2.b01',NULL),('1dc6993e-61bc-7590-8c87-225c8172765a',30172,29800,'javax.servlet.jsp.jstl','1.2.3.LIFERAY-PATCHED-2',NULL),('68fe7da0-fd1c-da54-8ab8-49fba3a5b596',30173,29800,'javax.servlet.jsp.jstl-api','1.2.1',NULL),('6c4b8fc7-4569-ab1e-7f38-e3c96007e0c9',30174,29800,'org.apache.commons.fileupload','1.3.2',NULL),('28c54716-06b2-ed88-4bac-9dd5eb017465',30175,29800,'org.apache.commons.io','2.2.0',NULL),('c024193e-61ac-8629-1ff2-a6fd775a9a08',30176,29800,'org.apache.felix.bundlerepository','2.0.2',NULL),('d1fd8e4f-47a5-7b51-5861-1f95799f39a8',30177,29800,'org.apache.felix.configadmin','1.8.8',NULL),('9141a9ed-f50e-7998-70b8-c0c438d3d5f3',30178,29800,'org.apache.felix.dependencymanager','3.2.0',NULL),('e9e7ff0f-7967-3f9e-44da-8af33201b929',30179,29800,'org.apache.felix.dependencymanager.shell','3.2.0',NULL),('2f643af4-f9cc-0698-c4e8-445d18717281',30180,29800,'org.apache.felix.eventadmin','1.4.6',NULL),('85a05a4a-da31-35c3-bfe0-fd6083dce396',30181,29800,'org.apache.felix.fileinstall','3.5.4',NULL),('497378c3-6f16-ee9e-4407-b552867a2329',30182,29800,'org.apache.felix.gogo.command','0.12.0',NULL),('0870dac9-8a21-ddab-f64b-f528c2a36a2a',30183,29800,'org.apache.felix.gogo.runtime','0.10.0',NULL),('fbde9ca0-a53c-a5b7-71c7-4f7f26185e0f',30184,29800,'org.apache.felix.gogo.shell','0.10.0',NULL),('5abac60e-7301-82b7-0659-de445b8a5233',30185,29800,'org.apache.felix.scr','2.0.6',NULL),('c5da78da-15ff-0837-9ce4-e13a3ba122fd',30186,29800,'org.eclipse.equinox.console','1.1.100.v20141023-1406',NULL),('ca546d62-d849-946d-0987-cc5dec802f56',30187,29800,'org.eclipse.equinox.http.servlet','1.2.2.v20170215-1647',NULL),('e6896faa-e12b-f887-6bc1-9b37cf246ef6',30188,29800,'org.eclipse.equinox.metatype','1.4.200.v20150715-1528',NULL),('30b2739b-eca4-9b4f-b4a2-c8c233886992',30189,29800,'org.osgi.service.http','3.5.0.LIFERAY-PATCHED-2',NULL),('3f4d6253-6ffb-5672-f31f-c40a98bbc7a3',30190,29800,'org.osgi.service.metatype','1.3.0.201505202024',NULL),('940a2b73-12c1-4c9a-eeda-cb794f38d4ce',30191,29907,'com.liferay.application.list.api','2.2.2',NULL),('a8ea68a8-4295-f7f5-f0e4-5759f4569c26',30192,29907,'com.liferay.application.list.taglib','2.0.7','application-list-taglib'),('e89084ce-e3ab-2a74-8040-07313c33eb81',30193,29907,'com.liferay.application.list.user.personal.site.permissions','2.0.5',NULL),('3125f37a-068b-4d1c-c0f8-b2e1da2fed10',30194,29907,'com.liferay.asset.browser.web','1.0.17',NULL),('e4bd6aee-6ee7-7acd-249c-787bdd13d790',30195,29907,'com.liferay.asset.categories.admin.web','1.0.18',NULL),('7672e758-88b4-4bd5-0803-bbb58790d8c8',30196,29907,'com.liferay.asset.categories.navigation.web','1.0.11','asset-categories-navigation-web'),('7fa87a9a-0e8d-14c9-b57f-5f95ae3a95b0',30197,29907,'com.liferay.asset.categories.service','1.0.8',NULL),('d2e2c94d-1ef1-0a59-16c6-e44ccfcefe45',30198,29907,'com.liferay.asset.display.web','1.0.3',NULL),('a70ae65a-385d-6814-b3a0-c3d91e40f4af',30199,29907,'com.liferay.asset.entry.query.processor.custom.user.attributes','2.0.4','asset-entry-query-processor-custom-user-attributes'),('ca38ca69-d3f0-caff-0bf2-ee42c271215c',30200,29907,'com.liferay.asset.publisher.layout.prototype','1.0.6',NULL),('a6a8e5c6-8def-35f5-4acf-9005d74dd581',30201,29907,'com.liferay.asset.publisher.web','1.5.1','asset-publisher-web'),('0cff01fe-6d8e-4192-bb72-c319bd158d9b',30202,29907,'com.liferay.asset.service','1.0.1',NULL),('17ebb744-ed6d-0e03-7e96-ae20b00fb23c',30203,29907,'com.liferay.asset.taglib','2.0.6','asset-taglib'),('c0b3be77-9a96-d039-9779-7b54ee49944d',30204,29907,'com.liferay.asset.tags.admin.web','1.0.5',NULL),('537e3774-adfe-c59d-3aed-c69c0e5242fd',30205,29907,'com.liferay.asset.tags.compiler.web','2.0.2',NULL),('414d75e7-2aba-9cd9-9e85-f83a3115d467',30206,29907,'com.liferay.asset.tags.navigation.web','2.0.8','asset-tags-navigation-web'),('f90aa5c6-8705-a62c-9b36-03d755ad6022',30207,29907,'com.liferay.asset.tags.service','2.0.2',NULL),('2b9fda7a-4f04-40ea-35df-a8f6e8c54d77',30208,29907,'com.liferay.asset.web','2.0.2',NULL),('b9c6e6d2-5615-b22f-e458-a782f3be6599',30209,29907,'com.liferay.exportimport.resources.importer','1.2.8',NULL),('a5a56b00-5372-2fab-d135-0e499c842251',30210,29907,'com.liferay.exportimport.service','3.6.0',NULL),('b80eb0a2-20a3-6673-6135-a46a099d2da1',30211,29907,'com.liferay.exportimport.web','1.0.24','exportimport-web'),('1297ae19-04d3-3276-c055-ab6f2e5a9033',30212,29907,'com.liferay.iframe.web','1.0.6','iframe-web'),('6c68376c-bb39-bf6a-d37a-151ee55dfbac',30213,29907,'com.liferay.journal.api','2.7.0',NULL),('c3c4f047-c7c5-b877-6446-cea6f6b35007',30214,29907,'com.liferay.journal.content.asset.addon.entry.comments','1.0.6','journal-content-asset-addon-entry-comments'),('edd0ecf2-222c-b790-8e1d-43bd27a2dff8',30215,29907,'com.liferay.journal.content.asset.addon.entry.common','2.0.3',NULL),('bd0ac551-a5aa-0157-3221-df880197a653',30216,29907,'com.liferay.journal.content.asset.addon.entry.conversions','2.0.3','journal-content-asset-addon-entry-conversions'),('f04ee5c7-15bd-e9a3-464b-41fef9d58291',30217,29907,'com.liferay.journal.content.asset.addon.entry.locales','1.0.4','journal-content-asset-addon-entry-locales'),('db82e76b-2b82-9e31-60a9-f9a3181d5a3a',30218,29907,'com.liferay.journal.content.asset.addon.entry.print','2.0.3','journal-content-asset-addon-entry-print'),('5fc7ad9e-7615-d68a-c594-404019db0bac',30219,29907,'com.liferay.journal.content.asset.addon.entry.ratings','2.0.3','journal-content-asset-addon-entry-ratings'),('127f34a1-b4ba-11bf-0773-130d0bc3246e',30220,29907,'com.liferay.journal.content.asset.addon.entry.related.assets','2.0.3','journal-content-asset-addon-entry-related-assets'),('87d8378d-3599-56d6-a243-c63ea0f8a56a',30221,29907,'com.liferay.journal.content.search.web','1.0.7','journal-content-search-web'),('353e8727-4141-fbbd-1c7a-a69946a03f84',30222,29907,'com.liferay.journal.content.web','1.1.13','journal-content-web'),('4047c2fd-ae56-73e9-3b0a-04f62665ec43',30223,29907,'com.liferay.journal.editor.configuration','1.0.2',NULL),('aa917445-3988-8cb6-2959-d21e365f3e6d',30224,29907,'com.liferay.journal.item.selector.api','1.0.2',NULL),('a04e3b5c-9331-bb97-658f-c79e6631f9b3',30225,29907,'com.liferay.journal.item.selector.web','1.0.3','journal-item-selector-web'),('2d7698bb-700c-d66d-0466-ada3278f1056',30226,29907,'com.liferay.journal.lang','2.0.5',NULL),('81b37038-ce09-781e-174c-b960312b0532',30227,29907,'com.liferay.journal.ratings.definition','2.0.2',NULL),('bcfb36f3-a70f-710f-fc84-7cca68f2f3db',30228,29907,'com.liferay.journal.service','3.12.0',NULL),('bed72901-bb56-1892-969b-2f03db8391ff',30229,29907,'com.liferay.journal.taglib','1.0.3','journal-taglib'),('60f408a8-b384-a199-c0dd-dafd88009e32',30230,29907,'com.liferay.journal.terms.of.use','2.0.23','journal-terms-of-use'),('3ba2dd36-fb98-a6a5-ed37-6d725145f804',30231,29907,'com.liferay.journal.web','1.7.5','journal-web'),('638a574e-3b22-499e-290f-d85c5e0c8783',30232,29907,'com.liferay.layout.admin.web','1.0.33','layout-admin-web'),('6ec76082-f163-f27b-6cf5-c8bcc9bdb5f2',30233,29907,'com.liferay.layout.item.selector.api','1.0.3',NULL),('bb114652-96f4-0221-7cce-e8ec4e24a00f',30234,29907,'com.liferay.layout.item.selector.web','1.1.5','layout-item-selector-web'),('b8959685-b826-5ed6-ce9a-b8ec1bc794e8',30235,29907,'com.liferay.layout.prototype.impl','1.0.4',NULL),('f383d1c1-767d-c3a9-1e14-6bc7293d1d40',30236,29907,'com.liferay.layout.prototype.web','1.0.8',NULL),('83884322-d262-a30c-cd74-b82156006c9f',30237,29907,'com.liferay.layout.set.prototype.api','1.0.2',NULL),('846358da-d919-8b40-e12c-4a184f7f4efe',30238,29907,'com.liferay.layout.set.prototype.impl','2.0.0',NULL),('67817c60-0464-650b-9942-e59cd6d6b625',30239,29907,'com.liferay.layout.set.prototype.web','1.0.9',NULL),('dacf52be-ae7f-c3ee-8e57-cde66d7092ad',30240,29907,'com.liferay.layout.taglib','2.0.7','layout-taglib'),('e3a95bc7-0a7b-9aa2-5e78-c182dce9c34c',30241,29907,'com.liferay.layout.type.controller.control.panel','2.0.2','layout-type-controller-control-panel'),('a29eb0ca-bba8-2621-e4ad-80f051b058e6',30242,29907,'com.liferay.layout.type.controller.full.page.application','2.0.3','layout-type-controller-full-page-application'),('1cb72a59-f1c6-3c82-bc76-987475b00180',30243,29907,'com.liferay.layout.type.controller.node','2.0.2','layout-type-controller-node'),('96b8a812-8f49-9782-4798-c56f393b7f6f',30244,29907,'com.liferay.layout.type.controller.shared.portlet','2.0.2','layout-type-controller-shared-portlet'),('32e95967-5a53-7662-e734-eee02390de9c',30245,29907,'com.liferay.nested.portlets.web','2.0.6','nested-portlet'),('51707301-3271-9f2c-a5b3-daeaa5bb8f4c',30246,29907,'com.liferay.portlet.configuration.css.web','2.0.9','portlet-configuration-css-web'),('d7bac10e-e01c-d1f0-7820-9d705734e4c7',30247,29907,'com.liferay.portlet.configuration.icon.close','2.0.2',NULL),('5a803bf8-39d4-107e-7155-8a8a3b33abee',30248,29907,'com.liferay.portlet.configuration.icon.edit','2.0.2',NULL),('c2b255b7-d9db-033f-0ac4-7136444c5771',30249,29907,'com.liferay.portlet.configuration.icon.edit.defaults','2.0.2',NULL),('7cc54dc6-9d3a-95a1-eae3-927db03bf254',30250,29907,'com.liferay.portlet.configuration.icon.edit.guest','2.0.2',NULL),('3a91d2a1-fa23-92fa-20cd-53c036ebe880',30251,29907,'com.liferay.portlet.configuration.icon.help','2.0.2',NULL),('592e8d52-e7ef-9f15-11e1-b2a1f3c65d40',30252,29907,'com.liferay.portlet.configuration.icon.locator.api','2.0.3',NULL),('d3c8dd40-b12c-2b85-1fb3-d90615de6d6b',30253,29907,'com.liferay.portlet.configuration.icon.maximize','2.0.2',NULL),('cbd9f9d4-cfae-fbac-3f91-59b4bac1f3ac',30254,29907,'com.liferay.portlet.configuration.icon.minimize','2.0.2',NULL),('4984bb85-5c4c-f9f8-fde0-4a59212bce99',30255,29907,'com.liferay.portlet.configuration.icon.print','2.0.2',NULL),('d46fb241-5a54-8c19-5fe7-b92c622ff848',30256,29907,'com.liferay.portlet.configuration.icon.refresh','2.0.2',NULL),('c9997fa0-01db-5ba3-500a-e99fc038f25c',30257,29907,'com.liferay.portlet.configuration.sharing.web','2.0.5',NULL),('8b0c48e2-d2ff-b006-b205-9895749e66b9',30258,29907,'com.liferay.portlet.configuration.toolbar.contributor.locator.api','2.0.2',NULL),('3931bd3d-8270-fb7c-02df-b0704bb0d2d5',30259,29907,'com.liferay.portlet.configuration.web','1.0.18',NULL),('7108350a-ca4c-b7f7-806a-38d0ebaff073',30260,29907,'com.liferay.portlet.display.template','2.1.0',NULL),('b89cef8c-bfbd-745a-22a5-8b4c7bca801b',30261,29907,'com.liferay.portlet.display.template.web','2.0.7',NULL),('1ce4ba09-a87f-c89f-2012-3977fe847608',30262,29907,'com.liferay.product.navigation.control.menu.dxp.theme.contributor','1.0.6','product-navigation-control-menu-dxp-theme'),('93cb4792-0c8b-5a33-746d-9b80fcfc3fde',30263,29907,'com.liferay.product.navigation.control.menu.web','2.0.11','product-navigation-control-menu-web'),('4fe19a09-0e4f-5a41-405a-d8c7e7868c52',30264,29907,'com.liferay.product.navigation.control.panel','2.0.2',NULL),('0b92512e-6039-b476-5095-a50fb33ec472',30265,29907,'com.liferay.product.navigation.product.menu.dxp.theme.contributor','1.0.7','product-navigation-product-menu-dxp-theme'),('38845ad3-9ccf-a518-a91f-1d7a218b420b',30266,29907,'com.liferay.product.navigation.product.menu.web','2.0.14','product-navigation-product-menu-web'),('2074a5c0-c5cb-347d-be14-ceb8e5356b4f',30267,29907,'com.liferay.product.navigation.simulation.device','2.0.7','product-navigation-simulation-device'),('54829c63-bf40-948e-c2de-346d8b2d4b87',30268,29907,'com.liferay.product.navigation.simulation.theme.contributor','2.0.3','product-navigation-simulation-theme'),('b188061b-bd82-001c-b102-847b3f1c7946',30269,29907,'com.liferay.product.navigation.simulation.web','2.1.4','product-navigation-simulation-web'),('763136d7-6593-4b37-e90c-67a10c0dc213',30270,29907,'com.liferay.product.navigation.site.administration','2.0.5','product-navigation-site-administration'),('313b4f3d-0d2d-594f-a564-cf8602a71339',30271,29907,'com.liferay.product.navigation.taglib','2.0.8','product-navigation-taglib'),('49189cbf-9eb5-ab92-5a96-38799bf9787d',30272,29907,'com.liferay.product.navigation.user','2.0.3','product-navigation-user'),('646fb9ff-bd37-bc36-135f-e3d03b91b109',30273,29907,'com.liferay.product.navigation.user.personal.bar.web','2.0.5',NULL),('800148d4-7f21-d11d-7300-03c80d85c100',30274,29907,'com.liferay.rss.util','1.0.7',NULL),('467b4869-386f-6c7b-19bf-bcc30e9cbeed',30275,29907,'com.liferay.rss.web','2.2.3','rss-web'),('ba00f0fa-3814-7d77-6db4-1b766efc4cc1',30276,29907,'com.liferay.site.admin.web','1.0.23','site-admin-web'),('7ebd852f-134c-e494-4794-19c11f2099f6',30277,29907,'com.liferay.site.api','2.1.7',NULL),('614516c9-ca10-7b3d-c18d-a0070e8008dc',30278,29907,'com.liferay.site.browser.web','2.0.10',NULL),('867db436-2904-2f97-612a-366c4c22ade7',30279,29907,'com.liferay.site.item.selector.api','1.0.3',NULL),('0b59bb08-c246-ca55-8911-a41a36a57d02',30280,29907,'com.liferay.site.item.selector.web','2.0.9','site-item-selector-web'),('abf386e6-3823-313f-0caf-b0a41173606b',30281,29907,'com.liferay.site.memberships.web','1.0.17',NULL),('38d44ec4-529a-717c-99be-c0cafdb0ff1e',30282,29907,'com.liferay.site.my.sites.web','1.0.8',NULL),('cea29085-ca7d-8ee7-f9ef-2bc5e48465dc',30283,29907,'com.liferay.site.navigation.breadcrumb.web','2.0.7','site-navigation-breadcrumb-web'),('5821cbea-63d6-d7b1-f213-0ff1b0dc5fda',30284,29907,'com.liferay.site.navigation.directory.web','2.0.3','site-navigation-directory-web'),('2a692422-b653-85cd-91d4-d8dd0b0dd424',30285,29907,'com.liferay.site.navigation.language.web','2.1.3','site-navigation-language-web'),('598bc660-3759-dcef-0f79-f59957c0a135',30286,29907,'com.liferay.site.navigation.menu.web','2.0.8','site-navigation-menu-web'),('56bca01b-10ae-55f7-f345-74461ce7aec4',30287,29907,'com.liferay.site.navigation.site.map.web','2.0.7','site-navigation-site-map-web'),('24096454-7844-3692-12ed-08beb518abb4',30288,29907,'com.liferay.site.navigation.taglib','2.1.5','site-navigation-taglib'),('d4046c27-dfe9-8508-59b3-c560cd6029a6',30289,29907,'com.liferay.site.teams.web','1.0.12',NULL),('9d7eed86-4392-32fd-f7a8-d47d75502192',30290,29907,'com.liferay.staging.api','2.0.2',NULL),('6554e333-e2e2-1ced-7966-e514c3aec7bc',30291,29907,'com.liferay.staging.bar.web','1.0.10','staging-bar-web'),('7bf9b712-7aae-c575-382b-9fcbf8449ba4',30292,29907,'com.liferay.staging.configuration.web','1.0.12',NULL),('f4d44328-db3a-fdcb-acf3-4713f17d2ddf',30293,29907,'com.liferay.staging.lang','2.0.6',NULL),('239d7612-2587-2ca4-c7de-9ace11b49c00',30294,29907,'com.liferay.staging.portlet.data.handler','2.0.2',NULL),('f46df352-4250-4976-8242-e5a546ba713a',30295,29907,'com.liferay.staging.processes.web','1.0.14','staging-processes-web'),('1d82e2ff-453a-9b28-b443-e2af9ea03d6a',30296,29907,'com.liferay.staging.security','2.0.24',NULL),('2c43a0fc-b9be-817c-61a2-9e576255394c',30297,29907,'com.liferay.staging.taglib','3.1.9','staging-taglib'),('712857cf-c0bb-3556-a5b0-1af849e962cf',30298,29907,'com.liferay.trash.taglib','2.0.6','trash-taglib'),('97669a9e-7997-f593-b6a8-ff3a957c1acc',30299,29907,'com.liferay.trash.web','1.0.16','trash-web'),('c5febac0-295b-546e-a737-befd1ac82b5d',30300,29907,'com.liferay.xsl.content.web','2.0.4','xsl-content-web'),('2e5a1ec7-7b47-a930-fef3-3532afa3dd01',30301,29907,'com.liferay.exportimport.api','2.1.0',NULL),('c5a7c6be-6582-e655-4223-34b1d299f67d',30302,29907,'com.liferay.layout.impl','2.0.2',NULL),('f09769e2-253a-c760-dd89-91d87e4cd458',30303,29907,'com.liferay.layout.prototype.api','1.0.1',NULL),('ba82c39d-b4c9-523e-97e2-f1c2d2f7767c',30304,29907,'com.liferay.product.navigation.control.menu.api','3.0.0',NULL),('1d7b0c08-ed72-6540-861e-0e267639969b',30305,29907,'com.liferay.product.navigation.simulation','2.0.1',NULL),('0582ff40-6ba7-75bd-99ca-284d42cfd8d5',30306,30023,'Liferay Documentum Connector-documentum-hook-wrapper','7.0.10.4',NULL),('9ff9bb2a-d4c0-6582-99ce-26357c56549b',30307,29847,'com.liferay.calendar.api','2.0.7',NULL),('e820acad-cf92-7129-bec0-08601253c547',30308,29847,'com.liferay.calendar.service','2.1.29',NULL),('8a423e06-87da-c09b-04b9-75465088a100',30309,29847,'com.liferay.calendar.web','1.0.24','calendar-web'),('a9a1d5c0-06e6-31d3-6a7b-b7036e6671a5',30310,29847,'com.liferay.dynamic.data.lists.api','2.1.2',NULL),('2243d4d7-6c0b-afaf-4f3f-3284e0a5a93d',30311,29847,'com.liferay.dynamic.data.lists.form.web','1.1.9','dynamic-data-lists-form-web'),('100b95ec-9efe-98cf-ada7-2d33f465e00f',30312,29847,'com.liferay.dynamic.data.lists.service','1.1.25',NULL),('3bf5cc5b-0492-ddb0-b2db-ac35396819b7',30313,29847,'com.liferay.dynamic.data.lists.web','1.1.22','dynamic-data-lists-web'),('cf1b184a-2a46-ebcb-0adf-d50fff4748b2',30314,29847,'com.liferay.dynamic.data.mapping.api','3.5.4',NULL),('ac6a9800-8f43-7bf4-1ef8-63e40e464e28',30315,29847,'com.liferay.dynamic.data.mapping.data.provider','2.0.3',NULL),('e6053a64-a88f-ccd5-5d35-59eb68e3c018',30316,29847,'com.liferay.dynamic.data.mapping.data.provider.impl','1.0.1',NULL),('16cd90ea-232c-4439-57bc-977a655f0c7b',30317,29847,'com.liferay.dynamic.data.mapping.data.provider.web','1.0.7','dynamic-data-mapping-data-provider-web'),('64972ab8-3bcd-dec6-8b6e-5794a93dc2f2',30318,29847,'com.liferay.dynamic.data.mapping.expression','2.0.5',NULL),('3b6d6595-b397-d6b8-ac0f-daa7cfc38604',30319,29847,'com.liferay.dynamic.data.mapping.form.evaluator','2.0.3',NULL),('1ab9a7a4-21c3-66ec-edc2-e6c756838a9e',30320,29847,'com.liferay.dynamic.data.mapping.form.field.type','2.0.5',NULL),('a4b55fa0-15df-cc60-9fd8-749bd90c1096',30321,29847,'com.liferay.dynamic.data.mapping.form.renderer','2.1.9','dynamic-data-mapping-form-renderer'),('296816b9-4bcb-e182-78b6-8f3b53497ef3',30322,29847,'com.liferay.dynamic.data.mapping.form.values.factory','2.0.9',NULL),('8b6cec8d-8c2b-0fb3-1220-0433cb8f4163',30323,29847,'com.liferay.dynamic.data.mapping.form.values.query','2.0.9',NULL),('80f710ce-41e8-3605-fb27-95f8a7b4bf0d',30324,29847,'com.liferay.dynamic.data.mapping.io','2.0.13',NULL),('b429cbff-3828-f5bd-829b-7970f0fc601b',30325,29847,'com.liferay.dynamic.data.mapping.service','2.3.3',NULL),('d1c0f3ab-0899-69cc-23b1-681ef1b7201e',30326,29847,'com.liferay.dynamic.data.mapping.taglib','2.1.4','dynamic-data-mapping-taglib'),('e6ad9d81-c097-6903-a657-fadad406432e',30327,29847,'com.liferay.dynamic.data.mapping.type.captcha','2.0.4','dynamic-data-mapping-type-captcha'),('8fd15ca9-d298-cddd-2aa3-49bbdac92e40',30328,29847,'com.liferay.dynamic.data.mapping.type.checkbox','2.0.7','dynamic-data-mapping-type-checkbox'),('b8802408-3f21-5b26-c01c-5339713344e6',30329,29847,'com.liferay.dynamic.data.mapping.type.date','2.0.7','dynamic-data-mapping-type-date'),('7ecd9330-09be-2520-9cd4-3f85ce6cbc74',30330,29847,'com.liferay.dynamic.data.mapping.type.editor','2.0.7','dynamic-data-mapping-type-editor'),('6d60d1c2-580c-9b97-44b8-fa03285394b3',30331,29847,'com.liferay.dynamic.data.mapping.type.key.value','2.0.5','dynamic-data-mapping-type-key-value'),('5d881d85-bdab-278e-2d44-038bdffac86b',30332,29847,'com.liferay.dynamic.data.mapping.type.options','2.0.7','dynamic-data-mapping-type-options'),('bb4ab903-d0fd-a158-b7b2-80d68bfa06ae',30333,29847,'com.liferay.dynamic.data.mapping.type.paragraph','2.0.7','dynamic-data-mapping-type-paragraph'),('68cf5adb-01aa-15d4-73a5-10b1d3c3a673',30334,29847,'com.liferay.dynamic.data.mapping.type.radio','2.0.10','dynamic-data-mapping-type-radio'),('816db8d0-61b0-0980-700c-1bb2a4da0be8',30335,29847,'com.liferay.dynamic.data.mapping.type.select','2.0.9','dynamic-data-mapping-type-select'),('547e4c2c-b9d6-9726-6b62-e5e92221917c',30336,29847,'com.liferay.dynamic.data.mapping.type.text','2.0.7','dynamic-data-mapping-type-text'),('bc5e7e3b-d8d0-713e-a34a-e0e21a2cee63',30337,29847,'com.liferay.dynamic.data.mapping.type.validation','2.0.4','dynamic-data-mapping-type-validation'),('0d7a2b88-cb40-7cf0-c099-5d6e34b99470',30338,29847,'com.liferay.dynamic.data.mapping.validator','2.1.5',NULL),('c2cbbcbb-f02f-8433-4b1b-bf12b097587b',30339,29847,'com.liferay.dynamic.data.mapping.web','1.0.31','dynamic-data-mapping-web'),('fd2aa9f8-8bdb-0606-1280-f24c7a7e1b12',30340,29847,'com.liferay.polls.service','3.0.17',NULL),('1d1fe08f-5718-2948-d488-a1e4d74ba95f',30341,29847,'com.liferay.polls.web','2.0.13','polls-web'),('dbf4f015-7b43-4088-a89f-0c9b7f5627a1',30342,29847,'com.liferay.portal.rules.engine.api','2.0.5',NULL),('c7d55005-6c1f-0dff-d0d5-6da3a5835615',30343,29847,'com.liferay.portal.rules.engine.wiring','2.0.2',NULL),('d1168303-7585-5477-988e-bf2fc63dbdc3',30344,29847,'com.liferay.portal.workflow.definition.link.web','1.0.5',NULL),('68c5fa51-79f7-4f26-5699-b05670ff4eda',30345,29847,'com.liferay.portal.workflow.definition.web','1.0.7','portal-workflow-definition-web'),('69161c7a-90a7-a03f-4be0-f649da10b5bd',30346,29847,'com.liferay.portal.workflow.instance.web','1.0.8',NULL),('7bed8efb-ee99-b6f8-0a08-35f0876eafa7',30347,29847,'com.liferay.portal.workflow.kaleo.api','2.1.0',NULL),('3497f2a9-df81-4309-42c6-52d8ce7ecbe2',30348,29847,'com.liferay.portal.workflow.kaleo.definition.api','2.0.2',NULL),('dd81c95e-0754-98a6-4d5d-b090003d3846',30349,29847,'com.liferay.portal.workflow.kaleo.definition.impl','2.0.5',NULL),('bb78c715-d96f-dafd-1fd9-a5d360b677b8',30350,29847,'com.liferay.portal.workflow.kaleo.designer.api','1.0.2',NULL),('3e58b9a1-6e29-a262-858f-a7e11b16c1df',30351,29847,'com.liferay.portal.workflow.kaleo.designer.service','1.1.2',NULL),('17893dfc-0016-d89a-8fe2-86108f30ae0a',30352,29847,'com.liferay.portal.workflow.kaleo.designer.web','1.0.13',NULL),('221fa9a2-a5c2-879a-b7bc-b28544bd61db',30353,29847,'com.liferay.portal.workflow.kaleo.forms.api','1.1.1',NULL),('1471a12a-fad2-21d6-275b-1e51bd688987',30354,29847,'com.liferay.portal.workflow.kaleo.forms.service','1.1.9',NULL),('b4b4c028-0885-4d6a-5cc5-62b2cb19188e',30355,29847,'com.liferay.portal.workflow.kaleo.forms.web','1.0.14','portal-workflow-kaleo-forms-web'),('c667c1e6-a245-487a-2e8e-c6dae06ee210',30356,29847,'com.liferay.portal.workflow.kaleo.runtime.api','2.2.1',NULL),('1169dda0-ec02-7389-5b7e-41cc47bb3816',30357,29847,'com.liferay.portal.workflow.kaleo.runtime.impl','2.0.11',NULL),('ecbb0353-3e93-c84a-e16a-b1a0507749fa',30358,29847,'com.liferay.portal.workflow.kaleo.runtime.integration.impl','1.0.5',NULL),('e9039dc1-d2fb-086d-730e-dd52dd53d266',30359,29847,'com.liferay.portal.workflow.kaleo.runtime.scripting.impl','1.0.3',NULL),('555d1267-b931-5335-cbf2-b399bb0bb2bf',30360,29847,'com.liferay.portal.workflow.kaleo.service','2.0.24',NULL),('342b2dcc-ebf9-9add-ef7c-3f3a31ea4909',30361,29847,'com.liferay.portal.workflow.lang','2.0.3',NULL),('2321e9b7-8808-0940-e0df-1d79839e7512',30362,29847,'com.liferay.portal.workflow.task.web','1.0.20','portal-workflow-task-web'),('60a62e9f-b1a4-c47d-3538-0012da51cf65',30363,29847,'com.liferay.dynamic.data.mapping.lang','2.0.2',NULL),('9fd7d563-a460-099c-819b-3bc1ba334788',30364,29847,'com.liferay.polls.api','4.0.0',NULL),('8b066f90-21e3-2d31-6bb9-62ec3549bf7e',30365,29847,'com.liferay.portal.reports.engine.api','3.0.0',NULL),('9ea537e0-bb9d-daf3-1007-eede40b98a07',30366,29796,'com.liferay.oauth.api','1.0.1',NULL),('a880f475-2600-9a69-a5c3-f13c5d650e20',30367,29796,'com.liferay.oauth.service','1.0.1',NULL),('f2986a2f-ce4c-78e0-24e9-bb96f9a0900d',30368,29796,'com.liferay.oauth.web','1.0.2',NULL),('1b9f8eb5-372c-bcb6-c5f0-7b95bcec9a0c',30369,29839,'Liferay Sharepoint Connector-sharepoint-hook-wrapper','7.0.10.4',NULL),('aa87261f-b13c-d2c7-f925-0d9e2fe8806e',30370,29504,'com.liferay.alloy.mvc','1.0.5',NULL),('1614eeb9-a4ba-7903-1f6a-df4812371b9e',30371,29504,'com.liferay.captcha.api','1.0.1',NULL),('36a41568-61ac-91e1-3745-fc70a16ca6d1',30372,29504,'com.liferay.captcha.taglib','1.0.3','captcha-taglib'),('4f5ec4a4-cf18-1add-6101-847a9b50800a',30373,29504,'com.liferay.configuration.admin.web','1.0.19',NULL),('3750d8db-ea80-b383-ea2d-632ec45a1026',30374,29504,'com.liferay.contacts.api','2.0.4',NULL),('00f1807f-5a15-f1df-bdac-70b091411e2d',30375,29504,'com.liferay.contacts.service','2.0.13',NULL),('1b0063f3-63ed-e200-eeac-0e131a98f096',30376,29504,'com.liferay.contacts.web','1.0.21',NULL),('64daa6b7-5564-1c28-0a24-b8506a6da5eb',30377,29504,'com.liferay.expando.taglib','1.0.3','expando-taglib'),('7be66bf0-0054-2916-02f5-617040900336',30378,29504,'com.liferay.expando.web','1.0.7',NULL),('8dfdf465-c67b-a711-1bb0-dd1917d0e94e',30379,29504,'com.liferay.frontend.css.common','2.0.4',NULL),('604fe6a8-782b-57c7-b073-317884b41277',30380,29504,'com.liferay.frontend.css.rtl.converter','1.0.5',NULL),('eab39f54-19fd-02ca-ca68-6588c5d13c88',30381,29504,'com.liferay.frontend.css.rtl.servlet','1.0.4',NULL),('6267d278-c490-96ed-05e0-323d4284a0ac',30382,29504,'com.liferay.frontend.css.web','1.0.25','frontend-css-web'),('cb49a39c-d9f2-53db-1a62-6f4285004fdc',30383,29504,'com.liferay.frontend.editor.alloyeditor.accessibility.web','1.0.4','frontend-editor-alloyeditor-accessibility-web'),('653c5211-daef-dbe8-75d8-71f7959773f4',30384,29504,'com.liferay.frontend.editor.alloyeditor.link.browse.web','1.0.3','frontend-editor-alloyeditor-link-browse-web'),('61cadad5-330a-ebe8-adb8-53cebe07cdf5',30385,29504,'com.liferay.frontend.editor.alloyeditor.web','1.0.22','frontend-editor-alloyeditor-web'),('29f267df-b016-2c4c-d1c8-977c2bdd7144',30386,29504,'com.liferay.frontend.editor.ckeditor.web','1.0.25','frontend-editor-ckeditor-web'),('1bc5c1a6-e791-61cd-3e0f-b6ce737cf428',30387,29504,'com.liferay.frontend.editor.simple.web','1.0.6','frontend-editor-simple-web'),('c05f7164-9811-9218-c1d6-c6d2493b24a5',30388,29504,'com.liferay.frontend.editor.tinymce.web','1.0.11','frontend-editor-tinymce-web'),('ddcdf29c-75ba-9e0f-c8b2-73ff9a7f0c96',30389,29504,'com.liferay.frontend.image.editor.api','1.0.3',NULL),('d584cb29-34b4-f5b8-f592-6c79e89f4b1c',30390,29504,'com.liferay.frontend.image.editor.capability.brightness','1.0.10','frontend-image-editor-capability-brightness-1.0.10'),('6e646a95-505e-7c8a-ff02-f5551cb68a97',30391,29504,'com.liferay.frontend.image.editor.capability.contrast','1.0.10','frontend-image-editor-capability-contrast-1.0.10'),('e8d68795-4f06-3db0-0f6f-e4177012793c',30392,29504,'com.liferay.frontend.image.editor.capability.crop','1.0.10','frontend-image-editor-capability-crop-1.0.10'),('7c61a352-7869-315b-3275-f286378b016a',30393,29504,'com.liferay.frontend.image.editor.capability.effects','1.0.10','frontend-image-editor-capability-effects-1.0.10'),('dea30182-7e57-8dd5-0644-ab6752b052be',30394,29504,'com.liferay.frontend.image.editor.capability.resize','1.0.10','frontend-image-editor-capability-resize-1.0.10'),('f39a4c81-be75-3b5d-da7c-ea4e09b3460f',30395,29504,'com.liferay.frontend.image.editor.capability.rotate','1.0.10','frontend-image-editor-capability-rotate-1.0.10'),('4c2a0cce-e258-10be-547f-0fb6a1a40c78',30396,29504,'com.liferay.frontend.image.editor.capability.saturation','1.0.10','frontend-image-editor-capability-saturation-1.0.10'),('aceb9477-3e4d-88e1-d46c-4820162544ef',30397,29504,'com.liferay.frontend.image.editor.integration.document.library','1.0.11','frontend-image-editor-integration-document-library'),('b7a9695a-d88e-ac88-c64e-8dace03f3376',30398,29504,'com.liferay.frontend.image.editor.web','1.0.11','frontend-image-editor-web'),('c0c50d5f-196f-8bd9-56ec-79aa32cf2cbf',30399,29504,'com.liferay.frontend.js.bundle.config.extender','1.0.6',NULL),('0045899d-15cb-1fb8-8161-e19dd42be0a0',30400,29504,'com.liferay.frontend.js.loader.modules.extender','1.0.11',NULL),('fa6fc4b2-a751-8bde-9d88-d50d5318a9c9',30401,29504,'com.liferay.frontend.js.metal.web','1.0.16','frontend-js-metal-web'),('4e36023d-c958-0632-d428-0990e9084913',30402,29504,'com.liferay.frontend.js.polyfill.babel.web','1.0.4','frontend-js-polyfill-babel-web'),('723c0dc6-cb33-c0d8-a175-8fde2e6bce6e',30403,29504,'com.liferay.frontend.js.soyutils.web','1.0.4','frontend-js-soyutils-web'),('5c8d84e9-0347-306b-af0e-05ae9259dcd6',30404,29504,'com.liferay.frontend.js.spa.web','1.0.25','frontend-js-spa-web'),('73c72726-e304-8dcf-8570-49d417141868',30405,29504,'com.liferay.frontend.js.web','1.0.39','frontend-js-web'),('cce94b4f-26b5-a830-948b-c4d4dd01edc2',30406,29504,'com.liferay.frontend.taglib','2.1.6','frontend-taglib'),('7aa9874f-92ed-b289-887a-fa940697162a',30407,29504,'com.liferay.frontend.taglib.form.navigator','1.0.2',NULL),('76a5498b-1190-fd53-afa9-29a250170eed',30408,29504,'com.liferay.frontend.taglib.soy','1.0.5','frontend-taglib-soy'),('e1680e1d-bc9f-5520-20a1-0485dcebeb21',30409,29504,'com.liferay.frontend.theme.contributor.extender','1.0.8',NULL),('bfc4fd12-3680-cc6e-87cd-72dd792bc8a6',30410,29504,'com.liferay.frontend.theme.styled','2.0.24',NULL),('c1d89272-0c84-a143-02ef-ed71353d91ff',30411,29504,'com.liferay.frontend.theme.unstyled','2.1.7',NULL),('8ba31623-877b-65e6-4ec2-ad7bf0d40a5c',30412,29504,'com.liferay.hello.soy.web','1.0.6','hello-soy-web'),('d6765232-2c4f-f0fe-cef7-bf7e3349f6ce',30413,29504,'com.liferay.hello.velocity.web','2.0.3',NULL),('74c0fbbf-a15b-1d7f-caaa-ab8bf1f92fa9',30414,29504,'com.liferay.hello.world.web','2.0.3',NULL),('b87058e4-08f2-d881-5599-e0822c412183',30415,29504,'com.liferay.license.manager.web','2.0.3',NULL),('a2051edb-234d-3b72-ee46-6e85a8c88e6c',30416,29504,'com.liferay.login.authentication.facebook.connect.web','2.0.6','login-authentication-facebook-connect-web'),('d70adc78-f135-4957-b63c-ba451f6fe3b1',30417,29504,'com.liferay.login.authentication.google.web','2.0.3','login-authentication-google-web'),('f306deae-3bc0-a0a8-4273-40261d767d7b',30418,29504,'com.liferay.login.authentication.openid.web','2.0.3','login-authentication-openid-web'),('7f4b66ff-d1db-a3bd-0b76-e0443d3c8f86',30419,29504,'com.liferay.login.web','1.1.15',NULL),('56a1208e-5144-59fc-ba54-bf5d19438e20',30420,29504,'com.liferay.map.api','2.1.0',NULL),('5eadc01b-0c41-5959-a892-1218da43848c',30421,29504,'com.liferay.map.google.maps','1.0.9','map-google-maps'),('3d1b7d42-5738-ef47-e650-3ff9861ab2cc',30422,29504,'com.liferay.map.openstreetmap','2.0.4','map-openstreetmap'),('bbec8c2f-41a4-a65e-df63-be0b8cdce23e',30423,29504,'com.liferay.map.taglib','1.1.2','map-taglib'),('dc04288e-8a6d-6842-694c-a4ff9bae2752',30424,29504,'com.liferay.microsoft.translator','1.0.2',NULL),('70e0c2db-063c-beba-2c1c-b1de121b7d76',30425,29504,'com.liferay.mobile.device.rules.api','2.0.2',NULL),('ac96aacc-5ea7-a972-c75e-4df83f8c2787',30426,29504,'com.liferay.mobile.device.rules.service','1.2.16',NULL),('6b6a380c-7007-b78e-4fb4-0b7256b0ddf9',30427,29504,'com.liferay.mobile.device.rules.web','1.0.14','mobile-device-rules-web'),('efcbd49e-bd04-5bf0-daba-eb5944ac15ef',30428,29504,'com.liferay.monitoring.web','1.0.7','monitoring-web'),('cb4b32b3-3f42-56f4-22fc-a9c1a8696688',30429,29504,'com.liferay.my.account.web','1.0.7',NULL),('41f32f3a-f6fe-891e-1708-9b4f7010b22a',30430,29504,'com.liferay.password.policies.admin.impl','1.0.5',NULL),('c4bc2113-1303-6c23-083c-71cfde92a2b6',30431,29504,'com.liferay.password.policies.admin.web','1.0.14',NULL),('341677ea-6dda-d975-bfce-532b7e793061',30432,29504,'com.liferay.petra.content','1.0.2',NULL),('38093bb9-2d19-17dc-25f1-5af2ddf9ab69',30433,29504,'com.liferay.petra.doulos','3.5.1',NULL),('8677e332-6d00-8531-dd7b-0270e83893ef',30434,29504,'com.liferay.petra.encryptor','1.0.4',NULL),('de5e8e8f-bd57-ae16-e25c-c9f019cb7acf',30435,29504,'com.liferay.petra.io.delta','1.1.2',NULL),('a88707fe-35ea-168f-7c73-e9544624bd4e',30436,29504,'com.liferay.petra.log4j','1.0.4',NULL),('5c612595-42c0-b4a6-225b-8026d96be2e2',30437,29504,'com.liferay.petra.mail','1.1.1',NULL),('7f4165c0-3339-fd75-211f-f2bf71b80091',30438,29504,'com.liferay.petra.model.adapter','1.0.1',NULL),('5d7984c4-324f-e368-9645-f4a7f2314678',30439,29504,'com.liferay.plugins.admin.web','1.0.8',NULL),('6f776365-5e33-7049-5ee0-e72287d61dd2',30440,29504,'com.liferay.portal.background.task.service','2.0.16',NULL),('97ab772f-9f3d-e98f-e399-727abf1301f2',30441,29504,'com.liferay.portal.background.task.web','2.0.2',NULL),('4c1d53c6-1d32-cf4c-ca75-41e5aa15293a',30442,29504,'com.liferay.portal.cache','2.2.3',NULL),('95bcf547-a4ac-7edc-e4af-f209d405047e',30443,29504,'com.liferay.portal.cache.ehcache','2.1.7',NULL),('2247a9bc-c0d6-93a8-b307-11a474a3f82b',30444,29504,'com.liferay.portal.cache.ehcache.provider','2.0.2',NULL),('f5020ee8-4052-4080-99b1-56be7a1f248a',30445,29504,'com.liferay.portal.cache.multiple','1.0.8',NULL),('20af5e0b-cbbf-ae39-828a-b8824e1b7fb7',30446,29504,'com.liferay.portal.cache.single','2.0.2',NULL),('a3e83d53-a974-d653-e1c4-a8a45f2ca7dc',30447,29504,'com.liferay.portal.cluster.multiple','1.0.9',NULL),('7883de92-f354-be5b-1c6e-2059de5b6d60',30448,29504,'com.liferay.portal.cluster.single','2.0.2',NULL),('e62d4596-15e1-a7e7-43ea-157a166466d6',30449,29504,'com.liferay.portal.configuration.cluster','2.1.3',NULL),('0a80615a-7382-ea8d-be20-1c76a5ef271a',30450,29504,'com.liferay.portal.configuration.extender','2.0.11',NULL),('2c9eba9e-57c2-0265-3688-9b2225b51c4e',30451,29504,'com.liferay.portal.configuration.metatype.definitions.annotations','2.0.3',NULL),('7e8f1f7d-656c-08be-ea26-27a2bcbacad4',30452,29504,'com.liferay.portal.configuration.metatype.definitions.equinox','2.0.5',NULL),('10b7b27c-b6aa-18ad-781a-8305ef723393',30453,29504,'com.liferay.portal.configuration.module.configuration','2.0.8',NULL),('97594ed9-5d40-0a6f-c88a-1fb1b89b53d2',30454,29504,'com.liferay.portal.configuration.settings','2.0.10',NULL),('1d46ca3a-e5db-8808-22ff-a01ba11e21f0',30455,29504,'com.liferay.portal.custom.jsp.bag','1.0.1',NULL),('5ac2dc22-07b6-3dad-c821-36f312ea9ff0',30456,29504,'com.liferay.portal.dao.orm.custom.sql','1.0.7',NULL),('b19c5925-44f5-48ff-e4dd-e052428950cd',30457,29504,'com.liferay.portal.executor','2.0.2',NULL),('2578a156-43cd-fe86-b303-992272b60ec5',30458,29504,'com.liferay.portal.init.servlet.filter','2.0.4',NULL),('bda609a6-44c2-c347-44bb-a4dd1010bb1c',30459,29504,'com.liferay.portal.instance.lifecycle','3.1.0',NULL),('b6c961ac-52dc-94dd-60bb-e071b23de81e',30460,29504,'com.liferay.portal.instances.api','1.0.1',NULL),('e7bc7029-ab9f-f66e-7f46-8080e8c53a97',30461,29504,'com.liferay.portal.instances.service','1.0.3',NULL),('9c0e22a8-d2be-0e25-d88d-83564db3d408',30462,29504,'com.liferay.portal.instances.web','1.0.6',NULL),('ab7ddc88-4053-0fe8-eba6-8d811764c38e',30463,29504,'com.liferay.portal.jmx','3.0.3',NULL),('ff9280cc-5fb7-8569-8806-a58b62e84e0b',30464,29504,'com.liferay.portal.language.extender','2.0.3',NULL),('53fb1181-d0f6-703b-079c-534a171084cd',30465,29504,'com.liferay.portal.language.servlet.filter','2.0.3',NULL),('6b916592-4882-a4f4-dd17-22d602f1d0f4',30466,29504,'com.liferay.portal.license.deployer','1.0.4',NULL),('e70ce601-fa14-821b-aa15-00aaff7f2ce7',30467,29504,'com.liferay.portal.lock.api','2.1.0',NULL),('d5ad110d-ce58-f15e-ec97-ae916793f1e1',30468,29504,'com.liferay.portal.lock.service','2.0.13',NULL),('ede775a7-d311-436c-a5ca-e70eedb53024',30469,29504,'com.liferay.portal.messaging','3.0.6',NULL),('4d332082-a1b7-d9df-4aac-4e980a4d7c3f',30470,29504,'com.liferay.portal.mobile.device.recognition.api','1.0.2',NULL),('d1d0c9d6-0fd0-5b75-5415-762ff34f51a7',30471,29504,'com.liferay.portal.monitoring','4.0.21',NULL),('1e514c66-5ec5-d198-9a10-de3de2c7a283',30472,29504,'com.liferay.portal.output.stream.container','2.0.4',NULL),('29c29da8-6b1d-dfae-af28-189133e8e699',30473,29504,'com.liferay.portal.pop.notifications','2.0.3',NULL),('6841bc55-a49d-7a48-0651-355864e85db8',30474,29504,'com.liferay.portal.portlet.bridge.soy','3.0.5',NULL),('b05848f4-0d06-a280-82a9-1a05823eead1',30475,29504,'com.liferay.portal.remote.axis.extender','1.0.8',NULL),('8013e038-44f5-1de0-fea7-635b757580be',30476,29504,'com.liferay.portal.remote.cxf.common','3.0.2',NULL),('d699265d-9231-d10c-9b74-354c32d7c661',30477,29504,'com.liferay.portal.remote.cxf.jaxrs.common','3.1.1',NULL),('334c68fe-d161-8cbe-a2cc-ef61ff445bc7',30478,29504,'com.liferay.portal.remote.http.tunnel.extender','2.0.4',NULL),('8f205ca3-6456-3510-edcb-75f129aefbbc',30479,29504,'com.liferay.portal.remote.json.web.service.extender','2.0.5',NULL),('fb50a4da-26ef-754e-9293-572740b1ec4d',30480,29504,'com.liferay.portal.remote.rest.extender','2.0.7',NULL),('5d0108aa-e75c-79db-b33c-b3c246fb6f3f',30481,29504,'com.liferay.portal.remote.soap.extender','2.0.5',NULL),('21b6efd8-3009-ddf4-eaae-62f33e16fc02',30482,29504,'com.liferay.portal.scheduler','3.0.9',NULL),('7d736999-5c99-0834-98f1-34e8ff54a6d3',30483,29504,'com.liferay.portal.scheduler.multiple','1.0.9',NULL),('f8af420c-dc57-7bf3-e02c-a65f6109d426',30484,29504,'com.liferay.portal.scheduler.quartz','2.1.6',NULL),('c2cffc76-c7b2-d1a6-f7fa-546489aaca7d',30485,29504,'com.liferay.portal.scheduler.single','2.0.4',NULL),('a51b3203-6dd9-2fac-983c-86a3214f1cea',30486,29504,'com.liferay.portal.scripting.api','1.0.2',NULL),('7b7173fa-de9a-268f-ff0e-19f556c0b4a7',30487,29504,'com.liferay.portal.scripting.executor','2.1.1',NULL),('e700f0f6-b678-2504-d8e2-ca46b3fbc867',30488,29504,'com.liferay.portal.scripting.groovy','2.0.3',NULL),('b16b31b3-ce10-ede6-9852-e84b0b2c8532',30489,29504,'com.liferay.portal.search','3.6.2',NULL),('97e6821e-a0ca-fe9c-f726-e92738c0ec4d',30490,29504,'com.liferay.portal.search.elasticsearch','2.1.4',NULL),('f6edea16-398c-0bff-1707-4bfd9afcbeb6',30491,29504,'com.liferay.portal.search.facet','2.0.3',NULL),('0357e275-97e8-8e7b-dc1a-a4e03a15b148',30492,29504,'com.liferay.portal.search.web','1.1.19','portal-search-web'),('ea716c58-1bfe-78f1-08a7-d7ea3811a3ab',30493,29504,'com.liferay.portal.security.antisamy','2.0.10',NULL),('26a6c035-3781-d455-bfcb-c730c10e9087',30494,29504,'com.liferay.portal.security.audit.event.generators','1.0.3',NULL),('5a686438-b8ce-a91d-138a-e0db8c18de23',30495,29504,'com.liferay.portal.security.audit.router','1.0.7',NULL),('64bda749-c0a0-61d2-8d33-6675db344e26',30496,29504,'com.liferay.portal.security.audit.storage.api','1.0.2',NULL),('9bc4cc69-6515-7649-b396-1e3bb3e86793',30497,29504,'com.liferay.portal.security.audit.storage.service','1.0.9',NULL),('1009008b-d107-9d57-33ff-ca2b6adfc163',30498,29504,'com.liferay.portal.security.audit.web','1.0.6','portal-security-audit-web'),('36a51390-0514-8f4c-2b23-98ac6208790b',30499,29504,'com.liferay.portal.security.audit.wiring','2.0.4',NULL),('7f95df44-6d39-6d55-ed54-dc56d354795b',30500,29504,'com.liferay.portal.security.auth.verifier','2.1.0',NULL),('98d2f939-8a33-6e33-4b72-33bfbf7dcfce',30501,29504,'com.liferay.portal.security.auto.login','2.1.0',NULL),('b764a678-320c-6ecb-0b28-716a310c9f1c',30502,29504,'com.liferay.portal.security.ldap','2.1.13',NULL),('8cd0b3bd-01f4-6f57-4470-1ca67063923b',30503,29504,'com.liferay.portal.security.service.access.policy.api','2.0.4',NULL),('33eb4454-d2bd-6da6-1573-220b5e1dab52',30504,29504,'com.liferay.portal.security.service.access.policy.service','2.0.22',NULL),('c2a51e69-78d7-4fac-42a9-426af2172aaf',30505,29504,'com.liferay.portal.security.service.access.policy.web','1.0.8',NULL),('e57feacf-e075-92c5-a8d9-55a32430e8d1',30506,29504,'com.liferay.portal.security.sso.cas','3.0.10',NULL),('7711c8aa-fae8-757d-074c-a7bb49e56fa1',30507,29504,'com.liferay.portal.security.sso.facebook.connect','3.0.6',NULL),('12500823-96c7-a84f-ddc8-552f2b8a2dbe',30508,29504,'com.liferay.portal.security.sso.google','2.0.6',NULL),('216f1312-0a20-7b34-3f16-c2d00a7eb077',30509,29504,'com.liferay.portal.security.sso.ntlm','3.0.11',NULL),('d2bcf0b8-a202-85b0-4f87-18b8e3dce97b',30510,29504,'com.liferay.portal.security.sso.openid','3.0.5',NULL),('134f6a65-7608-b21e-5280-31a21973d575',30511,29504,'com.liferay.portal.security.sso.opensso','3.0.6',NULL),('84f24e48-74a3-256f-ecf1-92f8e348622b',30512,29504,'com.liferay.portal.security.sso.token','3.0.4',NULL),('14974ee7-3878-024d-014b-49c448708243',30513,29504,'com.liferay.portal.settings.api','2.0.2',NULL),('40e595e7-7b3b-f85d-27f7-2ad1a309c9b6',30514,29504,'com.liferay.portal.settings.authentication.cas.web','1.0.5','portal-settings-authentication-cas-web'),('3c92ccda-8128-9cae-adbb-a5b9250403a0',30515,29504,'com.liferay.portal.settings.authentication.facebook.connect.web','1.0.4','portal-settings-authentication-facebook-connect-web'),('d8dee164-a191-13a1-c868-9cd8182e3c78',30516,29504,'com.liferay.portal.settings.authentication.google.web','1.0.3','portal-settings-authentication-google-web'),('cab5959d-8a1d-f851-36b3-688db566c5b7',30517,29504,'com.liferay.portal.settings.authentication.ldap.web','1.0.9','portal-settings-authentication-ldap-web'),('8b74690a-3860-df8c-c284-bd9cfe92d6f2',30518,29504,'com.liferay.portal.settings.authentication.ntlm.web','1.0.4','portal-settings-authentication-ntlm-web'),('0f8ea527-70b2-7097-e8fb-5976821781d9',30519,29504,'com.liferay.portal.settings.authentication.openid.web','1.0.4','portal-settings-authentication-openid-web'),('197344f3-9bb0-ba4a-2d38-0200c49b3c82',30520,29504,'com.liferay.portal.settings.authentication.opensso.web','1.0.5','portal-settings-authentication-opensso-web'),('6e28bc07-7090-45a5-6b8c-70e63b1db40a',30521,29504,'com.liferay.portal.settings.lang','1.0.3',NULL),('de16b903-a687-9bee-dc8b-09b769a4321b',30522,29504,'com.liferay.portal.settings.web','1.1.7','portal-settings-web'),('b7956368-d5ba-f00f-9d0a-0e99a7af7b08',30523,29504,'com.liferay.portal.spring.extender','2.0.12',NULL),('6466d6e8-8af8-e9d1-c5d1-f7a3718a635e',30524,29504,'com.liferay.portal.store.cmis','2.0.7',NULL),('ffc07671-0c55-d185-e16b-7414aa729d8a',30525,29504,'com.liferay.portal.store.db','2.0.2',NULL),('b4ffcb25-1a17-029b-fc27-fe7f876ebad1',30526,29504,'com.liferay.portal.store.file.system','2.0.4',NULL),('565d7620-ccad-7992-25f7-1bb77805aaf0',30527,29504,'com.liferay.portal.store.ignore.duplicates.wrapper','1.0.1',NULL),('13645106-c96a-64f1-6c3b-c18e0f2f8e5f',30528,29504,'com.liferay.portal.store.jcr','2.0.6',NULL),('d7955145-3289-9a5d-ef3d-ec07a0657451',30529,29504,'com.liferay.portal.store.s3','2.0.8',NULL),('3882e15c-3517-e6b7-3cbb-d00c49ee081c',30530,29504,'com.liferay.portal.store.safe.file.name.wrapper','1.0.2',NULL),('994a0403-df6d-9d0d-76d1-de78b0a3a184',30531,29504,'com.liferay.portal.template.freemarker','2.0.22',NULL),('6e1dc8ae-7456-db26-7d88-7d199f907b58',30532,29504,'com.liferay.portal.template.soy','2.2.2',NULL),('ea30168b-04c8-c441-17ac-58de1960adb8',30533,29504,'com.liferay.portal.template.velocity','2.0.12',NULL),('e8c4dcb2-0980-8052-98fb-76b2943fdaa4',30534,29504,'com.liferay.portal.template.xsl','2.0.3',NULL),('d70ce797-797c-42f1-0524-fe6abb0f3fa1',30535,29504,'com.liferay.portal.upgrade','2.6.0',NULL),('e924b70e-8abd-4e06-b189-ab4f8d5ce654',30536,29504,'com.liferay.portal.verify.extender','2.1.3',NULL),('37e10e31-a14f-57b1-c417-7ef1293d15e7',30537,29504,'com.liferay.portal.weblogic.support','2.0.2',NULL),('c5416d80-798e-2424-24d7-ba5e513fc241',30538,29504,'com.liferay.roles.admin.impl','1.0.8',NULL),('3f61b548-47b1-9ea6-b4d5-fb9ea256d417',30539,29504,'com.liferay.roles.admin.web','1.0.22',NULL),('651b5063-26cc-eef2-4892-752f4d1d5fa2',30540,29504,'com.liferay.roles.selector.web','1.0.6',NULL),('b5499e00-b342-f861-6695-0573a46715de',30541,29504,'com.liferay.server.admin.web','1.0.17',NULL),('370c328b-6e20-9aeb-3acb-c260df448957',30542,29504,'com.liferay.user.groups.admin.impl','1.0.6',NULL),('ad0445d1-ceeb-b4eb-dabe-521d5feef7d3',30543,29504,'com.liferay.user.groups.admin.web','1.0.12',NULL),('1fb5ee8c-1f8e-8604-4bdf-0e3968225817',30544,29504,'com.liferay.users.admin.impl','1.0.6',NULL),('5ad01e22-9de0-2c1b-4d91-256f22a1fd21',30545,29504,'com.liferay.users.admin.web','2.2.1','users-admin-web'),('9dd4a0e7-08a7-c965-25b8-6cab95c496a4',30546,29504,'com.liferay.web.proxy.web','1.0.7','web-proxy-web'),('d7a01171-56a7-476e-8ed0-af978a978394',30547,29504,'com.liferay.websocket.whiteboard','1.0.1',NULL),('fba123a9-e019-9e57-d34c-23dcf8ab76a9',30548,29504,'com.liferay.xstream.configurator.api','2.1.0',NULL),('3bd3a063-d76b-d176-e2be-72df2f31c736',30549,29504,'javax.validation.api','1.1.0.Final',NULL),('951c988f-8a7d-4263-615d-4901ff0129bc',30550,29504,'woodstox-core-asl','4.4.1',NULL),('2ddccb0c-9e9f-0258-e9ff-7553430df603',30551,29504,'com.liferay.frontend.editor.lang','1.0.2',NULL),('296b2e16-c3fc-7d05-7fb1-867b30f10b9c',30552,29504,'com.liferay.frontend.taglib.util.freemarker.contributor','1.0.2',NULL),('51b6f9d2-c89a-7aae-7c91-bd5358852aaf',30553,29504,'com.liferay.password.policies.admin.api','2.0.1',NULL),('d2272f15-408c-ba9e-c959-64b776b83857',30554,29504,'com.liferay.petra.collection','1.0.2',NULL),('b714c3b3-7ad4-98b1-5285-c7e42843aa2c',30555,29504,'com.liferay.portal.background.task.api','2.1.0',NULL),('5d3d9f50-5828-ba36-0f2c-688c4e5c09fe',30556,29504,'com.liferay.portal.compound.session.id','2.0.1',NULL),('3d7158b1-1939-b061-cf1b-7fbbdea3762b',30557,29504,'com.liferay.portal.properties.swapper','1.0.1',NULL),('c6358d47-6a8f-1dc6-69a0-63c2a0919b5a',30558,29504,'com.liferay.portal.security.audit.api','2.0.1',NULL),('6f20d180-38cd-936d-089c-8535498c47ba',30559,29504,'com.liferay.portal.security.exportimport.api','2.0.1',NULL),('40081b6e-85e1-b5be-c21c-ee11d54d43f6',30560,29504,'com.liferay.roles.admin.api','2.0.1',NULL),('4ecbe8b8-71ff-b80a-88d6-ae0ffb941a17',30561,29504,'com.liferay.user.groups.admin.api','2.0.1',NULL),('d1a1ed2c-0683-94fc-1c1b-fc6614d69b9a',30562,29504,'com.liferay.users.admin.api','2.0.1',NULL),('a8e7fb88-193b-9f28-8ede-41fe4d7ed95c',30563,29504,'stax2-api','3.1.4',NULL),('409b8b9d-22ed-1bc8-a97a-7c58c69af887',30564,29504,'com.liferay.map.common','2.0.1','map-common'),('2c182c5a-81e5-0cbf-deaa-a6c2ff3c9fda',30565,29504,'Liferay Foundation-admin-theme-wrapper','1.0.23',NULL),('bcfb3777-b770-72ed-56b7-35a8ae4ec08a',30566,29504,'Liferay Foundation-classic-theme-wrapper','1.0.24',NULL),('30ed013c-b8af-331b-fc72-7f8fd99b2dbc',30567,29504,'Liferay Foundation-user-profile-theme-wrapper','1.0.23',NULL),('7c85e2e9-9dc2-9c1e-0af4-c7a4a63e4dc9',30568,29504,'Liferay Foundation-user-dashboard-theme-wrapper','1.0.2',NULL),('71401b47-39ca-1709-14bc-23289bfb0296',30569,29841,'com.liferay.sync.api','2.0.0',NULL),('8396490b-22e8-e6db-798a-40295f9a435f',30570,29841,'com.liferay.sync.oauth','1.0.1',NULL),('5f5db383-ca8d-ebfb-5813-58ce2c3c7354',30571,29841,'com.liferay.sync.security','2.0.3',NULL),('9d76805b-4279-5453-4f3e-0a0bbf53601e',30572,29841,'com.liferay.sync.service','1.1.1',NULL),('73855bab-f056-6c27-e02f-7449ef2d2b5c',30573,29841,'com.liferay.sync.web','1.0.3',NULL),('4c158c6d-2a61-6814-5d62-89adb4f50c84',30574,29785,'com.liferay.marketplace.api','4.1.0',NULL),('1c8e7f85-f63f-b286-8fa6-172b2b01ed4d',30575,29785,'com.liferay.marketplace.app.manager.web','1.0.10','marketplace-app-manager-web'),('692c4951-f165-8f26-4877-d3c71a0d5543',30576,29785,'com.liferay.marketplace.deployer','2.0.6',NULL),('4aa698f9-1eb0-5101-f9b7-e66911c99405',30577,29785,'com.liferay.marketplace.service','2.1.13',NULL),('fdcde6ba-2fd2-2c77-dda2-eb6cce0b72f8',30578,29785,'com.liferay.marketplace.store.web','2.0.5','marketplace-store-web'),('2d2b1d80-8f5a-998b-c223-47ded2217ae5',30579,29704,'com.liferay.announcements.web','1.1.8','announcements-web'),('11ce3e59-ea5c-c255-825c-6e375369d0ab',30580,29704,'com.liferay.blogs.editor.configuration','1.0.5',NULL),('71ecc16d-2725-47d8-525a-ebf066bf9d2f',30581,29704,'com.liferay.blogs.item.selector.api','1.0.4',NULL),('0a41d375-1a97-464a-7281-feb388235969',30582,29704,'com.liferay.blogs.item.selector.web','1.1.0','blogs-item-selector-web'),('a2768668-34ae-1e19-c68e-eef6f36be2db',30583,29704,'com.liferay.blogs.layout.prototype','2.0.4',NULL),('6c73c836-eef3-8baa-6c09-2d10cd2a90a6',30584,29704,'com.liferay.blogs.recent.bloggers.web','1.1.2','blogs-recent-bloggers-web'),('af2c535d-1caa-dde7-c0f9-ff7cc0c0a6f4',30585,29704,'com.liferay.blogs.service','1.1.3',NULL),('d783f785-d0a7-669b-eb4f-2711f07d1a54',30586,29704,'com.liferay.blogs.web','1.1.14','blogs-web'),('d9f9df4d-0ffb-b487-a0fb-0481b7d5d0b9',30587,29704,'com.liferay.bookmarks.api','2.0.3',NULL),('8e3674ee-3ae8-c6c5-2c36-9954fcd4f6f4',30588,29704,'com.liferay.bookmarks.service','1.1.12',NULL),('32aec79f-9ac4-7cb8-aef4-940b6fd27e87',30589,29704,'com.liferay.bookmarks.web','1.0.21','bookmarks-web'),('7fa31dee-af1c-6d4f-9a68-568ef564f64c',30590,29704,'com.liferay.comment.editor.configuration','1.0.2',NULL),('73b184a1-7580-1db0-d82f-0c8a25e95972',30591,29704,'com.liferay.comment.page.comments.web','1.0.3',NULL),('33e6457a-baf1-c6b4-6b99-2b30119c1b46',30592,29704,'com.liferay.comment.ratings.definition','2.0.2',NULL),('b766f5cd-661e-dd53-59c7-343582eaf8e1',30593,29704,'com.liferay.comment.sanitizer','2.0.3',NULL),('1140cc87-3970-9cef-3d97-b2489907441f',30594,29704,'com.liferay.comment.web','1.1.5','comment-web'),('75f39014-5e68-1b1a-7b80-c48c1ded4fa6',30595,29704,'com.liferay.directory.web','1.0.11',NULL),('6eeae3bd-a3b3-f22e-a281-1226ba2b582e',30596,29704,'com.liferay.document.library.api','3.2.1',NULL),('fa78b9c4-4f96-7317-9bb4-e377a9652f19',30597,29704,'com.liferay.document.library.item.selector.web','1.0.5','document-library-item-selector-web'),('d3a00143-4133-3979-9489-0629197acae1',30598,29704,'com.liferay.document.library.layout.set.prototype','2.0.4',NULL),('b255c187-e2b5-5954-bd30-dd66a9206e76',30599,29704,'com.liferay.document.library.repository.cmis.api','1.1.2',NULL),('ff195bc1-8701-6945-df1b-a9e104acc6eb',30600,29704,'com.liferay.document.library.repository.cmis.impl','2.0.17',NULL),('806e20cb-ef17-03fb-7d8e-b565c16dc0c8',30601,29704,'com.liferay.document.library.repository.search','2.0.4',NULL),('a5542685-307f-c3fa-aeac-a2e483f6693e',30602,29704,'com.liferay.document.library.service','1.1.21',NULL),('4065fe39-0993-2361-82ff-35d633024581',30603,29704,'com.liferay.document.library.web','1.3.12','document-library-web'),('0064e776-082c-0adc-14d0-f9c3a25bd1dd',30604,29704,'com.liferay.flags.api','2.0.2',NULL),('5584f5ad-f175-2eca-15b4-312d4f453abb',30605,29704,'com.liferay.flags.service','2.0.10',NULL),('2e0025a3-3180-09c6-cb23-bbba131bb72f',30606,29704,'com.liferay.flags.taglib','2.0.5','flags-taglib'),('962f7dd9-2305-a450-a395-157e6fe693fa',30607,29704,'com.liferay.flags.web','2.0.7','flags-web'),('2dad40b8-05d3-0213-5a69-7001a19dcf59',30608,29704,'com.liferay.image.uploader.web','1.0.12',NULL),('793b5189-fe30-5129-3178-99604a27d5a8',30609,29704,'com.liferay.invitation.invite.members.api','2.1.1',NULL),('9603b8b6-fa6b-40d2-b012-5ef469d86835',30610,29704,'com.liferay.invitation.invite.members.service','2.0.16',NULL),('309e6cee-400e-3426-d13c-5cbe4ad66c2c',30611,29704,'com.liferay.invitation.invite.members.web','1.0.12','invitation-invite-members-web'),('63969966-2b48-8200-e90e-f8379aaf657f',30612,29704,'com.liferay.item.selector.api','2.3.0',NULL),('92fc9912-8e53-fa8b-69a8-1b1a0627accb',30613,29704,'com.liferay.item.selector.criteria.api','2.1.0',NULL),('424fd01f-5138-b03a-7177-0bf9e7e04141',30614,29704,'com.liferay.item.selector.editor.configuration','2.0.3',NULL),('5224a8af-4062-8594-baaf-ebe5c58bac55',30615,29704,'com.liferay.item.selector.taglib','1.1.4','item-selector-taglib'),('44b243c7-7e85-0381-11f6-0b2307174350',30616,29704,'com.liferay.item.selector.upload.web','2.0.5','item-selector-upload-web'),('d90bdb7e-5e8b-a2f9-6621-c767158ef1f2',30617,29704,'com.liferay.item.selector.url.web','2.0.3','item-selector-url-web'),('12878b3e-cd99-f7ee-79ed-60b30e901e0a',30618,29704,'com.liferay.item.selector.web','2.1.3',NULL),('6eed2d89-4c3a-9657-efcd-7de3c7a2fbae',30619,29704,'com.liferay.mentions.api','2.1.0',NULL),('f8753536-15f4-f07a-0acf-7436da46eb2a',30620,29704,'com.liferay.mentions.service','2.0.10',NULL),('301eb530-7437-2ec7-7a49-a8494a69cbe2',30621,29704,'com.liferay.mentions.web','1.1.8','mentions-web'),('9a1750e8-4566-d473-2f85-10c2e6b5d14e',30622,29704,'com.liferay.message.boards.api','3.1.0',NULL),('b87f8a1e-8de4-77cf-7194-c75a69e69248',30623,29704,'com.liferay.message.boards.comment','2.0.9',NULL),('97f8c64f-9171-09aa-8ba8-987c8986742c',30624,29704,'com.liferay.message.boards.editor.configuration','1.0.2',NULL),('64feb4e0-a295-bc82-201d-b5d3e8e4e60a',30625,29704,'com.liferay.message.boards.layout.set.prototype','1.0.6',NULL),('954d0103-c1d5-62e8-a7eb-9a53f23bbc15',30626,29704,'com.liferay.message.boards.parser.bbcode','2.0.8',NULL),('50ce0e62-0424-5625-b833-2fb372ec552e',30627,29704,'com.liferay.message.boards.service','1.0.11',NULL),('87258a72-6c99-8d78-f66c-8450f40aea99',30628,29704,'com.liferay.message.boards.web','1.2.13','message-boards-web'),('f160b2c4-08d1-bcf2-a7c8-3ac8b4721425',30629,29704,'com.liferay.microblogs.api','2.1.1',NULL),('63829b3d-f070-bc5c-344e-7675cc3765c0',30630,29704,'com.liferay.microblogs.service','2.1.11',NULL),('7404e9a2-3be7-045b-e17f-f5ec6155edc6',30631,29704,'com.liferay.microblogs.web','2.0.14','microblogs-web'),('aaf95527-5cad-78af-0030-e106bec42749',30632,29704,'com.liferay.notifications.web','1.0.16','notifications-web'),('36046803-205f-a3f8-2d6d-bdde5e4bc165',30633,29704,'com.liferay.quick.note.web','2.0.2',NULL),('1da2833a-2650-7f7e-74de-9281312a0e29',30634,29704,'com.liferay.ratings.page.ratings.web','2.0.3',NULL),('f0f39069-82ba-6d18-dd11-535aa2bdb171',30635,29704,'com.liferay.ratings.service','1.0.5',NULL),('1390bf4b-24c1-98f0-6df9-76c468a9fbcb',30636,29704,'com.liferay.recent.documents.web','2.0.6',NULL),('72617a80-1a1c-0b07-3e0f-b77b594afef1',30637,29704,'com.liferay.social.activities.web','1.1.4','social-activities-web'),('35c4f7b4-15f6-f11c-8f4a-40ebd84058a9',30638,29704,'com.liferay.social.activity.web','2.0.3','social-activity-web'),('e7526b92-5f1f-3cc8-b2a1-02fd079f9487',30639,29704,'com.liferay.social.group.statistics.web','2.0.4','social-group-statistics-web'),('6cea7df2-db8f-1f0b-9828-67ff876c6436',30640,29704,'com.liferay.social.requests.web','1.0.4',NULL),('11a69387-fe93-6b8e-509a-3e8b420b15cb',30641,29704,'com.liferay.social.user.statistics.web','2.1.2','social-user-statistics-web'),('c1f04feb-b748-5640-3fde-3e8efa153fd0',30642,29704,'com.liferay.upload.api','1.0.1',NULL),('ee7c151e-072e-1358-73e8-94f9df219c40',30643,29704,'com.liferay.upload.web','1.0.1',NULL),('4e26b1dd-3413-0d34-853c-fca50ab40bf5',30644,29704,'com.liferay.wiki.api','2.2.6',NULL),('0b9065f6-b519-36c8-7476-13422a8f1234',30645,29704,'com.liferay.wiki.editor.configuration','1.0.8',NULL),('f8d8d189-9f58-c5d0-093a-f75e01e3fadd',30646,29704,'com.liferay.wiki.engine.creole','2.0.10','wiki-engine-creole'),('f7a4d667-3583-6b45-d6a4-6b3d565dcc24',30647,29704,'com.liferay.wiki.engine.html','2.0.4','wiki-engine-html'),('aa3a4f87-e75c-78d9-6516-7c84d4474d15',30648,29704,'com.liferay.wiki.engine.input.editor.common','2.0.3','wiki-engine-input-editor-common'),('79c74280-129b-379e-cf74-2b89b67f3b81',30649,29704,'com.liferay.wiki.engine.lang','1.0.1',NULL),('7ea33633-dd32-df9e-98d6-42753faee6a2',30650,29704,'com.liferay.wiki.engine.text','2.0.2','wiki-engine-text'),('3bec3931-1f32-37e0-31d8-c58f791057c7',30651,29704,'com.liferay.wiki.layout.prototype','1.0.6',NULL),('862f6b86-62af-be1d-45f0-ad6cd33a0717',30652,29704,'com.liferay.wiki.navigation.web','2.0.6','wiki-navigation-web'),('8c48999d-9afc-44c4-8dbb-a49d78d96cec',30653,29704,'com.liferay.wiki.service','1.5.3',NULL),('2a9abb1a-90d5-cf0f-52b5-b99a90107563',30654,29704,'com.liferay.wiki.web','2.1.27','wiki-web'),('6df09bb2-7198-22b1-4b64-492c810757ee',30655,29704,'com.liferay.blogs.api','3.0.1',NULL),('56cc2e21-42be-49f7-1ab2-ba3bdac66963',30656,29704,'com.liferay.comment.api','2.0.1',NULL),('54d28cab-ddc9-1657-4390-9a3db079bf1e',30657,29704,'com.liferay.ratings.api','2.0.1',NULL),('6121f5ea-2bc3-9bb2-90cd-642c83c12848',30658,29704,'com.liferay.social.activity.api','1.0.1',NULL),('7d5fd280-ea00-bd2e-f954-11fc54bdca31',30659,29791,'com.liferay.ip.geocoder.sample.web','2.0.2','ip-geocoder-sample-web'),('b6864e64-ee82-1082-865e-fafcd585ef5e',30660,29791,'com.liferay.ip.geocoder','2.0.5',NULL),('e507b964-0e1d-65a1-3f5b-2a074f349aff',30661,29791,'com.maxmind.geoip.api','1.2.14',NULL),('f37bcadb-9119-1828-a666-f345a6d369f7',30662,29791,'org.tukaani.xz','1.5.0',NULL),('1a5c46a1-f069-43e1-e3b1-ec40539d7d1f',30663,29837,'Liferay Connected Services Client-lcs-portlet-wrapper','7.0.10.11',NULL);
UNLOCK TABLES;

--
-- Table structure for table `MembershipRequest`
--

CREATE TABLE `MembershipRequest` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `membershipRequestId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `comments` longtext,
  `replyComments` longtext,
  `replyDate` datetime(6) DEFAULT NULL,
  `replierUserId` bigint(20) DEFAULT NULL,
  `statusId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`membershipRequestId`),
  KEY `IX_C28C72EC` (`groupId`,`statusId`),
  KEY `IX_35AA8FA6` (`groupId`,`userId`,`statusId`),
  KEY `IX_66D70879` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `MicroblogsEntry`
--

CREATE TABLE `MicroblogsEntry` (
  `microblogsEntryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `creatorClassNameId` bigint(20) DEFAULT NULL,
  `creatorClassPK` bigint(20) DEFAULT NULL,
  `content` longtext,
  `type_` int(11) DEFAULT NULL,
  `parentMicroblogsEntryId` bigint(20) DEFAULT NULL,
  `socialRelationType` int(11) DEFAULT NULL,
  PRIMARY KEY (`microblogsEntryId`),
  KEY `IX_1D8CE137` (`companyId`,`creatorClassNameId`,`creatorClassPK`,`type_`),
  KEY `IX_CA299EF2` (`companyId`,`creatorClassNameId`,`type_`),
  KEY `IX_14ACFA9` (`creatorClassNameId`,`creatorClassPK`,`type_`),
  KEY `IX_6AA6B164` (`creatorClassNameId`,`type_`),
  KEY `IX_6BD29B9C` (`type_`,`parentMicroblogsEntryId`),
  KEY `IX_8F04FC09` (`userId`,`createDate`,`type_`,`socialRelationType`),
  KEY `IX_92BA6F0` (`userId`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OAuth_OAuthApplication`
--

CREATE TABLE `OAuth_OAuthApplication` (
  `oAuthApplicationId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `consumerKey` varchar(75) DEFAULT NULL,
  `consumerSecret` varchar(75) DEFAULT NULL,
  `accessLevel` int(11) DEFAULT NULL,
  `logoId` bigint(20) DEFAULT NULL,
  `shareableAccessToken` tinyint(4) DEFAULT NULL,
  `callbackURI` longtext,
  `websiteURL` longtext,
  PRIMARY KEY (`oAuthApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayArchive`
--

CREATE TABLE `OSB_TestrayArchive` (
  `testrayArchiveId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `className` varchar(75) DEFAULT NULL,
  `compressedData` longblob,
  PRIMARY KEY (`testrayArchiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayAssignment`
--

CREATE TABLE `OSB_TestrayAssignment` (
  `testrayAssignmentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `assignedUserId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`testrayAssignmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayBuild`
--

CREATE TABLE `OSB_TestrayBuild` (
  `testrayBuildId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `templateTestrayBuildId` bigint(20) DEFAULT NULL,
  `testrayBuildTypeId` bigint(20) DEFAULT NULL,
  `testrayProductVersionId` bigint(20) DEFAULT NULL,
  `testrayProjectId` bigint(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  `template` tinyint(4) DEFAULT NULL,
  `dueDate` datetime(6) DEFAULT NULL,
  `githubCompareURLs` varchar(500) DEFAULT NULL,
  `promoted` tinyint(4) DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`testrayBuildId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayBuildMetric`
--

CREATE TABLE `OSB_TestrayBuildMetric` (
  `testrayBuildMetricId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayBuildId` bigint(20) DEFAULT NULL,
  `testrayCaseTypeId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`testrayBuildMetricId`),
  UNIQUE KEY `IX_57029B81` (`testrayBuildId`,`testrayCaseTypeId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayBuildType`
--

CREATE TABLE `OSB_TestrayBuildType` (
  `testrayBuildTypeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayProjectId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `autoanalyze` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`testrayBuildTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayBuilds_TestrayCases`
--

CREATE TABLE `OSB_TestrayBuilds_TestrayCases` (
  `companyId` bigint(20) NOT NULL,
  `testrayBuildId` bigint(20) NOT NULL,
  `testrayCaseId` bigint(20) NOT NULL,
  PRIMARY KEY (`testrayBuildId`,`testrayCaseId`),
  KEY `IX_B8573C94` (`companyId`),
  KEY `IX_20CBE2F9` (`testrayBuildId`),
  KEY `IX_D374433F` (`testrayCaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayCase`
--

CREATE TABLE `OSB_TestrayCase` (
  `testrayCaseId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayCaseTypeId` bigint(20) DEFAULT NULL,
  `testrayComponentId` bigint(20) DEFAULT NULL,
  `testrayProjectId` bigint(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  `originationKey` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `estimatedDuration` int(11) DEFAULT NULL,
  `steps` longtext,
  `caseNumber` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`testrayCaseId`),
  UNIQUE KEY `IX_E3EAF8FC` (`testrayProjectId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayCaseResult`
--

CREATE TABLE `OSB_TestrayCaseResult` (
  `testrayCaseResultId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `commentMBMessageId` bigint(20) DEFAULT NULL,
  `testrayBuildId` bigint(20) DEFAULT NULL,
  `testrayCaseId` bigint(20) DEFAULT NULL,
  `testrayComponentId` bigint(20) DEFAULT NULL,
  `testrayRunId` bigint(20) DEFAULT NULL,
  `assignedUserId` bigint(20) DEFAULT NULL,
  `startDate` datetime(6) DEFAULT NULL,
  `closedDate` datetime(6) DEFAULT NULL,
  `attachments` longtext,
  `errors` longtext,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`testrayCaseResultId`),
  KEY `IX_A700B728` (`createDate`),
  KEY `IX_A08EDB4F` (`testrayBuildId`),
  KEY `IX_21E5E829` (`testrayCaseId`),
  KEY `IX_E79A1BE0` (`testrayComponentId`,`testrayRunId`),
  KEY `IX_7631F5EC` (`testrayRunId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayCaseResultWarning`
--

CREATE TABLE `OSB_TestrayCaseResultWarning` (
  `testrayCaseResultWarningId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayCaseResultId` bigint(20) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`testrayCaseResultWarningId`),
  KEY `IX_F6B7D0B2` (`testrayCaseResultId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayCaseResults_TestrayIssues`
--

CREATE TABLE `OSB_TestrayCaseResults_TestrayIssues` (
  `companyId` bigint(20) NOT NULL,
  `testrayCaseResultId` bigint(20) NOT NULL,
  `testrayIssueId` bigint(20) NOT NULL,
  PRIMARY KEY (`testrayCaseResultId`,`testrayIssueId`),
  KEY `IX_49918CC0` (`companyId`),
  KEY `IX_7F6E24A8` (`testrayCaseResultId`),
  KEY `IX_711D8338` (`testrayIssueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayCaseType`
--

CREATE TABLE `OSB_TestrayCaseType` (
  `testrayCaseTypeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `testTypeLabel` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`testrayCaseTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayCases_TestrayComponents`
--

CREATE TABLE `OSB_TestrayCases_TestrayComponents` (
  `companyId` bigint(20) NOT NULL,
  `testrayCaseId` bigint(20) NOT NULL,
  `testrayComponentId` bigint(20) NOT NULL,
  PRIMARY KEY (`testrayCaseId`,`testrayComponentId`),
  KEY `IX_185D7EE7` (`companyId`),
  KEY `IX_671B2412` (`testrayCaseId`),
  KEY `IX_A0EBE615` (`testrayComponentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayComponent`
--

CREATE TABLE `OSB_TestrayComponent` (
  `testrayComponentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayProjectId` bigint(20) DEFAULT NULL,
  `testrayTeamId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `originationKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`testrayComponentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayFactor`
--

CREATE TABLE `OSB_TestrayFactor` (
  `testrayFactorId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `testrayFactorCategoryId` bigint(20) DEFAULT NULL,
  `testrayFactorCategoryName` varchar(75) DEFAULT NULL,
  `testrayFactorOptionId` bigint(20) DEFAULT NULL,
  `testrayFactorOptionName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`testrayFactorId`),
  KEY `IX_5E2C79A1` (`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayFactorCategory`
--

CREATE TABLE `OSB_TestrayFactorCategory` (
  `testrayFactorCategoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`testrayFactorCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayFactorOption`
--

CREATE TABLE `OSB_TestrayFactorOption` (
  `testrayFactorOptionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayFactorCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`testrayFactorOptionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayIssue`
--

CREATE TABLE `OSB_TestrayIssue` (
  `testrayIssueId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`testrayIssueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayProductVersion`
--

CREATE TABLE `OSB_TestrayProductVersion` (
  `testrayProductVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayProjectId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`testrayProductVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayProject`
--

CREATE TABLE `OSB_TestrayProject` (
  `testrayProjectId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`testrayProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayRun`
--

CREATE TABLE `OSB_TestrayRun` (
  `testrayRunId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayBuildId` bigint(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  `externalReferencePK` varchar(255) DEFAULT NULL,
  `externalReferenceType` int(11) DEFAULT NULL,
  `jenkinsJobKey` bigint(20) DEFAULT NULL,
  `number_` bigint(20) DEFAULT NULL,
  `environmentHash` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`testrayRunId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestraySubtask`
--

CREATE TABLE `OSB_TestraySubtask` (
  `testraySubtaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `commentMBMessageId` bigint(20) DEFAULT NULL,
  `mergedToTestraySubtaskId` bigint(20) DEFAULT NULL,
  `splitFromTestraySubtaskId` bigint(20) DEFAULT NULL,
  `testrayTaskId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`testraySubtaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestraySubtasks_TestrayCaseResults`
--

CREATE TABLE `OSB_TestraySubtasks_TestrayCaseResults` (
  `companyId` bigint(20) NOT NULL,
  `testrayCaseResultId` bigint(20) NOT NULL,
  `testraySubtaskId` bigint(20) NOT NULL,
  PRIMARY KEY (`testrayCaseResultId`,`testraySubtaskId`),
  KEY `IX_3F42321A` (`companyId`),
  KEY `IX_D8BB6182` (`testrayCaseResultId`),
  KEY `IX_78C8D50A` (`testraySubtaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestraySubtasks_TestrayIssues`
--

CREATE TABLE `OSB_TestraySubtasks_TestrayIssues` (
  `companyId` bigint(20) NOT NULL,
  `testrayIssueId` bigint(20) NOT NULL,
  `testraySubtaskId` bigint(20) NOT NULL,
  PRIMARY KEY (`testrayIssueId`,`testraySubtaskId`),
  KEY `IX_7DD2C30A` (`companyId`),
  KEY `IX_6174AB2E` (`testrayIssueId`),
  KEY `IX_C490561A` (`testraySubtaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestraySuite`
--

CREATE TABLE `OSB_TestraySuite` (
  `testraySuiteId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayProjectId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `caseParameters` longtext,
  PRIMARY KEY (`testraySuiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestraySuites_TestrayCases`
--

CREATE TABLE `OSB_TestraySuites_TestrayCases` (
  `companyId` bigint(20) NOT NULL,
  `testrayCaseId` bigint(20) NOT NULL,
  `testraySuiteId` bigint(20) NOT NULL,
  PRIMARY KEY (`testrayCaseId`,`testraySuiteId`),
  KEY `IX_FEDBA5CA` (`companyId`),
  KEY `IX_2952175` (`testrayCaseId`),
  KEY `IX_BC07070D` (`testraySuiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayTask`
--

CREATE TABLE `OSB_TestrayTask` (
  `testrayTaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayBuildId` bigint(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusUpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`testrayTaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayTasks_TestrayCaseTypes`
--

CREATE TABLE `OSB_TestrayTasks_TestrayCaseTypes` (
  `companyId` bigint(20) NOT NULL,
  `testrayCaseTypeId` bigint(20) NOT NULL,
  `testrayTaskId` bigint(20) NOT NULL,
  PRIMARY KEY (`testrayCaseTypeId`,`testrayTaskId`),
  KEY `IX_6CA79E29` (`companyId`),
  KEY `IX_9470ED2E` (`testrayCaseTypeId`),
  KEY `IX_25285A29` (`testrayTaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OSB_TestrayTeam`
--

CREATE TABLE `OSB_TestrayTeam` (
  `testrayTeamId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `testrayProjectId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`testrayTeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OrgGroupRole`
--

CREATE TABLE `OrgGroupRole` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `organizationId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`organizationId`,`groupId`,`roleId`),
  KEY `IX_4A527DD3` (`groupId`),
  KEY `IX_AB044D1C` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `OrgLabor`
--

CREATE TABLE `OrgLabor` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `orgLaborId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `organizationId` bigint(20) DEFAULT NULL,
  `typeId` bigint(20) DEFAULT NULL,
  `sunOpen` int(11) DEFAULT NULL,
  `sunClose` int(11) DEFAULT NULL,
  `monOpen` int(11) DEFAULT NULL,
  `monClose` int(11) DEFAULT NULL,
  `tueOpen` int(11) DEFAULT NULL,
  `tueClose` int(11) DEFAULT NULL,
  `wedOpen` int(11) DEFAULT NULL,
  `wedClose` int(11) DEFAULT NULL,
  `thuOpen` int(11) DEFAULT NULL,
  `thuClose` int(11) DEFAULT NULL,
  `friOpen` int(11) DEFAULT NULL,
  `friClose` int(11) DEFAULT NULL,
  `satOpen` int(11) DEFAULT NULL,
  `satClose` int(11) DEFAULT NULL,
  PRIMARY KEY (`orgLaborId`),
  KEY `IX_6AF0D434` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Organization_`
--

CREATE TABLE `Organization_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `organizationId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `parentOrganizationId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `recursable` tinyint(4) DEFAULT NULL,
  `regionId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `statusId` bigint(20) DEFAULT NULL,
  `comments` longtext,
  `logoId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`organizationId`),
  UNIQUE KEY `IX_E301BDF5` (`companyId`,`name`),
  KEY `IX_418E4522` (`companyId`,`parentOrganizationId`),
  KEY `IX_A9D85BA6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PasswordPolicy`
--

CREATE TABLE `PasswordPolicy` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `passwordPolicyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `defaultPolicy` tinyint(4) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `changeable` tinyint(4) DEFAULT NULL,
  `changeRequired` tinyint(4) DEFAULT NULL,
  `minAge` bigint(20) DEFAULT NULL,
  `checkSyntax` tinyint(4) DEFAULT NULL,
  `allowDictionaryWords` tinyint(4) DEFAULT NULL,
  `minAlphanumeric` int(11) DEFAULT NULL,
  `minLength` int(11) DEFAULT NULL,
  `minLowerCase` int(11) DEFAULT NULL,
  `minNumbers` int(11) DEFAULT NULL,
  `minSymbols` int(11) DEFAULT NULL,
  `minUpperCase` int(11) DEFAULT NULL,
  `regex` varchar(75) DEFAULT NULL,
  `history` tinyint(4) DEFAULT NULL,
  `historyCount` int(11) DEFAULT NULL,
  `expireable` tinyint(4) DEFAULT NULL,
  `maxAge` bigint(20) DEFAULT NULL,
  `warningTime` bigint(20) DEFAULT NULL,
  `graceLimit` int(11) DEFAULT NULL,
  `lockout` tinyint(4) DEFAULT NULL,
  `maxFailure` int(11) DEFAULT NULL,
  `lockoutDuration` bigint(20) DEFAULT NULL,
  `requireUnlock` tinyint(4) DEFAULT NULL,
  `resetFailureCount` bigint(20) DEFAULT NULL,
  `resetTicketMaxAge` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`passwordPolicyId`),
  UNIQUE KEY `IX_3FBFA9F4` (`companyId`,`name`),
  KEY `IX_2C1142E` (`companyId`,`defaultPolicy`),
  KEY `IX_E4D7EF87` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PasswordPolicy`
--

LOCK TABLES `PasswordPolicy` WRITE;
INSERT INTO `PasswordPolicy` VALUES (1,'4468df94-cb0f-748b-5b4a-99bad696cd42',20155,20116,20120,NULL,'2017-06-03 00:42:24.329000','2017-06-03 00:51:02.247000',1,'Default Password Policy','Default Password Policy',1,0,0,0,1,0,6,0,1,0,1,'(?=.{4})(?:[a-zA-Z0-9]*)',0,6,0,1209600,86400,0,0,3,0,1,600,86400);
UNLOCK TABLES;

--
-- Table structure for table `PasswordPolicyRel`
--

CREATE TABLE `PasswordPolicyRel` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `passwordPolicyRelId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `passwordPolicyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`passwordPolicyRelId`),
  UNIQUE KEY `IX_C3A17327` (`classNameId`,`classPK`),
  KEY `IX_CD25266E` (`passwordPolicyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PasswordTracker`
--

CREATE TABLE `PasswordTracker` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `passwordTrackerId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `password_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`passwordTrackerId`),
  KEY `IX_326F75BD` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Phone`
--

CREATE TABLE `Phone` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `phoneId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `typeId` bigint(20) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`phoneId`),
  KEY `IX_812CE07A` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_F202B9CE` (`userId`),
  KEY `IX_B271FA88` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PluginSetting`
--

CREATE TABLE `PluginSetting` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `pluginSettingId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `pluginId` varchar(75) DEFAULT NULL,
  `pluginType` varchar(75) DEFAULT NULL,
  `roles` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`pluginSettingId`),
  UNIQUE KEY `IX_7171B2E8` (`companyId`,`pluginId`,`pluginType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PollsChoice`
--

CREATE TABLE `PollsChoice` (
  `uuid_` varchar(75) DEFAULT NULL,
  `choiceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`choiceId`),
  UNIQUE KEY `IX_D76DD2CF` (`questionId`,`name`),
  UNIQUE KEY `IX_C222BD31` (`uuid_`,`groupId`),
  KEY `IX_8AE746EF` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PollsQuestion`
--

CREATE TABLE `PollsQuestion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `questionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `expirationDate` datetime(6) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `lastVoteDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  UNIQUE KEY `IX_F3C9F36` (`uuid_`,`groupId`),
  KEY `IX_9FF342EA` (`groupId`),
  KEY `IX_F910BBB4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PollsVote`
--

CREATE TABLE `PollsVote` (
  `uuid_` varchar(75) DEFAULT NULL,
  `voteId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `choiceId` bigint(20) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `voteDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`voteId`),
  UNIQUE KEY `IX_A88C673A` (`uuid_`,`groupId`),
  KEY `IX_D5DF7B54` (`choiceId`),
  KEY `IX_1BBFD4D3` (`questionId`,`userId`),
  KEY `IX_7D8E92B8` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PortalPreferences`
--

CREATE TABLE `PortalPreferences` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `portalPreferencesId` bigint(20) NOT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `preferences` longtext,
  PRIMARY KEY (`portalPreferencesId`),
  KEY `IX_D1F795F1` (`ownerId`,`ownerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortalPreferences`
--

LOCK TABLES `PortalPreferences` WRITE;
INSERT INTO `PortalPreferences` VALUES (0,20115,0,1,'<portlet-preferences />'),(0,20117,20116,1,'<portlet-preferences />'),(0,31237,20120,4,'<portlet-preferences />'),(8,31250,20156,4,'<portlet-preferences><preference><name>com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet#password-policies-order-by-col</name><value>name</value></preference><preference><name>com.liferay.portal.kernel.util.SessionClicks#com.liferay.application.list.PanelCategorypanel-manage-site_administration_navigation</name><value>open</value></preference><preference><name>com.liferay.portal.kernel.util.SessionClicks#passwordPoliciesAdminPasswordPolicyPasswordPanel</name><value>0</value></preference><preference><name>com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet#password-policies-order-by-type</name><value>asc</value></preference><preference><name>com.liferay.portal.kernel.util.SessionClicks#com.liferay.product.navigation.product.menu.web_productMenuState</name><value>open</value></preference><preference><name>com.liferay.portal.kernel.util.SessionClicks#com.liferay.product.navigation.control.menu.web_addPanelTab</name><value>applications</value></preference><preference><name>com.liferay.portal.kernel.util.SessionClicks#com.liferay.site.util_recentGroups</name><value>20143</value></preference><preference><name>com.liferay.portal.kernel.util.SessionClicks#password</name><value>0</value></preference></portlet-preferences>');
UNLOCK TABLES;

--
-- Table structure for table `Portlet`
--

CREATE TABLE `Portlet` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `id_` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `roles` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_12B5E51D` (`companyId`,`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Portlet`
--

LOCK TABLES `Portlet` WRITE;
INSERT INTO `Portlet` VALUES (0,31017,20116,'1_WAR_lcsportlet',NULL,1),(0,31047,20116,'com_liferay_comment_web_portlet_CommentPortlet',NULL,1),(0,31048,20116,'com_liferay_polls_web_portlet_PollsDisplayPortlet',NULL,1),(0,31049,20116,'com_liferay_polls_web_portlet_PollsPortlet',NULL,1),(0,31050,20116,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',NULL,1),(0,31051,20116,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',NULL,1),(0,31053,20116,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',NULL,1),(0,31054,20116,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',NULL,1),(0,31056,20116,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',NULL,1),(0,31057,20116,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',NULL,1),(0,31058,20116,'hello_soy_portlet',NULL,1),(0,31059,20116,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',NULL,1),(0,31060,20116,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',NULL,1),(0,31061,20116,'com_liferay_login_web_portlet_FastLoginPortlet',NULL,1),(0,31062,20116,'com_liferay_login_web_portlet_LoginPortlet',NULL,1),(0,31063,20116,'com_liferay_monitoring_web_portlet_MonitoringPortlet',NULL,1),(0,31064,20116,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet',NULL,1),(0,31065,20116,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet',NULL,1),(0,31066,20116,'com_liferay_server_admin_web_portlet_ServerAdminPortlet',NULL,1),(0,31067,20116,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',NULL,1),(0,31069,20116,'com_liferay_users_admin_web_portlet_UsersAdminPortlet',NULL,1),(0,31070,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',NULL,1),(0,31071,20116,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',NULL,1),(0,31072,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',NULL,1),(0,31073,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',NULL,1),(0,31074,20116,'com_liferay_iframe_web_portlet_IFramePortlet',NULL,1),(0,31075,20116,'com_liferay_rss_web_portlet_RSSPortlet',NULL,1),(0,31076,20116,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',NULL,1),(0,31077,20116,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',NULL,1),(0,31078,20116,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',NULL,1),(0,31079,20116,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',NULL,1),(0,31088,20116,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',NULL,1),(0,31089,20116,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',NULL,1),(0,31090,20116,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',NULL,1),(0,31091,20116,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',NULL,1),(0,31092,20116,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',NULL,1),(0,31093,20116,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',NULL,1),(0,31094,20116,'com_liferay_portal_search_web_portlet_SearchPortlet',NULL,1),(0,31095,20116,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet',NULL,1),(0,31096,20116,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',NULL,1),(0,31097,20116,'com_liferay_mentions_web_portlet_MentionsPortlet',NULL,1),(0,31098,20116,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet',NULL,1),(0,31099,20116,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',NULL,1),(0,31100,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',NULL,1),(0,31101,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',NULL,1),(0,31102,20116,'com_liferay_trash_web_portlet_TrashPortlet',NULL,1),(0,31103,20116,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet',NULL,1),(0,31104,20116,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',NULL,1),(0,31105,20116,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet',NULL,1),(0,31106,20116,'com_liferay_site_admin_web_portlet_SiteAdminPortlet',NULL,1),(0,31107,20116,'com_liferay_announcements_web_portlet_AlertsPortlet',NULL,1),(0,31108,20116,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet',NULL,1),(0,31109,20116,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',NULL,1),(0,31110,20116,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',NULL,1),(0,31111,20116,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',NULL,1),(0,31112,20116,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',NULL,1),(0,31113,20116,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',NULL,1),(0,31114,20116,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet',NULL,1),(0,31115,20116,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet',NULL,1),(0,31116,20116,'com_liferay_directory_web_portlet_DirectoryPortlet',NULL,1),(0,31117,20116,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet',NULL,1),(0,31118,20116,'com_liferay_flags_web_portlet_FlagsPortlet',NULL,1),(0,31119,20116,'com_liferay_flags_web_portlet_PageFlagsPortlet',NULL,1),(0,31120,20116,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',NULL,1),(0,31121,20116,'com_liferay_quick_note_web_portlet_QuickNotePortlet',NULL,1),(0,31122,20116,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',NULL,1),(0,31123,20116,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',NULL,1),(0,31124,20116,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',NULL,1),(0,31125,20116,'com_liferay_social_activity_web_portlet_SocialActivityPortlet',NULL,1),(0,31126,20116,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',NULL,1),(0,31127,20116,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',NULL,1),(0,31128,20116,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',NULL,1),(0,31129,20116,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',NULL,1),(0,31130,20116,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',NULL,1),(0,31132,20116,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet',NULL,1),(0,31133,20116,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',NULL,1),(0,31134,20116,'com_liferay_site_my_sites_web_portlet_MySitesPortlet',NULL,1),(0,31135,20116,'com_liferay_message_boards_web_portlet_MBAdminPortlet',NULL,1),(0,31136,20116,'com_liferay_message_boards_web_portlet_MBPortlet',NULL,1),(0,31137,20116,'com_liferay_document_library_web_portlet_DLAdminPortlet',NULL,1),(0,31138,20116,'com_liferay_document_library_web_portlet_DLPortlet',NULL,1),(0,31139,20116,'com_liferay_document_library_web_portlet_IGDisplayPortlet',NULL,1),(0,31140,20116,'com_liferay_wiki_web_portlet_WikiAdminPortlet',NULL,1),(0,31141,20116,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',NULL,1),(0,31142,20116,'com_liferay_wiki_web_portlet_WikiPortlet',NULL,1),(0,31168,20116,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',NULL,1),(0,31169,20116,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',NULL,1),(0,31170,20116,'com_liferay_blogs_web_portlet_BlogsPortlet',NULL,1),(0,31179,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',NULL,1),(0,31181,20116,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',NULL,1),(0,31182,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',NULL,1),(0,31183,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',NULL,1),(0,31184,20116,'com_liferay_calendar_web_portlet_CalendarPortlet',NULL,1),(0,31185,20116,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet',NULL,1),(0,31186,20116,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',NULL,1),(0,31187,20116,'com_liferay_contacts_web_portlet_MembersPortlet',NULL,1),(0,31188,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',NULL,1),(0,31189,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',NULL,1),(0,31190,20116,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',NULL,1),(0,31191,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',NULL,1),(0,31192,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',NULL,1),(0,31193,20116,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',NULL,1),(0,31194,20116,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',NULL,1),(0,31195,20116,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',NULL,1),(0,31219,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',NULL,1),(0,31220,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',NULL,1),(0,31221,20116,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',NULL,1),(0,31222,20116,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',NULL,1),(0,31223,20116,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',NULL,1),(0,31224,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',NULL,1),(0,31225,20116,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',NULL,1),(0,31226,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',NULL,1),(0,31227,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',NULL,1),(0,31228,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',NULL,1),(0,31229,20116,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',NULL,1),(0,31230,20116,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',NULL,1),(0,31232,20116,'com_liferay_journal_content_web_portlet_JournalContentPortlet',NULL,1),(0,31233,20116,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',NULL,1),(0,31234,20116,'com_liferay_journal_web_portlet_JournalPortlet',NULL,1),(0,31235,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',NULL,1),(0,31236,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `PortletItem`
--

CREATE TABLE `PortletItem` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `portletItemId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`portletItemId`),
  KEY `IX_96BDD537` (`groupId`,`classNameId`),
  KEY `IX_D699243F` (`groupId`,`name`,`portletId`,`classNameId`),
  KEY `IX_E922D6C0` (`groupId`,`portletId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `PortletPreferences`
--

CREATE TABLE `PortletPreferences` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `portletPreferencesId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `preferences` longtext,
  PRIMARY KEY (`portletPreferencesId`),
  UNIQUE KEY `IX_C7057FF7` (`ownerId`,`ownerType`,`plid`,`portletId`),
  KEY `IX_C9A3FCE2` (`ownerId`,`ownerType`,`portletId`),
  KEY `IX_D5EDA3A1` (`ownerType`,`plid`,`portletId`),
  KEY `IX_A3B2A80C` (`ownerType`,`portletId`),
  KEY `IX_D340DB76` (`plid`,`portletId`),
  KEY `IX_8E6DA3A1` (`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortletPreferences`
--

LOCK TABLES `PortletPreferences` WRITE;
INSERT INTO `PortletPreferences` VALUES (0,30103,20116,20116,1,0,'com.liferay.portal.security.sso.opensso','<portlet-preferences />'),(0,30105,20116,20116,1,0,'com.liferay.portal.security.sso.openid','<portlet-preferences />'),(0,30107,20116,20116,1,0,'com.liferay.portal.security.sso.google.authorization','<portlet-preferences><preference><name>clientId</name><value></value></preference><preference><name>clientSecret</name><value></value></preference></portlet-preferences>'),(0,30111,20116,20116,1,0,'com.liferay.portal.security.sso.ntlm','<portlet-preferences />'),(0,30113,20116,20116,1,0,'com.liferay.portal.security.sso.cas','<portlet-preferences><preference><name>serverURL</name><value>https://localhost:8443/cas-web/</value></preference><preference><name>serviceURL</name><value>https://localhost:8080</value></preference><preference><name>serverName</name><value>https://localhost:8080</value></preference></portlet-preferences>'),(0,30115,20116,20116,1,0,'com.liferay.portal.security.sso.facebook.connect','<portlet-preferences><preference><name>graphURL</name><value></value></preference><preference><name>oauthTokenURL</name><value></value></preference><preference><name>appId</name><value></value></preference><preference><name>oauthRedirectURL</name><value></value></preference><preference><name>oauthAuthURL</name><value></value></preference><preference><name>appSecret</name><value></value></preference></portlet-preferences>'),(9,31018,20116,0,1,0,'1_WAR_lcsportlet','<portlet-preferences><preference><name>uptimes-1f6c1e87914d70dd3b71c2fee552652c</name><value>[{&#34;startTime&#34;:&#34;1496450570745&#34;,&#34;endTime&#34;:&#34;1496451104935&#34;}]</value></preference></portlet-preferences>'),(1,31052,20116,20116,1,0,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet','<portlet-preferences><preference><name>myAccountAccessInControlPanelPermissionsInitialized</name><value>true</value></preference></portlet-preferences>'),(1,31055,20116,20116,1,0,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet','<portlet-preferences><preference><name>myAccountAccessInControlPanelPermissionsInitialized</name><value>true</value></preference></portlet-preferences>'),(1,31068,20116,20116,1,0,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet','<portlet-preferences><preference><name>myAccountAccessInControlPanelPermissionsInitialized</name><value>true</value></preference></portlet-preferences>'),(1,31087,20116,0,3,31084,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_ATudlnym75jV','<portlet-preferences><preference><name>showOnlyLayoutAssets</name><value>true</value></preference></portlet-preferences>'),(1,31131,20116,20116,1,0,'com_liferay_my_account_web_portlet_MyAccountPortlet','<portlet-preferences><preference><name>myAccountAccessInControlPanelPermissionsInitialized</name><value>true</value></preference></portlet-preferences>'),(1,31150,20116,0,3,31147,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet_INSTANCE_xAL6hxkynzkh','<portlet-preferences><preference><name>showAssetCount</name><value>true</value></preference><preference><name>classNameId</name><value>27602</value></preference></portlet-preferences>'),(1,31164,20116,0,3,31161,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_7MVRkUKVNXQL','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>portletSetupTitle_en_US</name><value>Recent Content</value></preference><preference><name>anyAssetType</name><value>false</value></preference></portlet-preferences>'),(1,31178,20116,0,3,31175,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet_INSTANCE_fRcO6Kh0xAsr','<portlet-preferences><preference><name>displayStyle</name><value>cloud</value></preference><preference><name>showAssetCount</name><value>true</value></preference><preference><name>maxAssetTags</name><value>10</value></preference><preference><name>showZeroAssetCount</name><value>false</value></preference><preference><name>classNameId</name><value>20011</value></preference></portlet-preferences>'),(1,31180,20116,20116,1,0,'com_liferay_notifications_web_portlet_NotificationsPortlet','<portlet-preferences><preference><name>myAccountAccessInControlPanelPermissionsInitialized</name><value>true</value></preference></portlet-preferences>'),(1,31209,20116,0,3,31206,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_INSTANCE_qKobDZX0fIeE','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>portletSetupTitle_en_US</name><value>Recent Content</value></preference></portlet-preferences>'),(1,31213,20116,0,3,31210,'com_liferay_document_library_web_portlet_DLPortlet_INSTANCE_DosAtw97wyP6','<portlet-preferences><preference><name>portletSetupPortletDecoratorId</name><value>borderless</value></preference></portlet-preferences>'),(1,31217,20116,0,3,31214,'com_liferay_rss_web_portlet_RSSPortlet_INSTANCE_5NoGbyyAOC0A','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>urls</name><value>http://www.nytimes.com/services/xml/rss/userland/Technology.xml</value></preference><preference><name>portletSetupTitle_en_US</name><value>Technology news</value></preference><preference><name>expandedEntriesPerFeed</name><value>3</value></preference></portlet-preferences>'),(1,31218,20116,0,3,31214,'com_liferay_rss_web_portlet_RSSPortlet_INSTANCE_jjW53y25JcWe','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>urls</name><value>https://www.liferay.com/about-us/newsroom/press-releases/-/asset_publisher/2oZC/rss</value></preference><preference><name>portletSetupTitle_en_US</name><value>Liferay news</value></preference><preference><name>expandedEntriesPerFeed</name><value>0</value></preference><preference><name>titles</name><value>Liferay Press Releases</value></preference></portlet-preferences>'),(1,31231,20116,20116,1,0,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet','<portlet-preferences><preference><name>myAccountAccessInControlPanelPermissionsInitialized</name><value>true</value></preference></portlet-preferences>'),(0,31238,20116,20143,3,0,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','<portlet-preferences />'),(0,31239,20116,0,3,20146,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','<portlet-preferences />'),(0,31240,20116,20143,3,0,'com_liferay_portal_search_web_portlet_SearchPortlet','<portlet-preferences><preference><name>portletSetupPortletDecoratorId</name><value>barebone</value></preference></portlet-preferences>'),(0,31241,20116,0,3,20146,'com_liferay_portal_search_web_portlet_SearchPortlet','<portlet-preferences><preference><name>portletSetupPortletDecoratorId</name><value>barebone</value></preference></portlet-preferences>'),(0,31242,20116,20143,3,0,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','<portlet-preferences><preference><name>portletSetupPortletDecoratorId</name><value>barebone</value></preference></portlet-preferences>'),(0,31243,20116,0,3,20146,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','<portlet-preferences><preference><name>portletSetupPortletDecoratorId</name><value>barebone</value></preference></portlet-preferences>'),(0,31251,20116,20143,3,0,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','<portlet-preferences />'),(0,31252,20116,0,3,20146,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','<portlet-preferences />'),(0,31264,20116,0,3,20146,'1_WAR_osbtestrayportlet','<portlet-preferences />'),(0,31265,20116,0,3,20137,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','<portlet-preferences />'),(0,31266,20116,0,3,20137,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','<portlet-preferences />'),(0,31267,20116,20133,3,0,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','<portlet-preferences />'),(0,31310,20116,0,3,20137,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet','<portlet-preferences />');
UNLOCK TABLES;

--
-- Table structure for table `QUARTZ_BLOB_TRIGGERS`
--

CREATE TABLE `QUARTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_CALENDARS`
--

CREATE TABLE `QUARTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` longblob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_CRON_TRIGGERS`
--

CREATE TABLE `QUARTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_FIRED_TRIGGERS`
--

CREATE TABLE `QUARTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` tinyint(4) DEFAULT NULL,
  `REQUESTS_RECOVERY` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IX_BE3835E5` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IX_4BD722BM` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IX_204D31E8` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IX_339E078M` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IX_5005E3AF` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_BC2F03B0` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_JOB_DETAILS`
--

CREATE TABLE `QUARTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` tinyint(4) NOT NULL,
  `IS_NONCONCURRENT` tinyint(4) NOT NULL,
  `IS_UPDATE_DATA` tinyint(4) NOT NULL,
  `REQUESTS_RECOVERY` tinyint(4) NOT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_88328984` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IX_779BCA37` (`SCHED_NAME`,`REQUESTS_RECOVERY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_LOCKS`
--

CREATE TABLE `QUARTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_PAUSED_TRIGGER_GRPS`
--

CREATE TABLE `QUARTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_SCHEDULER_STATE`
--

CREATE TABLE `QUARTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_SIMPLE_TRIGGERS`
--

CREATE TABLE `QUARTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_SIMPROP_TRIGGERS`
--

CREATE TABLE `QUARTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` tinyint(4) DEFAULT NULL,
  `BOOL_PROP_2` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `QUARTZ_TRIGGERS`
--

CREATE TABLE `QUARTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` int(11) DEFAULT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IX_186442A4` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IX_1BA1F9DC` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IX_91CA7CCE` (`SCHED_NAME`,`TRIGGER_GROUP`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`,`MISFIRE_INSTR`),
  KEY `IX_D219AFDE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IX_A85822A0` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_8AA50BE1` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IX_EEFE382A` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IX_F026CF4C` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IX_F2DD7C7E` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`,`MISFIRE_INSTR`),
  KEY `IX_1F92813C` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`MISFIRE_INSTR`),
  KEY `IX_99108B6E` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IX_CD7132D0` (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `RatingsEntry`
--

CREATE TABLE `RatingsEntry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_B47E3C11` (`userId`,`classNameId`,`classPK`),
  KEY `IX_A1A8CB8B` (`classNameId`,`classPK`,`score`),
  KEY `IX_9F242DF6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `RatingsStats`
--

CREATE TABLE `RatingsStats` (
  `statsId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `totalScore` double DEFAULT NULL,
  `averageScore` double DEFAULT NULL,
  PRIMARY KEY (`statsId`),
  UNIQUE KEY `IX_A6E99284` (`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `RecentLayoutBranch`
--

CREATE TABLE `RecentLayoutBranch` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `recentLayoutBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `layoutBranchId` bigint(20) DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`recentLayoutBranchId`),
  UNIQUE KEY `IX_C27D6369` (`userId`,`layoutSetBranchId`,`plid`),
  KEY `IX_B91F79BD` (`groupId`),
  KEY `IX_351E86E8` (`layoutBranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `RecentLayoutRevision`
--

CREATE TABLE `RecentLayoutRevision` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `recentLayoutRevisionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `layoutRevisionId` bigint(20) DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`recentLayoutRevisionId`),
  UNIQUE KEY `IX_4C600BD0` (`userId`,`layoutSetBranchId`,`plid`),
  KEY `IX_8D8A2724` (`groupId`),
  KEY `IX_DA0788DA` (`layoutRevisionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `RecentLayoutSetBranch`
--

CREATE TABLE `RecentLayoutSetBranch` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `recentLayoutSetBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `layoutSetId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`recentLayoutSetBranchId`),
  UNIQUE KEY `IX_4654D204` (`userId`,`layoutSetId`),
  KEY `IX_711995A5` (`groupId`),
  KEY `IX_23FF0700` (`layoutSetBranchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Region`
--

CREATE TABLE `Region` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `regionId` bigint(20) NOT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `regionCode` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`regionId`),
  UNIQUE KEY `IX_A2635F5C` (`countryId`,`regionCode`),
  KEY `IX_2D9A426F` (`active_`),
  KEY `IX_11FB3E42` (`countryId`,`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
INSERT INTO `Region` VALUES (0,1001,1,'AB','Alberta',1),(0,1002,1,'BC','British Columbia',1),(0,1003,1,'MB','Manitoba',1),(0,1004,1,'NB','New Brunswick',1),(0,1005,1,'NL','Newfoundland and Labrador',1),(0,1006,1,'NT','Northwest Territories',1),(0,1007,1,'NS','Nova Scotia',1),(0,1008,1,'NU','Nunavut',1),(0,1009,1,'ON','Ontario',1),(0,1010,1,'PE','Prince Edward Island',1),(0,1011,1,'QC','Quebec',1),(0,1012,1,'SK','Saskatchewan',1),(0,1013,1,'YT','Yukon',1),(0,2001,2,'CN-34','Anhui',1),(0,2002,2,'CN-92','Aomen',1),(0,2003,2,'CN-11','Beijing',1),(0,2004,2,'CN-50','Chongqing',1),(0,2005,2,'CN-35','Fujian',1),(0,2006,2,'CN-62','Gansu',1),(0,2007,2,'CN-44','Guangdong',1),(0,2008,2,'CN-45','Guangxi',1),(0,2009,2,'CN-52','Guizhou',1),(0,2010,2,'CN-46','Hainan',1),(0,2011,2,'CN-13','Hebei',1),(0,2012,2,'CN-23','Heilongjiang',1),(0,2013,2,'CN-41','Henan',1),(0,2014,2,'CN-42','Hubei',1),(0,2015,2,'CN-43','Hunan',1),(0,2016,2,'CN-32','Jiangsu',1),(0,2017,2,'CN-36','Jiangxi',1),(0,2018,2,'CN-22','Jilin',1),(0,2019,2,'CN-21','Liaoning',1),(0,2020,2,'CN-15','Nei Mongol',1),(0,2021,2,'CN-64','Ningxia',1),(0,2022,2,'CN-63','Qinghai',1),(0,2023,2,'CN-61','Shaanxi',1),(0,2024,2,'CN-37','Shandong',1),(0,2025,2,'CN-31','Shanghai',1),(0,2026,2,'CN-14','Shanxi',1),(0,2027,2,'CN-51','Sichuan',1),(0,2028,2,'CN-71','Taiwan',1),(0,2029,2,'CN-12','Tianjin',1),(0,2030,2,'CN-91','Xianggang',1),(0,2031,2,'CN-65','Xinjiang',1),(0,2032,2,'CN-54','Xizang',1),(0,2033,2,'CN-53','Yunnan',1),(0,2034,2,'CN-33','Zhejiang',1),(0,3001,3,'A','Alsace',1),(0,3002,3,'B','Aquitaine',1),(0,3003,3,'C','Auvergne',1),(0,3004,3,'P','Basse-Normandie',1),(0,3005,3,'D','Bourgogne',1),(0,3006,3,'E','Bretagne',1),(0,3007,3,'F','Centre',1),(0,3008,3,'G','Champagne-Ardenne',1),(0,3009,3,'H','Corse',1),(0,3010,3,'GF','Guyane',1),(0,3011,3,'I','Franche Comté',1),(0,3012,3,'GP','Guadeloupe',1),(0,3013,3,'Q','Haute-Normandie',1),(0,3014,3,'J','Île-de-France',1),(0,3015,3,'K','Languedoc-Roussillon',1),(0,3016,3,'L','Limousin',1),(0,3017,3,'M','Lorraine',1),(0,3018,3,'MQ','Martinique',1),(0,3019,3,'N','Midi-Pyrénées',1),(0,3020,3,'O','Nord Pas de Calais',1),(0,3021,3,'R','Pays de la Loire',1),(0,3022,3,'S','Picardie',1),(0,3023,3,'T','Poitou-Charentes',1),(0,3024,3,'U','Provence-Alpes-Côte-d\'Azur',1),(0,3025,3,'RE','Réunion',1),(0,3026,3,'V','Rhône-Alpes',1),(0,4001,4,'BW','Baden-Württemberg',1),(0,4002,4,'BY','Bayern',1),(0,4003,4,'BE','Berlin',1),(0,4004,4,'BB','Brandenburg',1),(0,4005,4,'HB','Bremen',1),(0,4006,4,'HH','Hamburg',1),(0,4007,4,'HE','Hessen',1),(0,4008,4,'MV','Mecklenburg-Vorpommern',1),(0,4009,4,'NI','Niedersachsen',1),(0,4010,4,'NW','Nordrhein-Westfalen',1),(0,4011,4,'RP','Rheinland-Pfalz',1),(0,4012,4,'SL','Saarland',1),(0,4013,4,'SN','Sachsen',1),(0,4014,4,'ST','Sachsen-Anhalt',1),(0,4015,4,'SH','Schleswig-Holstein',1),(0,4016,4,'TH','Thüringen',1),(0,8001,8,'AG','Agrigento',1),(0,8002,8,'AL','Alessandria',1),(0,8003,8,'AN','Ancona',1),(0,8004,8,'AO','Aosta',1),(0,8005,8,'AR','Arezzo',1),(0,8006,8,'AP','Ascoli Piceno',1),(0,8007,8,'AT','Asti',1),(0,8008,8,'AV','Avellino',1),(0,8009,8,'BA','Bari',1),(0,8010,8,'BT','Barletta-Andria-Trani',1),(0,8011,8,'BL','Belluno',1),(0,8012,8,'BN','Benevento',1),(0,8013,8,'BG','Bergamo',1),(0,8014,8,'BI','Biella',1),(0,8015,8,'BO','Bologna',1),(0,8016,8,'BZ','Bolzano',1),(0,8017,8,'BS','Brescia',1),(0,8018,8,'BR','Brindisi',1),(0,8019,8,'CA','Cagliari',1),(0,8020,8,'CL','Caltanissetta',1),(0,8021,8,'CB','Campobasso',1),(0,8022,8,'CI','Carbonia-Iglesias',1),(0,8023,8,'CE','Caserta',1),(0,8024,8,'CT','Catania',1),(0,8025,8,'CZ','Catanzaro',1),(0,8026,8,'CH','Chieti',1),(0,8027,8,'CO','Como',1),(0,8028,8,'CS','Cosenza',1),(0,8029,8,'CR','Cremona',1),(0,8030,8,'KR','Crotone',1),(0,8031,8,'CN','Cuneo',1),(0,8032,8,'EN','Enna',1),(0,8033,8,'FM','Fermo',1),(0,8034,8,'FE','Ferrara',1),(0,8035,8,'FI','Firenze',1),(0,8036,8,'FG','Foggia',1),(0,8037,8,'FC','Forli-Cesena',1),(0,8038,8,'FR','Frosinone',1),(0,8039,8,'GE','Genova',1),(0,8040,8,'GO','Gorizia',1),(0,8041,8,'GR','Grosseto',1),(0,8042,8,'IM','Imperia',1),(0,8043,8,'IS','Isernia',1),(0,8044,8,'AQ','L\'Aquila',1),(0,8045,8,'SP','La Spezia',1),(0,8046,8,'LT','Latina',1),(0,8047,8,'LE','Lecce',1),(0,8048,8,'LC','Lecco',1),(0,8049,8,'LI','Livorno',1),(0,8050,8,'LO','Lodi',1),(0,8051,8,'LU','Lucca',1),(0,8052,8,'MC','Macerata',1),(0,8053,8,'MN','Mantova',1),(0,8054,8,'MS','Massa-Carrara',1),(0,8055,8,'MT','Matera',1),(0,8056,8,'MA','Medio Campidano',1),(0,8057,8,'ME','Messina',1),(0,8058,8,'MI','Milano',1),(0,8059,8,'MO','Modena',1),(0,8060,8,'MB','Monza e Brianza',1),(0,8061,8,'NA','Napoli',1),(0,8062,8,'NO','Novara',1),(0,8063,8,'NU','Nuoro',1),(0,8064,8,'OG','Ogliastra',1),(0,8065,8,'OT','Olbia-Tempio',1),(0,8066,8,'OR','Oristano',1),(0,8067,8,'PD','Padova',1),(0,8068,8,'PA','Palermo',1),(0,8069,8,'PR','Parma',1),(0,8070,8,'PV','Pavia',1),(0,8071,8,'PG','Perugia',1),(0,8072,8,'PU','Pesaro e Urbino',1),(0,8073,8,'PE','Pescara',1),(0,8074,8,'PC','Piacenza',1),(0,8075,8,'PI','Pisa',1),(0,8076,8,'PT','Pistoia',1),(0,8077,8,'PN','Pordenone',1),(0,8078,8,'PZ','Potenza',1),(0,8079,8,'PO','Prato',1),(0,8080,8,'RG','Ragusa',1),(0,8081,8,'RA','Ravenna',1),(0,8082,8,'RC','Reggio Calabria',1),(0,8083,8,'RE','Reggio Emilia',1),(0,8084,8,'RI','Rieti',1),(0,8085,8,'RN','Rimini',1),(0,8086,8,'RM','Roma',1),(0,8087,8,'RO','Rovigo',1),(0,8088,8,'SA','Salerno',1),(0,8089,8,'SS','Sassari',1),(0,8090,8,'SV','Savona',1),(0,8091,8,'SI','Siena',1),(0,8092,8,'SR','Siracusa',1),(0,8093,8,'SO','Sondrio',1),(0,8094,8,'TA','Taranto',1),(0,8095,8,'TE','Teramo',1),(0,8096,8,'TR','Terni',1),(0,8097,8,'TO','Torino',1),(0,8098,8,'TP','Trapani',1),(0,8099,8,'TN','Trento',1),(0,8100,8,'TV','Treviso',1),(0,8101,8,'TS','Trieste',1),(0,8102,8,'UD','Udine',1),(0,8103,8,'VA','Varese',1),(0,8104,8,'VE','Venezia',1),(0,8105,8,'VB','Verbano-Cusio-Ossola',1),(0,8106,8,'VC','Vercelli',1),(0,8107,8,'VR','Verona',1),(0,8108,8,'VV','Vibo Valentia',1),(0,8109,8,'VI','Vicenza',1),(0,8110,8,'VT','Viterbo',1),(0,11001,11,'DR','Drenthe',1),(0,11002,11,'FL','Flevoland',1),(0,11003,11,'FR','Friesland',1),(0,11004,11,'GE','Gelderland',1),(0,11005,11,'GR','Groningen',1),(0,11006,11,'LI','Limburg',1),(0,11007,11,'NB','Noord-Brabant',1),(0,11008,11,'NH','Noord-Holland',1),(0,11009,11,'OV','Overijssel',1),(0,11010,11,'UT','Utrecht',1),(0,11011,11,'ZE','Zeeland',1),(0,11012,11,'ZH','Zuid-Holland',1),(0,15001,15,'AN','Andalusia',1),(0,15002,15,'AR','Aragon',1),(0,15003,15,'AS','Asturias',1),(0,15004,15,'IB','Balearic Islands',1),(0,15005,15,'PV','Basque Country',1),(0,15006,15,'CN','Canary Islands',1),(0,15007,15,'CB','Cantabria',1),(0,15008,15,'CL','Castile and Leon',1),(0,15009,15,'CM','Castile-La Mancha',1),(0,15010,15,'CT','Catalonia',1),(0,15011,15,'CE','Ceuta',1),(0,15012,15,'EX','Extremadura',1),(0,15013,15,'GA','Galicia',1),(0,15014,15,'LO','La Rioja',1),(0,15015,15,'M','Madrid',1),(0,15016,15,'ML','Melilla',1),(0,15017,15,'MU','Murcia',1),(0,15018,15,'NA','Navarra',1),(0,15019,15,'VC','Valencia',1),(0,19001,19,'AL','Alabama',1),(0,19002,19,'AK','Alaska',1),(0,19003,19,'AZ','Arizona',1),(0,19004,19,'AR','Arkansas',1),(0,19005,19,'CA','California',1),(0,19006,19,'CO','Colorado',1),(0,19007,19,'CT','Connecticut',1),(0,19008,19,'DC','District of Columbia',1),(0,19009,19,'DE','Delaware',1),(0,19010,19,'FL','Florida',1),(0,19011,19,'GA','Georgia',1),(0,19012,19,'HI','Hawaii',1),(0,19013,19,'ID','Idaho',1),(0,19014,19,'IL','Illinois',1),(0,19015,19,'IN','Indiana',1),(0,19016,19,'IA','Iowa',1),(0,19017,19,'KS','Kansas',1),(0,19018,19,'KY','Kentucky ',1),(0,19019,19,'LA','Louisiana ',1),(0,19020,19,'ME','Maine',1),(0,19021,19,'MD','Maryland',1),(0,19022,19,'MA','Massachusetts',1),(0,19023,19,'MI','Michigan',1),(0,19024,19,'MN','Minnesota',1),(0,19025,19,'MS','Mississippi',1),(0,19026,19,'MO','Missouri',1),(0,19027,19,'MT','Montana',1),(0,19028,19,'NE','Nebraska',1),(0,19029,19,'NV','Nevada',1),(0,19030,19,'NH','New Hampshire',1),(0,19031,19,'NJ','New Jersey',1),(0,19032,19,'NM','New Mexico',1),(0,19033,19,'NY','New York',1),(0,19034,19,'NC','North Carolina',1),(0,19035,19,'ND','North Dakota',1),(0,19036,19,'OH','Ohio',1),(0,19037,19,'OK','Oklahoma ',1),(0,19038,19,'OR','Oregon',1),(0,19039,19,'PA','Pennsylvania',1),(0,19040,19,'PR','Puerto Rico',1),(0,19041,19,'RI','Rhode Island',1),(0,19042,19,'SC','South Carolina',1),(0,19043,19,'SD','South Dakota',1),(0,19044,19,'TN','Tennessee',1),(0,19045,19,'TX','Texas',1),(0,19046,19,'UT','Utah',1),(0,19047,19,'VT','Vermont',1),(0,19048,19,'VA','Virginia',1),(0,19049,19,'WA','Washington',1),(0,19050,19,'WV','West Virginia',1),(0,19051,19,'WI','Wisconsin',1),(0,19052,19,'WY','Wyoming',1),(0,32001,32,'ACT','Australian Capital Territory',1),(0,32002,32,'NSW','New South Wales',1),(0,32003,32,'NT','Northern Territory',1),(0,32004,32,'QLD','Queensland',1),(0,32005,32,'SA','South Australia',1),(0,32006,32,'TAS','Tasmania',1),(0,32007,32,'VIC','Victoria',1),(0,32008,32,'WA','Western Australia',1),(0,33001,33,'AT-1','Burgenland',1),(0,33002,33,'AT-2','Kärnten',1),(0,33003,33,'AT-3','Niederösterreich',1),(0,33004,33,'AT-4','Oberösterreich',1),(0,33005,33,'AT-5','Salzburg',1),(0,33006,33,'AT-6','Steiermark',1),(0,33007,33,'AT-7','Tirol',1),(0,33008,33,'AT-8','Vorarlberg',1),(0,33009,33,'AT-9','Vienna',1),(0,144001,144,'MX-AGS','Aguascalientes',1),(0,144002,144,'MX-BCN','Baja California',1),(0,144003,144,'MX-BCS','Baja California Sur',1),(0,144004,144,'MX-CAM','Campeche',1),(0,144005,144,'MX-CHP','Chiapas',1),(0,144006,144,'MX-CHI','Chihuahua',1),(0,144007,144,'MX-COA','Coahuila',1),(0,144008,144,'MX-COL','Colima',1),(0,144009,144,'MX-DUR','Durango',1),(0,144010,144,'MX-GTO','Guanajuato',1),(0,144011,144,'MX-GRO','Guerrero',1),(0,144012,144,'MX-HGO','Hidalgo',1),(0,144013,144,'MX-JAL','Jalisco',1),(0,144014,144,'MX-MEX','Mexico',1),(0,144015,144,'MX-MIC','Michoacan',1),(0,144016,144,'MX-MOR','Morelos',1),(0,144017,144,'MX-NAY','Nayarit',1),(0,144018,144,'MX-NLE','Nuevo Leon',1),(0,144019,144,'MX-OAX','Oaxaca',1),(0,144020,144,'MX-PUE','Puebla',1),(0,144021,144,'MX-QRO','Queretaro',1),(0,144023,144,'MX-ROO','Quintana Roo',1),(0,144024,144,'MX-SLP','San Luis Potosí',1),(0,144025,144,'MX-SIN','Sinaloa',1),(0,144026,144,'MX-SON','Sonora',1),(0,144027,144,'MX-TAB','Tabasco',1),(0,144028,144,'MX-TAM','Tamaulipas',1),(0,144029,144,'MX-TLX','Tlaxcala',1),(0,144030,144,'MX-VER','Veracruz',1),(0,144031,144,'MX-YUC','Yucatan',1),(0,144032,144,'MX-ZAC','Zacatecas',1),(0,164001,164,'01','Østfold',1),(0,164002,164,'02','Akershus',1),(0,164003,164,'03','Oslo',1),(0,164004,164,'04','Hedmark',1),(0,164005,164,'05','Oppland',1),(0,164006,164,'06','Buskerud',1),(0,164007,164,'07','Vestfold',1),(0,164008,164,'08','Telemark',1),(0,164009,164,'09','Aust-Agder',1),(0,164010,164,'10','Vest-Agder',1),(0,164011,164,'11','Rogaland',1),(0,164012,164,'12','Hordaland',1),(0,164013,164,'14','Sogn og Fjordane',1),(0,164014,164,'15','Møre of Romsdal',1),(0,164015,164,'16','Sør-Trøndelag',1),(0,164016,164,'17','Nord-Trøndelag',1),(0,164017,164,'18','Nordland',1),(0,164018,164,'19','Troms',1),(0,164019,164,'20','Finnmark',1),(0,202001,202,'AG','Aargau',1),(0,202002,202,'AR','Appenzell Ausserrhoden',1),(0,202003,202,'AI','Appenzell Innerrhoden',1),(0,202004,202,'BL','Basel-Landschaft',1),(0,202005,202,'BS','Basel-Stadt',1),(0,202006,202,'BE','Bern',1),(0,202007,202,'FR','Fribourg',1),(0,202008,202,'GE','Geneva',1),(0,202009,202,'GL','Glarus',1),(0,202010,202,'GR','Graubünden',1),(0,202011,202,'JU','Jura',1),(0,202012,202,'LU','Lucerne',1),(0,202013,202,'NE','Neuchâtel',1),(0,202014,202,'NW','Nidwalden',1),(0,202015,202,'OW','Obwalden',1),(0,202016,202,'SH','Schaffhausen',1),(0,202017,202,'SZ','Schwyz',1),(0,202018,202,'SO','Solothurn',1),(0,202019,202,'SG','St. Gallen',1),(0,202020,202,'TG','Thurgau',1),(0,202021,202,'TI','Ticino',1),(0,202022,202,'UR','Uri',1),(0,202023,202,'VS','Valais',1),(0,202024,202,'VD','Vaud',1),(0,202025,202,'ZG','Zug',1),(0,202026,202,'ZH','Zürich',1);
UNLOCK TABLES;

--
-- Table structure for table `Release_`
--

CREATE TABLE `Release_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `releaseId` bigint(20) NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `servletContextName` varchar(75) DEFAULT NULL,
  `schemaVersion` varchar(75) DEFAULT NULL,
  `buildNumber` int(11) DEFAULT NULL,
  `buildDate` datetime(6) DEFAULT NULL,
  `verified` tinyint(4) DEFAULT NULL,
  `state_` int(11) DEFAULT NULL,
  `testString` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`releaseId`),
  UNIQUE KEY `IX_8BD6BCA7` (`servletContextName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Release_`
--

LOCK TABLES `Release_` WRITE;
INSERT INTO `Release_` VALUES (2,1,'2017-06-02 17:42:13.000000','2017-06-03 00:43:41.728000','portal','7.0.10',7010,'2016-06-15 00:00:00.000000',1,NULL,'You take the blue pill, the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill, you stay in Wonderland, and I show you how deep the rabbit hole goes.'),(1,20176,'2017-06-03 00:42:25.373000','2017-06-03 00:42:25.373000','com.liferay.announcements.web','1.0.3',0,NULL,0,0,NULL),(1,20201,'2017-06-03 00:42:25.392000','2017-06-03 00:42:25.392000','com.liferay.blogs.recent.bloggers.web','1.0.0',0,NULL,0,0,NULL),(1,20301,'2017-06-03 00:42:25.404000','2017-06-03 00:42:25.404000','com.liferay.bookmarks.web','1.0.0',0,NULL,0,0,NULL),(1,20401,'2017-06-03 00:42:25.420000','2017-06-03 00:42:25.420000','com.liferay.comment.page.comments.web','1.0.0',0,NULL,0,0,NULL),(1,20501,'2017-06-03 00:42:25.432000','2017-06-03 00:42:25.432000','com.liferay.directory.web','1.0.1',0,NULL,0,0,NULL),(2,20601,'2017-06-03 00:42:25.449000','2017-06-03 00:44:26.404000','com.liferay.document.library.service','1.0.0',0,NULL,1,0,NULL),(1,20701,'2017-06-03 00:42:25.461000','2017-06-03 00:42:25.462000','com.liferay.flags.web','1.0.0',0,NULL,0,0,NULL),(1,20801,'2017-06-03 00:42:25.475000','2017-06-03 00:42:25.476000','com.liferay.image.uploader.web','1.0.0',0,NULL,0,0,NULL),(1,20901,'2017-06-03 00:42:25.487000','2017-06-03 00:42:25.488000','com.liferay.item.selector.web','1.0.0',0,NULL,0,0,NULL),(2,21001,'2017-06-03 00:42:25.500000','2017-06-03 00:42:25.523000','com.liferay.microblogs.web','1.0.1',0,NULL,0,0,NULL),(1,21101,'2017-06-03 00:42:25.534000','2017-06-03 00:42:25.534000','com.liferay.quick.note.web','1.0.0',0,NULL,0,0,NULL),(1,21201,'2017-06-03 00:42:25.549000','2017-06-03 00:42:25.549000','com.liferay.ratings.page.ratings.web','1.0.0',0,NULL,0,0,NULL),(1,21301,'2017-06-03 00:42:25.561000','2017-06-03 00:42:25.561000','com.liferay.recent.documents.web','1.0.1',0,NULL,0,0,NULL),(1,21401,'2017-06-03 00:42:25.575000','2017-06-03 00:42:25.575000','com.liferay.social.activities.web','1.0.0',0,NULL,0,0,NULL),(1,21501,'2017-06-03 00:42:25.589000','2017-06-03 00:42:25.589000','com.liferay.social.activity.web','1.0.0',0,NULL,0,0,NULL),(1,21601,'2017-06-03 00:42:25.603000','2017-06-03 00:42:25.604000','com.liferay.social.group.statistics.web','1.0.0',0,NULL,0,0,NULL),(1,21701,'2017-06-03 00:42:25.615000','2017-06-03 00:42:25.615000','com.liferay.social.requests.web','1.0.0',0,NULL,0,0,NULL),(1,21801,'2017-06-03 00:42:25.625000','2017-06-03 00:42:25.626000','com.liferay.social.user.statistics.web','1.0.0',0,NULL,0,0,NULL),(2,21901,'2017-06-03 00:42:25.640000','2017-06-03 00:42:25.657000','com.liferay.calendar.web','1.0.1',0,NULL,0,0,NULL),(1,22101,'2017-06-03 00:42:25.671000','2017-06-03 00:42:25.671000','com.liferay.dynamic.data.mapping.web','1.0.0',0,NULL,0,0,NULL),(1,22201,'2017-06-03 00:42:25.685000','2017-06-03 00:42:25.685000','com.liferay.portal.workflow.kaleo.designer.web','1.0.0',0,NULL,0,0,NULL),(2,22301,'2017-06-03 00:42:25.695000','2017-06-03 00:42:25.715000','com.liferay.portal.workflow.kaleo.forms.web','1.0.3',0,NULL,0,0,NULL),(2,22401,'2017-06-03 00:42:25.727000','2017-06-03 00:42:25.745000','com.liferay.contacts.web','1.0.1',0,NULL,0,0,NULL),(1,22501,'2017-06-03 00:42:25.756000','2017-06-03 00:42:25.757000','com.liferay.hello.velocity.web','1.0.0',0,NULL,0,0,NULL),(1,22601,'2017-06-03 00:42:25.772000','2017-06-03 00:42:25.772000','com.liferay.hello.world.web','1.0.0',0,NULL,0,0,NULL),(1,22701,'2017-06-03 00:42:25.784000','2017-06-03 00:42:25.784000','com.liferay.license.manager.web','1.0.0',0,NULL,0,0,NULL),(1,22801,'2017-06-03 00:42:25.795000','2017-06-03 00:42:25.795000','com.liferay.login.web','1.0.0',0,NULL,0,0,NULL),(1,22901,'2017-06-03 00:42:25.804000','2017-06-03 00:42:25.804000','com.liferay.mobile.device.rules.web','1.0.0',0,NULL,0,0,NULL),(1,23001,'2017-06-03 00:42:25.816000','2017-06-03 00:42:25.816000','com.liferay.monitoring.web','1.0.0',0,NULL,0,0,NULL),(1,23101,'2017-06-03 00:42:25.824000','2017-06-03 00:42:25.825000','com.liferay.my.account.web','1.0.0',0,NULL,0,0,NULL),(1,23201,'2017-06-03 00:42:25.835000','2017-06-03 00:42:25.835000','com.liferay.plugins.admin.web','1.0.0',0,NULL,0,0,NULL),(1,23301,'2017-06-03 00:42:25.846000','2017-06-03 00:42:25.846000','com.liferay.portal.instances.web','1.0.0',0,NULL,0,0,NULL),(1,23401,'2017-06-03 00:42:25.856000','2017-06-03 00:42:25.856000','com.liferay.portal.scheduler.quartz','1.0.0',0,NULL,0,0,NULL),(1,23501,'2017-06-03 00:42:26.140000','2017-06-03 00:42:26.140000','com.liferay.portal.search.web','1.0.0',0,NULL,0,0,NULL),(1,23601,'2017-06-03 00:42:26.151000','2017-06-03 00:42:26.152000','com.liferay.portal.settings.web','1.0.0',0,NULL,0,0,NULL),(1,23701,'2017-06-03 00:42:26.162000','2017-06-03 00:42:26.162000','com.liferay.server.admin.web','1.0.0',0,NULL,0,0,NULL),(1,23801,'2017-06-03 00:42:26.171000','2017-06-03 00:42:26.171000','com.liferay.web.proxy.web','1.0.0',0,NULL,0,0,NULL),(1,23901,'2017-06-03 00:42:26.186000','2017-06-03 00:42:26.186000','com.liferay.asset.browser.web','1.0.0',0,NULL,0,0,NULL),(1,24001,'2017-06-03 00:42:26.195000','2017-06-03 00:42:26.196000','com.liferay.asset.categories.navigation.web','1.0.0',0,NULL,0,0,NULL),(1,24101,'2017-06-03 00:42:26.205000','2017-06-03 00:42:26.205000','com.liferay.asset.display.web','1.0.0',0,NULL,0,0,NULL),(1,24201,'2017-06-03 00:42:26.215000','2017-06-03 00:42:26.215000','com.liferay.asset.tags.compiler.web','1.0.0',0,NULL,0,0,NULL),(1,24301,'2017-06-03 00:42:26.224000','2017-06-03 00:42:26.224000','com.liferay.asset.tags.navigation.web','1.0.0',0,NULL,0,0,NULL),(1,24401,'2017-06-03 00:42:26.234000','2017-06-03 00:42:26.234000','com.liferay.exportimport.web','1.0.0',0,NULL,0,0,NULL),(1,24501,'2017-06-03 00:42:26.245000','2017-06-03 00:42:26.245000','com.liferay.iframe.web','1.0.0',0,NULL,0,0,NULL),(1,24601,'2017-06-03 00:42:26.254000','2017-06-03 00:42:26.254000','com.liferay.journal.content.search.web','1.0.1',0,NULL,0,0,NULL),(1,24701,'2017-06-03 00:42:26.264000','2017-06-03 00:42:26.264000','com.liferay.journal.content.web','1.0.0',0,NULL,0,0,NULL),(1,24801,'2017-06-03 00:42:26.273000','2017-06-03 00:42:26.273000','com.liferay.journal.web','1.0.0',0,NULL,0,0,NULL),(1,24901,'2017-06-03 00:42:26.282000','2017-06-03 00:42:26.283000','com.liferay.nested.portlets.web','1.0.0',0,NULL,0,0,NULL),(1,25001,'2017-06-03 00:42:26.292000','2017-06-03 00:42:26.292000','com.liferay.portlet.configuration.css.web','1.0.0',0,NULL,0,0,NULL),(1,25101,'2017-06-03 00:42:26.305000','2017-06-03 00:42:26.305000','com.liferay.portlet.configuration.sharing.web','1.0.0',0,NULL,0,0,NULL),(1,25201,'2017-06-03 00:42:26.315000','2017-06-03 00:42:26.315000','com.liferay.portlet.configuration.web','1.0.0',0,NULL,0,0,NULL),(1,25301,'2017-06-03 00:42:26.332000','2017-06-03 00:42:26.332000','com.liferay.product.navigation.product.menu.web','1.0.0',0,NULL,0,0,NULL),(1,25401,'2017-06-03 00:42:26.342000','2017-06-03 00:42:26.342000','com.liferay.rss.web','1.0.0',0,NULL,0,0,NULL),(1,25501,'2017-06-03 00:42:26.350000','2017-06-03 00:42:26.350000','com.liferay.site.browser.web','1.0.0',0,NULL,0,0,NULL),(1,25601,'2017-06-03 00:42:26.359000','2017-06-03 00:42:26.359000','com.liferay.site.my.sites.web','1.0.0',0,NULL,0,0,NULL),(1,25701,'2017-06-03 00:42:26.372000','2017-06-03 00:42:26.372000','com.liferay.site.navigation.breadcrumb.web','1.0.0',0,NULL,0,0,NULL),(1,25801,'2017-06-03 00:42:26.385000','2017-06-03 00:42:26.385000','com.liferay.site.navigation.directory.web','1.0.0',0,NULL,0,0,NULL),(1,25901,'2017-06-03 00:42:26.395000','2017-06-03 00:42:26.395000','com.liferay.site.navigation.language.web','1.0.0',0,NULL,0,0,NULL),(1,26001,'2017-06-03 00:42:26.405000','2017-06-03 00:42:26.405000','com.liferay.site.navigation.menu.web','1.0.0',0,NULL,0,0,NULL),(1,26101,'2017-06-03 00:42:26.414000','2017-06-03 00:42:26.414000','com.liferay.site.navigation.site.map.web','1.0.0',0,NULL,0,0,NULL),(1,26201,'2017-06-03 00:42:26.425000','2017-06-03 00:42:26.425000','com.liferay.staging.bar.web','1.0.0',0,NULL,0,0,NULL),(1,26301,'2017-06-03 00:42:26.439000','2017-06-03 00:42:26.439000','com.liferay.trash.web','1.0.0',0,NULL,0,0,NULL),(1,26401,'2017-06-03 00:42:26.448000','2017-06-03 00:42:26.448000','com.liferay.xsl.content.web','1.0.0',0,NULL,0,0,NULL),(1,26501,'2017-06-03 00:42:26.458000','2017-06-03 00:42:26.458000','com.liferay.message.boards.web','1.0.0',0,NULL,0,0,NULL),(1,26601,'2017-06-03 00:42:26.473000','2017-06-03 00:42:26.473000','com.liferay.document.library.web','1.0.0',0,NULL,0,0,NULL),(1,26701,'2017-06-03 00:42:26.490000','2017-06-03 00:42:26.490000','com.liferay.wiki.web','1.0.0',0,NULL,0,0,NULL),(1,26801,'2017-06-03 00:42:26.506000','2017-06-03 00:42:26.506000','com.liferay.blogs.web','1.0.0',0,NULL,0,0,NULL),(1,26901,'2017-06-03 00:42:26.522000','2017-06-03 00:42:26.522000','com.liferay.dynamic.data.lists.web','1.0.0',0,NULL,0,0,NULL),(1,27001,'2017-06-03 00:42:26.531000','2017-06-03 00:42:26.532000','com.liferay.notifications.web','2.1.0',0,NULL,0,0,NULL),(2,27101,'2017-06-03 00:42:26.705000','2017-06-03 00:44:22.771000','com.liferay.bookmarks.service','1.0.0',0,NULL,1,0,NULL),(1,27204,'2017-06-03 00:42:27.329000','2017-06-03 00:42:27.329000','com.liferay.flags.service','2.0.1',0,NULL,0,0,NULL),(1,27302,'2017-06-03 00:42:27.501000','2017-06-03 00:42:27.501000','com.liferay.invitation.invite.members.service','1.0.1',0,NULL,0,0,NULL),(1,27403,'2017-06-03 00:42:27.770000','2017-06-03 00:42:27.770000','com.liferay.microblogs.service','1.0.2',0,NULL,0,0,NULL),(2,27503,'2017-06-03 00:42:28.281000','2017-06-03 00:44:19.085000','com.liferay.wiki.service','1.0.0',0,NULL,1,0,NULL),(1,27605,'2017-06-03 00:42:29.159000','2017-06-03 00:42:29.159000','com.liferay.calendar.service','1.0.5',0,NULL,0,0,NULL),(1,27706,'2017-06-03 00:42:30.520000','2017-06-03 00:42:30.520000','com.liferay.dynamic.data.lists.service','1.0.0',0,NULL,0,0,NULL),(2,27801,'2017-06-03 00:42:31.086000','2017-06-03 00:44:26.029000','com.liferay.dynamic.data.mapping.service','1.0.1',0,NULL,1,0,NULL),(2,27901,'2017-06-03 00:42:31.233000','2017-06-03 00:44:20.039000','com.liferay.polls.service','1.0.4',0,NULL,1,0,NULL),(1,28005,'2017-06-03 00:42:31.691000','2017-06-03 00:42:31.691000','com.liferay.portal.workflow.kaleo.designer.service','1.0.1',0,NULL,0,0,NULL),(1,28103,'2017-06-03 00:42:32.016000','2017-06-03 00:42:32.016000','com.liferay.portal.workflow.kaleo.forms.service','1.1.0',0,NULL,0,0,NULL),(1,28201,'2017-06-03 00:42:32.029000','2017-06-03 00:42:32.029000','com.liferay.portal.workflow.kaleo.runtime.impl','2.0.3',0,NULL,0,0,NULL),(1,28301,'2017-06-03 00:42:32.732000','2017-06-03 00:42:32.733000','com.liferay.portal.workflow.kaleo.service','1.3.2',0,NULL,0,0,NULL),(1,28418,'2017-06-03 00:42:33.869000','2017-06-03 00:42:33.869000','com.liferay.contacts.service','2.0.1',0,NULL,0,0,NULL),(2,28503,'2017-06-03 00:42:34.268000','2017-06-03 00:44:22.289000','com.liferay.mobile.device.rules.service','1.0.0',0,NULL,1,0,NULL),(1,28606,'2017-06-03 00:42:34.889000','2017-06-03 00:42:34.889000','com.liferay.portal.background.task.service','1.0.0',0,NULL,0,0,NULL),(1,28703,'2017-06-03 00:42:35.069000','2017-06-03 00:42:35.069000','com.liferay.exportimport.service','1.0.0',0,NULL,0,0,NULL),(1,28801,'2017-06-03 00:42:35.095000','2017-06-03 00:42:35.096000','com.liferay.portal.instances.service','1.0.0',0,NULL,0,0,NULL),(1,28902,'2017-06-03 00:42:35.256000','2017-06-03 00:42:35.256000','com.liferay.portal.lock.service','1.0.0',0,NULL,0,0,NULL),(1,29049,'2017-06-03 00:42:38.176000','2017-06-03 00:42:38.176000','com.liferay.asset.publisher.web','1.0.0',0,NULL,0,0,NULL),(1,29210,'2017-06-03 00:42:39.933000','2017-06-03 00:42:39.933000','com.liferay.portal.security.audit.storage.service','1.0.0',0,NULL,0,0,NULL),(2,29303,'2017-06-03 00:42:40.114000','2017-06-03 00:44:27.574000','com.liferay.portal.security.service.access.policy.service','2.0.13',0,NULL,1,0,NULL),(1,29406,'2017-06-03 00:42:40.456000','2017-06-03 00:42:40.456000','com.liferay.marketplace.service','2.0.0',0,NULL,0,0,NULL),(0,30101,'2017-06-03 00:44:15.906000','2017-06-03 00:44:15.906000','com.liferay.portal.scheduler.internal.verify',NULL,0,NULL,1,0,NULL),(0,30102,'2017-06-03 00:44:15.973000','2017-06-03 00:44:15.973000','com.liferay.portal.security.sso.opensso',NULL,0,NULL,1,0,NULL),(0,30104,'2017-06-03 00:44:15.997000','2017-06-03 00:44:15.997000','com.liferay.portal.security.sso.openid',NULL,0,NULL,1,0,NULL),(0,30106,'2017-06-03 00:44:16.018000','2017-06-03 00:44:16.018000','com.liferay.portal.security.sso.google',NULL,0,NULL,1,0,NULL),(0,30108,'2017-06-03 00:44:16.033000','2017-06-03 00:44:16.033000','com.liferay.portal.security.sso.token.shibboleth',NULL,0,NULL,1,0,NULL),(0,30109,'2017-06-03 00:44:16.045000','2017-06-03 00:44:16.045000','com.liferay.portal.security.sso.token.siteminder',NULL,0,NULL,1,0,NULL),(0,30110,'2017-06-03 00:44:16.065000','2017-06-03 00:44:16.065000','com.liferay.portal.security.sso.ntlm',NULL,0,NULL,1,0,NULL),(0,30112,'2017-06-03 00:44:16.083000','2017-06-03 00:44:16.083000','com.liferay.portal.security.sso.cas',NULL,0,NULL,1,0,NULL),(0,30114,'2017-06-03 00:44:16.103000','2017-06-03 00:44:16.103000','com.liferay.portal.security.sso.facebook.connect',NULL,0,NULL,1,0,NULL),(0,30116,'2017-06-03 00:44:16.113000','2017-06-03 00:44:16.113000','com.liferay.portal.security.ldap',NULL,0,NULL,1,0,NULL),(1,30664,'2017-06-03 00:44:30.086000','2017-06-03 00:44:30.086000','com.liferay.sync.service','1.0.3',0,NULL,0,0,NULL),(2,30705,'2017-06-03 00:44:33.165000','2017-06-03 00:44:34.135000','com.liferay.journal.service','1.0.0',0,NULL,1,0,NULL),(2,30814,'2017-06-03 00:44:33.919000','2017-06-03 00:44:33.932000','com.liferay.layout.admin.web','1.0.1',0,NULL,0,0,NULL),(1,30901,'2017-06-03 00:44:34.205000','2017-06-03 00:44:34.205000','com.liferay.wiki.navigation.web','1.0.1',0,NULL,0,0,NULL),(1,31016,'2017-06-03 00:44:44.720000','2017-06-03 00:44:44.721000','lcs-portlet',NULL,300,NULL,1,0,NULL),(1,31046,'2017-06-03 00:44:54.298000','2017-06-03 00:44:54.298000','osb-testray-portlet',NULL,620,NULL,1,0,NULL);
UNLOCK TABLES;

--
-- Table structure for table `Repository`
--

CREATE TABLE `Repository` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `repositoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `portletId` varchar(200) DEFAULT NULL,
  `typeSettings` longtext,
  `dlFolderId` bigint(20) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`repositoryId`),
  UNIQUE KEY `IX_60C8634C` (`groupId`,`name`,`portletId`),
  UNIQUE KEY `IX_11641E26` (`uuid_`,`groupId`),
  KEY `IX_F543EA4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `RepositoryEntry`
--

CREATE TABLE `RepositoryEntry` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `repositoryEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `mappedId` varchar(255) DEFAULT NULL,
  `manualCheckInRequired` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`repositoryEntryId`),
  UNIQUE KEY `IX_9BDCF489` (`repositoryId`,`mappedId`),
  UNIQUE KEY `IX_354AA664` (`uuid_`,`groupId`),
  KEY `IX_D3B9AF62` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ResourceAction`
--

CREATE TABLE `ResourceAction` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `resourceActionId` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actionId` varchar(75) DEFAULT NULL,
  `bitwiseValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceActionId`),
  UNIQUE KEY `IX_EDB9986E` (`name`,`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ResourceAction`
--

LOCK TABLES `ResourceAction` WRITE;
INSERT INTO `ResourceAction` VALUES (0,1,'com.liferay.message.boards.kernel.model.MBThread','PERMISSIONS',2),(0,2,'com.liferay.message.boards.kernel.model.MBThread','SUBSCRIBE',4),(0,3,'com.liferay.message.boards.kernel.model.MBThread','VIEW',1),(0,4,'com.liferay.blogs','ADD_ENTRY',2),(0,5,'com.liferay.blogs','PERMISSIONS',4),(0,6,'com.liferay.blogs','SUBSCRIBE',8),(0,7,'com.liferay.message.boards.kernel.model.MBCategory','DELETE',2),(0,8,'com.liferay.message.boards.kernel.model.MBCategory','PERMISSIONS',4),(0,9,'com.liferay.message.boards.kernel.model.MBCategory','ADD_FILE',8),(0,10,'com.liferay.message.boards.kernel.model.MBCategory','REPLY_TO_MESSAGE',16),(0,11,'com.liferay.message.boards.kernel.model.MBCategory','LOCK_THREAD',32),(0,12,'com.liferay.message.boards.kernel.model.MBCategory','UPDATE',64),(0,13,'com.liferay.message.boards.kernel.model.MBCategory','SUBSCRIBE',128),(0,14,'com.liferay.message.boards.kernel.model.MBCategory','VIEW',1),(0,15,'com.liferay.message.boards.kernel.model.MBCategory','ADD_MESSAGE',256),(0,16,'com.liferay.message.boards.kernel.model.MBCategory','MOVE_THREAD',512),(0,17,'com.liferay.message.boards.kernel.model.MBCategory','ADD_SUBCATEGORY',1024),(0,18,'com.liferay.message.boards.kernel.model.MBCategory','UPDATE_THREAD_PRIORITY',2048),(0,19,'com.liferay.asset.tags','PERMISSIONS',2),(0,20,'com.liferay.asset.tags','ADD_TAG',4),(0,21,'com.liferay.document.library','PERMISSIONS',2),(0,22,'com.liferay.document.library','ADD_REPOSITORY',4),(0,23,'com.liferay.document.library','ADD_DOCUMENT_TYPE',8),(0,24,'com.liferay.document.library','ADD_SHORTCUT',16),(0,25,'com.liferay.document.library','UPDATE',32),(0,26,'com.liferay.document.library','ADD_DOCUMENT',64),(0,27,'com.liferay.document.library','SUBSCRIBE',128),(0,28,'com.liferay.document.library','VIEW',1),(0,29,'com.liferay.document.library','ADD_FOLDER',256),(0,30,'com.liferay.document.library','ADD_STRUCTURE',512),(0,31,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure','DELETE',2),(0,32,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure','PERMISSIONS',4),(0,33,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure','UPDATE',8),(0,34,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure','VIEW',1),(0,35,'com.liferay.blogs.kernel.model.BlogsEntry','UPDATE_DISCUSSION',2),(0,36,'com.liferay.blogs.kernel.model.BlogsEntry','DELETE',4),(0,37,'com.liferay.blogs.kernel.model.BlogsEntry','PERMISSIONS',8),(0,38,'com.liferay.blogs.kernel.model.BlogsEntry','DELETE_DISCUSSION',16),(0,39,'com.liferay.blogs.kernel.model.BlogsEntry','UPDATE',32),(0,40,'com.liferay.blogs.kernel.model.BlogsEntry','VIEW',1),(0,41,'com.liferay.blogs.kernel.model.BlogsEntry','ADD_DISCUSSION',64),(0,42,'com.liferay.announcements.kernel.model.AnnouncementsEntry','DELETE',2),(0,43,'com.liferay.announcements.kernel.model.AnnouncementsEntry','PERMISSIONS',4),(0,44,'com.liferay.announcements.kernel.model.AnnouncementsEntry','UPDATE',8),(0,45,'com.liferay.announcements.kernel.model.AnnouncementsEntry','VIEW',1),(0,46,'com.liferay.portal.kernel.model.LayoutPrototype','DELETE',2),(0,47,'com.liferay.portal.kernel.model.LayoutPrototype','PERMISSIONS',4),(0,48,'com.liferay.portal.kernel.model.LayoutPrototype','UPDATE',8),(0,49,'com.liferay.portal.kernel.model.LayoutPrototype','VIEW',1),(0,50,'com.liferay.asset.categories','PERMISSIONS',2),(0,51,'com.liferay.asset.categories','ADD_CATEGORY',4),(0,52,'com.liferay.asset.categories','ADD_VOCABULARY',8),(0,53,'com.liferay.portal.kernel.model.Group','PERMISSIONS',2),(0,54,'com.liferay.portal.kernel.model.Group','VIEW_MEMBERS',4),(0,55,'com.liferay.portal.kernel.model.Group','MANAGE_ANNOUNCEMENTS',8),(0,56,'com.liferay.portal.kernel.model.Group','PUBLISH_STAGING',16),(0,57,'com.liferay.portal.kernel.model.Group','VIEW',1),(0,58,'com.liferay.portal.kernel.model.Group','EXPORT_IMPORT_LAYOUTS',32),(0,59,'com.liferay.portal.kernel.model.Group','ASSIGN_USER_ROLES',64),(0,60,'com.liferay.portal.kernel.model.Group','DELETE',128),(0,61,'com.liferay.portal.kernel.model.Group','VIEW_SITE_ADMINISTRATION',256),(0,62,'com.liferay.portal.kernel.model.Group','ASSIGN_MEMBERS',512),(0,63,'com.liferay.portal.kernel.model.Group','MANAGE_LAYOUTS',1024),(0,64,'com.liferay.portal.kernel.model.Group','MANAGE_ARCHIVED_SETUPS',2048),(0,65,'com.liferay.portal.kernel.model.Group','ADD_COMMUNITY',4096),(0,66,'com.liferay.portal.kernel.model.Group','UPDATE',8192),(0,67,'com.liferay.portal.kernel.model.Group','PUBLISH_PORTLET_INFO',16384),(0,68,'com.liferay.portal.kernel.model.Group','ADD_LAYOUT_SET_BRANCH',32768),(0,69,'com.liferay.portal.kernel.model.Group','PREVIEW_IN_DEVICE',65536),(0,70,'com.liferay.portal.kernel.model.Group','MANAGE_TEAMS',131072),(0,71,'com.liferay.portal.kernel.model.Group','ADD_LAYOUT',262144),(0,72,'com.liferay.portal.kernel.model.Group','ADD_LAYOUT_BRANCH',524288),(0,73,'com.liferay.portal.kernel.model.Group','MANAGE_SUBGROUPS',1048576),(0,74,'com.liferay.portal.kernel.model.Group','VIEW_STAGING',2097152),(0,75,'com.liferay.portal.kernel.model.Group','EXPORT_IMPORT_PORTLET_INFO',4194304),(0,76,'com.liferay.portal.kernel.model.Group','CONFIGURE_PORTLETS',8388608),(0,77,'com.liferay.portal.kernel.model.Group','MANAGE_STAGING',16777216),(0,78,'com.liferay.portal.kernel.model.LayoutSetPrototype','DELETE',2),(0,79,'com.liferay.portal.kernel.model.LayoutSetPrototype','PERMISSIONS',4),(0,80,'com.liferay.portal.kernel.model.LayoutSetPrototype','UPDATE',8),(0,81,'com.liferay.portal.kernel.model.LayoutSetPrototype','VIEW',1),(0,82,'com.liferay.portal.kernel.model.Organization','ASSIGN_USER_ROLES',2),(0,83,'com.liferay.portal.kernel.model.Organization','DELETE',4),(0,84,'com.liferay.portal.kernel.model.Organization','MANAGE_SUBORGANIZATIONS',8),(0,85,'com.liferay.portal.kernel.model.Organization','PERMISSIONS',16),(0,86,'com.liferay.portal.kernel.model.Organization','ASSIGN_MEMBERS',32),(0,87,'com.liferay.portal.kernel.model.Organization','VIEW_MEMBERS',64),(0,88,'com.liferay.portal.kernel.model.Organization','MANAGE_ANNOUNCEMENTS',128),(0,89,'com.liferay.portal.kernel.model.Organization','UPDATE',256),(0,90,'com.liferay.portal.kernel.model.Organization','MANAGE_USERS',512),(0,91,'com.liferay.portal.kernel.model.Organization','VIEW',1),(0,92,'com.liferay.portal.kernel.model.Organization','ADD_ORGANIZATION',1024),(0,93,'com.liferay.portal.kernel.model.LayoutBranch','DELETE',2),(0,94,'com.liferay.portal.kernel.model.LayoutBranch','PERMISSIONS',4),(0,95,'com.liferay.portal.kernel.model.LayoutBranch','UPDATE',8),(0,96,'com.liferay.portal.kernel.model.Role','DELETE',2),(0,97,'com.liferay.portal.kernel.model.Role','PERMISSIONS',4),(0,98,'com.liferay.portal.kernel.model.Role','DEFINE_PERMISSIONS',8),(0,99,'com.liferay.portal.kernel.model.Role','ASSIGN_MEMBERS',16),(0,100,'com.liferay.portal.kernel.model.Role','MANAGE_ANNOUNCEMENTS',32),(0,101,'com.liferay.portal.kernel.model.Role','UPDATE',64),(0,102,'com.liferay.portal.kernel.model.Role','VIEW',1),(0,103,'com.liferay.document.library.kernel.model.DLFileEntry','UPDATE_DISCUSSION',2),(0,104,'com.liferay.document.library.kernel.model.DLFileEntry','DELETE',4),(0,105,'com.liferay.document.library.kernel.model.DLFileEntry','OVERRIDE_CHECKOUT',8),(0,106,'com.liferay.document.library.kernel.model.DLFileEntry','PERMISSIONS',16),(0,107,'com.liferay.document.library.kernel.model.DLFileEntry','DELETE_DISCUSSION',32),(0,108,'com.liferay.document.library.kernel.model.DLFileEntry','UPDATE',64),(0,109,'com.liferay.document.library.kernel.model.DLFileEntry','VIEW',1),(0,110,'com.liferay.document.library.kernel.model.DLFileEntry','ADD_DISCUSSION',128),(0,111,'com.liferay.portal.kernel.model.User','DELETE',2),(0,112,'com.liferay.portal.kernel.model.User','PERMISSIONS',4),(0,113,'com.liferay.portal.kernel.model.User','IMPERSONATE',8),(0,114,'com.liferay.portal.kernel.model.User','UPDATE',16),(0,115,'com.liferay.portal.kernel.model.User','VIEW',1),(0,116,'com.liferay.portal.kernel.model.UserGroup','DELETE',2),(0,117,'com.liferay.portal.kernel.model.UserGroup','PERMISSIONS',4),(0,118,'com.liferay.portal.kernel.model.UserGroup','ASSIGN_MEMBERS',8),(0,119,'com.liferay.portal.kernel.model.UserGroup','VIEW_MEMBERS',16),(0,120,'com.liferay.portal.kernel.model.UserGroup','MANAGE_ANNOUNCEMENTS',32),(0,121,'com.liferay.portal.kernel.model.UserGroup','UPDATE',64),(0,122,'com.liferay.portal.kernel.model.UserGroup','VIEW',1),(0,123,'com.liferay.asset.kernel.model.AssetCategory','DELETE',2),(0,124,'com.liferay.asset.kernel.model.AssetCategory','PERMISSIONS',4),(0,125,'com.liferay.asset.kernel.model.AssetCategory','ADD_CATEGORY',8),(0,126,'com.liferay.asset.kernel.model.AssetCategory','UPDATE',16),(0,127,'com.liferay.asset.kernel.model.AssetCategory','VIEW',1),(0,128,'com.liferay.asset.kernel.model.AssetTag','DELETE',2),(0,129,'com.liferay.asset.kernel.model.AssetTag','PERMISSIONS',4),(0,130,'com.liferay.asset.kernel.model.AssetTag','UPDATE',8),(0,131,'com.liferay.portal.kernel.model.LayoutSetBranch','DELETE',2),(0,132,'com.liferay.portal.kernel.model.LayoutSetBranch','PERMISSIONS',4),(0,133,'com.liferay.portal.kernel.model.LayoutSetBranch','MERGE',8),(0,134,'com.liferay.portal.kernel.model.LayoutSetBranch','UPDATE',16),(0,135,'com.liferay.asset.kernel.model.AssetVocabulary','DELETE',2),(0,136,'com.liferay.asset.kernel.model.AssetVocabulary','PERMISSIONS',4),(0,137,'com.liferay.asset.kernel.model.AssetVocabulary','UPDATE',8),(0,138,'com.liferay.asset.kernel.model.AssetVocabulary','VIEW',1),(0,139,'com.liferay.document.library.kernel.model.DLFolder','DELETE',2),(0,140,'com.liferay.document.library.kernel.model.DLFolder','PERMISSIONS',4),(0,141,'com.liferay.document.library.kernel.model.DLFolder','ADD_SUBFOLDER',8),(0,142,'com.liferay.document.library.kernel.model.DLFolder','ADD_SHORTCUT',16),(0,143,'com.liferay.document.library.kernel.model.DLFolder','UPDATE',32),(0,144,'com.liferay.document.library.kernel.model.DLFolder','ADD_DOCUMENT',64),(0,145,'com.liferay.document.library.kernel.model.DLFolder','SUBSCRIBE',128),(0,146,'com.liferay.document.library.kernel.model.DLFolder','VIEW',1),(0,147,'com.liferay.document.library.kernel.model.DLFolder','ACCESS',256),(0,148,'com.liferay.portal.kernel.model.Layout','UPDATE_DISCUSSION',2),(0,149,'com.liferay.portal.kernel.model.Layout','DELETE',4),(0,150,'com.liferay.portal.kernel.model.Layout','PERMISSIONS',8),(0,151,'com.liferay.portal.kernel.model.Layout','CUSTOMIZE',16),(0,152,'com.liferay.portal.kernel.model.Layout','ADD_LAYOUT',32),(0,153,'com.liferay.portal.kernel.model.Layout','DELETE_DISCUSSION',64),(0,154,'com.liferay.portal.kernel.model.Layout','CONFIGURE_PORTLETS',128),(0,155,'com.liferay.portal.kernel.model.Layout','UPDATE',256),(0,156,'com.liferay.portal.kernel.model.Layout','VIEW',1),(0,157,'com.liferay.portal.kernel.model.Layout','ADD_DISCUSSION',512),(0,158,'com.liferay.document.library.kernel.model.DLFileEntryType','DELETE',2),(0,159,'com.liferay.document.library.kernel.model.DLFileEntryType','PERMISSIONS',4),(0,160,'com.liferay.document.library.kernel.model.DLFileEntryType','UPDATE',8),(0,161,'com.liferay.document.library.kernel.model.DLFileEntryType','VIEW',1),(0,162,'com.liferay.portal.kernel.model.Team','DELETE',2),(0,163,'com.liferay.portal.kernel.model.Team','PERMISSIONS',4),(0,164,'com.liferay.portal.kernel.model.Team','ASSIGN_MEMBERS',8),(0,165,'com.liferay.portal.kernel.model.Team','UPDATE',16),(0,166,'com.liferay.portal.kernel.model.Team','VIEW',1),(0,167,'com.liferay.portal.kernel.model.PasswordPolicy','DELETE',2),(0,168,'com.liferay.portal.kernel.model.PasswordPolicy','PERMISSIONS',4),(0,169,'com.liferay.portal.kernel.model.PasswordPolicy','ASSIGN_MEMBERS',8),(0,170,'com.liferay.portal.kernel.model.PasswordPolicy','UPDATE',16),(0,171,'com.liferay.portal.kernel.model.PasswordPolicy','VIEW',1),(0,172,'com.liferay.document.library.kernel.model.DLFileShortcut','DELETE',2),(0,173,'com.liferay.document.library.kernel.model.DLFileShortcut','PERMISSIONS',4),(0,174,'com.liferay.document.library.kernel.model.DLFileShortcut','UPDATE',8),(0,175,'com.liferay.document.library.kernel.model.DLFileShortcut','VIEW',1),(0,176,'com.liferay.message.boards.kernel.model.MBMessage','DELETE',2),(0,177,'com.liferay.message.boards.kernel.model.MBMessage','PERMISSIONS',4),(0,178,'com.liferay.message.boards.kernel.model.MBMessage','UPDATE',8),(0,179,'com.liferay.message.boards.kernel.model.MBMessage','SUBSCRIBE',16),(0,180,'com.liferay.message.boards.kernel.model.MBMessage','VIEW',1),(0,181,'com.liferay.expando.kernel.model.ExpandoColumn','DELETE',2),(0,182,'com.liferay.expando.kernel.model.ExpandoColumn','PERMISSIONS',4),(0,183,'com.liferay.expando.kernel.model.ExpandoColumn','UPDATE',8),(0,184,'com.liferay.expando.kernel.model.ExpandoColumn','VIEW',1),(0,185,'com.liferay.message.boards','PERMISSIONS',2),(0,186,'com.liferay.message.boards','ADD_FILE',4),(0,187,'com.liferay.message.boards','BAN_USER',8),(0,188,'com.liferay.message.boards','ADD_CATEGORY',16),(0,189,'com.liferay.message.boards','REPLY_TO_MESSAGE',32),(0,190,'com.liferay.message.boards','LOCK_THREAD',64),(0,191,'com.liferay.message.boards','SUBSCRIBE',128),(0,192,'com.liferay.message.boards','VIEW',1),(0,193,'com.liferay.message.boards','ADD_MESSAGE',256),(0,194,'com.liferay.message.boards','MOVE_THREAD',512),(0,195,'com.liferay.message.boards','UPDATE_THREAD_PRIORITY',1024),(0,196,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet','ADD_TO_PAGE',2),(0,197,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet','CONFIGURATION',4),(0,198,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet','PERMISSIONS',8),(0,199,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet','PREFERENCES',16),(0,200,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet','VIEW',1),(0,201,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet','ADD_TO_PAGE',2),(0,202,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet','CONFIGURATION',4),(0,203,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet','PERMISSIONS',8),(0,204,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet','PREFERENCES',16),(0,205,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet','VIEW',1),(0,206,'com_liferay_announcements_web_portlet_AlertsPortlet','ADD_TO_PAGE',2),(0,207,'com_liferay_announcements_web_portlet_AlertsPortlet','CONFIGURATION',4),(0,208,'com_liferay_announcements_web_portlet_AlertsPortlet','PERMISSIONS',8),(0,209,'com_liferay_announcements_web_portlet_AlertsPortlet','PREFERENCES',16),(0,210,'com_liferay_announcements_web_portlet_AlertsPortlet','VIEW',1),(0,211,'com_liferay_message_boards_web_portlet_MBPortlet','ADD_TO_PAGE',2),(0,212,'com_liferay_message_boards_web_portlet_MBPortlet','CONFIGURATION',4),(0,213,'com_liferay_message_boards_web_portlet_MBPortlet','PERMISSIONS',8),(0,214,'com_liferay_message_boards_web_portlet_MBPortlet','PREFERENCES',16),(0,215,'com_liferay_message_boards_web_portlet_MBPortlet','VIEW',1),(0,216,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet','ADD_TO_PAGE',2),(0,217,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet','CONFIGURATION',4),(0,218,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet','PERMISSIONS',8),(0,219,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet','PREFERENCES',16),(0,220,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet','VIEW',1),(0,221,'150','PERMISSIONS',2),(0,222,'150','PREFERENCES',4),(0,223,'150','CONFIGURATION',8),(0,224,'150','ACCESS_IN_CONTROL_PANEL',16),(0,225,'150','VIEW',1),(0,226,'151','PERMISSIONS',2),(0,227,'151','PREFERENCES',4),(0,228,'151','CONFIGURATION',8),(0,229,'151','ACCESS_IN_CONTROL_PANEL',16),(0,230,'151','VIEW',1),(0,231,'152','PERMISSIONS',2),(0,232,'152','PREFERENCES',4),(0,233,'152','CONFIGURATION',8),(0,234,'152','ACCESS_IN_CONTROL_PANEL',16),(0,235,'152','VIEW',1),(0,236,'153','PERMISSIONS',2),(0,237,'153','PREFERENCES',4),(0,238,'153','CONFIGURATION',8),(0,239,'153','ACCESS_IN_CONTROL_PANEL',16),(0,240,'153','VIEW',1),(0,241,'153','ADD_TO_PAGE',32),(0,242,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet','ADD_TO_PAGE',2),(0,243,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet','CONFIGURATION',4),(0,244,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet','PERMISSIONS',8),(0,245,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet','PREFERENCES',16),(0,246,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet','VIEW',1),(0,247,'157','PERMISSIONS',2),(0,248,'157','PREFERENCES',4),(0,249,'157','CONFIGURATION',8),(0,250,'157','ACCESS_IN_CONTROL_PANEL',16),(0,251,'157','VIEW',1),(0,252,'136','PERMISSIONS',2),(0,253,'136','PREFERENCES',4),(0,254,'136','CONFIGURATION',8),(0,255,'136','ACCESS_IN_CONTROL_PANEL',16),(0,256,'136','VIEW',1),(0,257,'158','PERMISSIONS',2),(0,258,'158','PREFERENCES',4),(0,259,'158','CONFIGURATION',8),(0,260,'158','ACCESS_IN_CONTROL_PANEL',16),(0,261,'158','VIEW',1),(0,262,'158','ADD_TO_PAGE',32),(0,263,'com_liferay_blogs_web_portlet_BlogsPortlet','ADD_TO_PAGE',2),(0,264,'com_liferay_blogs_web_portlet_BlogsPortlet','CONFIGURATION',4),(0,265,'com_liferay_blogs_web_portlet_BlogsPortlet','PERMISSIONS',8),(0,266,'com_liferay_blogs_web_portlet_BlogsPortlet','PREFERENCES',16),(0,267,'com_liferay_blogs_web_portlet_BlogsPortlet','VIEW',1),(0,268,'90','VIEW_CONTROL_PANEL',2),(0,269,'90','ADD_GENERAL_ANNOUNCEMENTS',4),(0,270,'90','CONFIGURATION',8),(0,271,'90','UNLINK_LAYOUT_SET_PROTOTYPE',16),(0,272,'90','ADD_USER',32),(0,273,'90','ADD_ROLE',64),(0,274,'90','EXPORT_USER',128),(0,275,'90','ADD_LICENSE',256),(0,276,'90','ADD_ORGANIZATION',512),(0,277,'90','ADD_USER_GROUP',1024),(0,278,'90','ADD_LAYOUT_PROTOTYPE',2048),(0,279,'90','ADD_COMMUNITY',4096),(0,280,'90','ADD_LAYOUT_SET_PROTOTYPE',8192),(0,281,'90','IMPERSONATE',16384),(0,282,'90','ADD_PASSWORD_POLICY',32768),(0,283,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet','ADD_TO_PAGE',2),(0,284,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet','CONFIGURATION',4),(0,285,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet','PERMISSIONS',8),(0,286,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet','PREFERENCES',16),(0,287,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet','VIEW',1),(0,288,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet','ADD_TO_PAGE',2),(0,289,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet','CONFIGURATION',4),(0,290,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet','PERMISSIONS',8),(0,291,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet','PREFERENCES',16),(0,292,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet','VIEW',1),(0,293,'com_liferay_blogs_web_portlet_BlogsAdminPortlet','ADD_TO_PAGE',2),(0,294,'com_liferay_blogs_web_portlet_BlogsAdminPortlet','CONFIGURATION',4),(0,295,'com_liferay_blogs_web_portlet_BlogsAdminPortlet','PERMISSIONS',8),(0,296,'com_liferay_blogs_web_portlet_BlogsAdminPortlet','PREFERENCES',16),(0,297,'com_liferay_blogs_web_portlet_BlogsAdminPortlet','VIEW',1),(0,298,'com_liferay_announcements_web_portlet_AnnouncementsPortlet','ADD_TO_PAGE',2),(0,299,'com_liferay_announcements_web_portlet_AnnouncementsPortlet','CONFIGURATION',4),(0,300,'com_liferay_announcements_web_portlet_AnnouncementsPortlet','PERMISSIONS',8),(0,301,'com_liferay_announcements_web_portlet_AnnouncementsPortlet','PREFERENCES',16),(0,302,'com_liferay_announcements_web_portlet_AnnouncementsPortlet','VIEW',1),(0,303,'com_liferay_document_library_web_portlet_DLAdminPortlet','ADD_TO_PAGE',2),(0,304,'com_liferay_document_library_web_portlet_DLAdminPortlet','CONFIGURATION',4),(0,305,'com_liferay_document_library_web_portlet_DLAdminPortlet','PERMISSIONS',8),(0,306,'com_liferay_document_library_web_portlet_DLAdminPortlet','PREFERENCES',16),(0,307,'com_liferay_document_library_web_portlet_DLAdminPortlet','VIEW',1),(0,308,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet','ADD_TO_PAGE',2),(0,309,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet','CONFIGURATION',4),(0,310,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet','PERMISSIONS',8),(0,311,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet','PREFERENCES',16),(0,312,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet','VIEW',1),(0,313,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','ADD_TO_PAGE',2),(0,314,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','CONFIGURATION',4),(0,315,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','PERMISSIONS',8),(0,316,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','PREFERENCES',16),(0,317,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','VIEW',1),(0,318,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet','ADD_TO_PAGE',2),(0,319,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet','CONFIGURATION',4),(0,320,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet','PERMISSIONS',8),(0,321,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet','PREFERENCES',16),(0,322,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet','VIEW',1),(0,323,'com_liferay_document_library_web_portlet_DLPortlet','ADD_TO_PAGE',2),(0,324,'com_liferay_document_library_web_portlet_DLPortlet','CONFIGURATION',4),(0,325,'com_liferay_document_library_web_portlet_DLPortlet','PERMISSIONS',8),(0,326,'com_liferay_document_library_web_portlet_DLPortlet','PREFERENCES',16),(0,327,'com_liferay_document_library_web_portlet_DLPortlet','VIEW',1),(0,328,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet','ADD_TO_PAGE',2),(0,329,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet','CONFIGURATION',4),(0,330,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet','PERMISSIONS',8),(0,331,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet','PREFERENCES',16),(0,332,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet','VIEW',1),(0,333,'com_liferay_site_admin_web_portlet_SiteAdminPortlet','ADD_TO_PAGE',2),(0,334,'com_liferay_site_admin_web_portlet_SiteAdminPortlet','CONFIGURATION',4),(0,335,'com_liferay_site_admin_web_portlet_SiteAdminPortlet','PERMISSIONS',8),(0,336,'com_liferay_site_admin_web_portlet_SiteAdminPortlet','PREFERENCES',16),(0,337,'com_liferay_site_admin_web_portlet_SiteAdminPortlet','VIEW',1),(0,338,'com_liferay_expando_web_portlet_ExpandoPortlet','ADD_TO_PAGE',2),(0,339,'com_liferay_expando_web_portlet_ExpandoPortlet','CONFIGURATION',4),(0,340,'com_liferay_expando_web_portlet_ExpandoPortlet','PERMISSIONS',8),(0,341,'com_liferay_expando_web_portlet_ExpandoPortlet','PREFERENCES',16),(0,342,'com_liferay_expando_web_portlet_ExpandoPortlet','VIEW',1),(0,343,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet','ADD_TO_PAGE',2),(0,344,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet','CONFIGURATION',4),(0,345,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet','PERMISSIONS',8),(0,346,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet','PREFERENCES',16),(0,347,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet','VIEW',1),(0,348,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet','ADD_TO_PAGE',2),(0,349,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet','CONFIGURATION',4),(0,350,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet','PERMISSIONS',8),(0,351,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet','PREFERENCES',16),(0,352,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet','VIEW',1),(0,353,'com_liferay_message_boards_web_portlet_MBAdminPortlet','ADD_TO_PAGE',2),(0,354,'com_liferay_message_boards_web_portlet_MBAdminPortlet','CONFIGURATION',4),(0,355,'com_liferay_message_boards_web_portlet_MBAdminPortlet','PERMISSIONS',8),(0,356,'com_liferay_message_boards_web_portlet_MBAdminPortlet','PREFERENCES',16),(0,357,'com_liferay_message_boards_web_portlet_MBAdminPortlet','VIEW',1),(0,358,'com_liferay_document_library_web_portlet_IGDisplayPortlet','ADD_TO_PAGE',2),(0,359,'com_liferay_document_library_web_portlet_IGDisplayPortlet','CONFIGURATION',4),(0,360,'com_liferay_document_library_web_portlet_IGDisplayPortlet','PERMISSIONS',8),(0,361,'com_liferay_document_library_web_portlet_IGDisplayPortlet','PREFERENCES',16),(0,362,'com_liferay_document_library_web_portlet_IGDisplayPortlet','VIEW',1),(0,363,'90','ADD_TO_PAGE',65536),(0,364,'90','PERMISSIONS',131072),(0,365,'90','PREFERENCES',262144),(0,366,'90','VIEW',1),(0,367,'90','ACCESS_IN_CONTROL_PANEL',524288),(0,401,'com_liferay_bookmarks_web_portlet_BookmarksPortlet','ADD_TO_PAGE',2),(0,402,'com_liferay_bookmarks_web_portlet_BookmarksPortlet','CONFIGURATION',4),(0,403,'com_liferay_bookmarks_web_portlet_BookmarksPortlet','PERMISSIONS',8),(0,404,'com_liferay_bookmarks_web_portlet_BookmarksPortlet','PREFERENCES',16),(0,405,'com_liferay_bookmarks_web_portlet_BookmarksPortlet','VIEW',1),(0,406,'com.liferay.bookmarks','ADD_ENTRY',2),(0,407,'com.liferay.bookmarks','PERMISSIONS',4),(0,408,'com.liferay.bookmarks','SUBSCRIBE',8),(0,409,'com.liferay.bookmarks','VIEW',1),(0,410,'com.liferay.bookmarks','ADD_FOLDER',16),(0,411,'com.liferay.bookmarks.model.BookmarksEntry','DELETE',2),(0,412,'com.liferay.bookmarks.model.BookmarksEntry','PERMISSIONS',4),(0,413,'com.liferay.bookmarks.model.BookmarksEntry','UPDATE',8),(0,414,'com.liferay.bookmarks.model.BookmarksEntry','SUBSCRIBE',16),(0,415,'com.liferay.bookmarks.model.BookmarksEntry','VIEW',1),(0,416,'com.liferay.bookmarks.model.BookmarksFolder','ADD_ENTRY',2),(0,417,'com.liferay.bookmarks.model.BookmarksFolder','DELETE',4),(0,418,'com.liferay.bookmarks.model.BookmarksFolder','PERMISSIONS',8),(0,419,'com.liferay.bookmarks.model.BookmarksFolder','ADD_SUBFOLDER',16),(0,420,'com.liferay.bookmarks.model.BookmarksFolder','UPDATE',32),(0,421,'com.liferay.bookmarks.model.BookmarksFolder','SUBSCRIBE',64),(0,422,'com.liferay.bookmarks.model.BookmarksFolder','VIEW',1),(0,423,'com.liferay.bookmarks.model.BookmarksFolder','ACCESS',128),(0,424,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet','ADD_TO_PAGE',2),(0,425,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet','CONFIGURATION',4),(0,426,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet','PERMISSIONS',8),(0,427,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet','PREFERENCES',16),(0,428,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet','VIEW',1),(0,501,'com_liferay_wiki_web_portlet_WikiPortlet','ADD_TO_PAGE',2),(0,502,'com_liferay_wiki_web_portlet_WikiPortlet','CONFIGURATION',4),(0,503,'com_liferay_wiki_web_portlet_WikiPortlet','PERMISSIONS',8),(0,504,'com_liferay_wiki_web_portlet_WikiPortlet','PREFERENCES',16),(0,505,'com_liferay_wiki_web_portlet_WikiPortlet','VIEW',1),(0,506,'com.liferay.wiki.model.WikiPage','UPDATE_DISCUSSION',2),(0,507,'com.liferay.wiki.model.WikiPage','DELETE',4),(0,508,'com.liferay.wiki.model.WikiPage','PERMISSIONS',8),(0,509,'com.liferay.wiki.model.WikiPage','DELETE_DISCUSSION',16),(0,510,'com.liferay.wiki.model.WikiPage','UPDATE',32),(0,511,'com.liferay.wiki.model.WikiPage','SUBSCRIBE',64),(0,512,'com.liferay.wiki.model.WikiPage','VIEW',1),(0,513,'com.liferay.wiki.model.WikiPage','ADD_DISCUSSION',128),(0,514,'com.liferay.wiki','PERMISSIONS',2),(0,515,'com.liferay.wiki','ADD_NODE',4),(0,516,'com.liferay.wiki.model.WikiNode','ADD_PAGE',2),(0,517,'com.liferay.wiki.model.WikiNode','IMPORT',4),(0,518,'com.liferay.wiki.model.WikiNode','DELETE',8),(0,519,'com.liferay.wiki.model.WikiNode','PERMISSIONS',16),(0,520,'com.liferay.wiki.model.WikiNode','UPDATE',32),(0,521,'com.liferay.wiki.model.WikiNode','ADD_ATTACHMENT',64),(0,522,'com.liferay.wiki.model.WikiNode','SUBSCRIBE',128),(0,523,'com.liferay.wiki.model.WikiNode','VIEW',1),(0,524,'com_liferay_wiki_web_portlet_WikiAdminPortlet','ADD_TO_PAGE',2),(0,525,'com_liferay_wiki_web_portlet_WikiAdminPortlet','CONFIGURATION',4),(0,526,'com_liferay_wiki_web_portlet_WikiAdminPortlet','PERMISSIONS',8),(0,527,'com_liferay_wiki_web_portlet_WikiAdminPortlet','PREFERENCES',16),(0,528,'com_liferay_wiki_web_portlet_WikiAdminPortlet','VIEW',1),(0,601,'com_liferay_calendar_web_portlet_CalendarPortlet','ADD_TO_PAGE',2),(0,602,'com_liferay_calendar_web_portlet_CalendarPortlet','CONFIGURATION',4),(0,603,'com_liferay_calendar_web_portlet_CalendarPortlet','PERMISSIONS',8),(0,604,'com_liferay_calendar_web_portlet_CalendarPortlet','PREFERENCES',16),(0,605,'com_liferay_calendar_web_portlet_CalendarPortlet','VIEW',1),(0,606,'com.liferay.calendar.model.CalendarResource','DELETE',2),(0,607,'com.liferay.calendar.model.CalendarResource','PERMISSIONS',4),(0,608,'com.liferay.calendar.model.CalendarResource','ADD_CALENDAR',8),(0,609,'com.liferay.calendar.model.CalendarResource','UPDATE',16),(0,610,'com.liferay.calendar.model.CalendarResource','VIEW',1),(0,611,'com.liferay.calendar.model.CalendarBooking','UPDATE_DISCUSSION',2),(0,612,'com.liferay.calendar.model.CalendarBooking','PERMISSIONS',4),(0,613,'com.liferay.calendar.model.CalendarBooking','DELETE_DISCUSSION',8),(0,614,'com.liferay.calendar.model.CalendarBooking','ADD_DISCUSSION',16),(0,615,'com.liferay.calendar','PERMISSIONS',2),(0,616,'com.liferay.calendar','ADD_RESOURCE',4),(0,617,'com.liferay.calendar.model.Calendar','DELETE',2),(0,618,'com.liferay.calendar.model.Calendar','PERMISSIONS',4),(0,619,'com.liferay.calendar.model.Calendar','MANAGE_BOOKINGS',8),(0,620,'com.liferay.calendar.model.Calendar','VIEW_BOOKING_DETAILS',16),(0,621,'com.liferay.calendar.model.Calendar','UPDATE',32),(0,622,'com.liferay.calendar.model.Calendar','VIEW',1),(0,701,'com_liferay_polls_web_portlet_PollsPortlet','ADD_TO_PAGE',2),(0,702,'com_liferay_polls_web_portlet_PollsPortlet','CONFIGURATION',4),(0,703,'com_liferay_polls_web_portlet_PollsPortlet','PERMISSIONS',8),(0,704,'com_liferay_polls_web_portlet_PollsPortlet','PREFERENCES',16),(0,705,'com_liferay_polls_web_portlet_PollsPortlet','VIEW',1),(0,706,'com.liferay.polls.model.PollsQuestion','DELETE',2),(0,707,'com.liferay.polls.model.PollsQuestion','PERMISSIONS',4),(0,708,'com.liferay.polls.model.PollsQuestion','ADD_VOTE',8),(0,709,'com.liferay.polls.model.PollsQuestion','UPDATE',16),(0,710,'com.liferay.polls.model.PollsQuestion','VIEW',1),(0,711,'com.liferay.polls','PERMISSIONS',2),(0,712,'com.liferay.polls','ADD_QUESTION',4),(0,713,'com_liferay_polls_web_portlet_PollsDisplayPortlet','ADD_TO_PAGE',2),(0,714,'com_liferay_polls_web_portlet_PollsDisplayPortlet','CONFIGURATION',4),(0,715,'com_liferay_polls_web_portlet_PollsDisplayPortlet','PERMISSIONS',8),(0,716,'com_liferay_polls_web_portlet_PollsDisplayPortlet','PREFERENCES',16),(0,717,'com_liferay_polls_web_portlet_PollsDisplayPortlet','VIEW',1),(0,801,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet','ADD_TO_PAGE',2),(0,802,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet','CONFIGURATION',4),(0,803,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet','PERMISSIONS',8),(0,804,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet','PREFERENCES',16),(0,805,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet','VIEW',1),(0,806,'com.liferay.portal.workflow.kaleo.designer','PERMISSIONS',2),(0,807,'com.liferay.portal.workflow.kaleo.designer','ADD_DRAFT',4),(0,808,'com.liferay.portal.workflow.kaleo.designer','PUBLISH',8),(0,809,'com.liferay.portal.workflow.kaleo.designer','VIEW',1),(0,810,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition','DELETE',2),(0,811,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition','PERMISSIONS',4),(0,812,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition','UPDATE',8),(0,813,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition','VIEW',1),(0,901,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet','ADD_TO_PAGE',2),(0,902,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet','CONFIGURATION',4),(0,903,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet','PERMISSIONS',8),(0,904,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet','PREFERENCES',16),(0,905,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet','VIEW',1),(0,906,'com.liferay.mobile.device.rules.model.MDRRuleGroupInstance','DELETE',2),(0,907,'com.liferay.mobile.device.rules.model.MDRRuleGroupInstance','PERMISSIONS',4),(0,908,'com.liferay.mobile.device.rules.model.MDRRuleGroupInstance','UPDATE',8),(0,909,'com.liferay.mobile.device.rules.model.MDRRuleGroupInstance','VIEW',1),(0,910,'com.liferay.mobile.device.rules.model.MDRRuleGroup','DELETE',2),(0,911,'com.liferay.mobile.device.rules.model.MDRRuleGroup','PERMISSIONS',4),(0,912,'com.liferay.mobile.device.rules.model.MDRRuleGroup','UPDATE',8),(0,913,'com.liferay.mobile.device.rules.model.MDRRuleGroup','VIEW',1),(0,914,'com.liferay.mobile.device.rules','PERMISSIONS',2),(0,915,'com.liferay.mobile.device.rules','ADD_RULE_GROUP',4),(0,916,'com.liferay.mobile.device.rules','ADD_RULE_GROUP_INSTANCE',8),(0,917,'com.liferay.mobile.device.rules','CONFIGURATION',16),(0,918,'com.liferay.mobile.device.rules','VIEW',1),(0,1001,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet','ADD_TO_PAGE',2),(0,1002,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet','CONFIGURATION',4),(0,1003,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet','PERMISSIONS',8),(0,1004,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet','PREFERENCES',16),(0,1005,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet','VIEW',1),(0,1006,'com.liferay.dynamic.data.mapping.model.DDMTemplate','DELETE',2),(0,1007,'com.liferay.dynamic.data.mapping.model.DDMTemplate','PERMISSIONS',4),(0,1008,'com.liferay.dynamic.data.mapping.model.DDMTemplate','UPDATE',8),(0,1009,'com.liferay.dynamic.data.mapping.model.DDMTemplate','VIEW',1),(0,1010,'com.liferay.dynamic.data.mapping.model.DDMStructure','DELETE',2),(0,1011,'com.liferay.dynamic.data.mapping.model.DDMStructure','PERMISSIONS',4),(0,1012,'com.liferay.dynamic.data.mapping.model.DDMStructure','UPDATE',8),(0,1013,'com.liferay.dynamic.data.mapping.model.DDMStructure','VIEW',1),(0,1014,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet','ADD_TO_PAGE',2),(0,1015,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet','CONFIGURATION',4),(0,1016,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet','PERMISSIONS',8),(0,1017,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet','PREFERENCES',16),(0,1018,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet','VIEW',1),(0,1019,'com.liferay.dynamic.data.mapping','PERMISSIONS',2),(0,1020,'com.liferay.dynamic.data.mapping','ADD_DATA_PROVIDER_INSTANCE',4),(0,1021,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstance','DELETE',2),(0,1022,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstance','PERMISSIONS',4),(0,1023,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstance','UPDATE',8),(0,1024,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstance','VIEW',1),(0,1025,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet','ADD_TO_PAGE',2),(0,1026,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet','CONFIGURATION',4),(0,1027,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet','PERMISSIONS',8),(0,1028,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet','PREFERENCES',16),(0,1029,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet','VIEW',1),(0,1030,'com.liferay.dynamic.data.lists','PERMISSIONS',2),(0,1031,'com.liferay.dynamic.data.lists','ADD_RECORD_SET',4),(0,1032,'com.liferay.dynamic.data.lists','ADD_TEMPLATE',8),(0,1033,'com.liferay.dynamic.data.lists','ADD_STRUCTURE',16),(0,1034,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure','DELETE',2),(0,1035,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure','PERMISSIONS',4),(0,1036,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure','UPDATE',8),(0,1037,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure','VIEW',1),(0,1038,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate','DELETE',2),(0,1039,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate','PERMISSIONS',4),(0,1040,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate','UPDATE',8),(0,1041,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate','VIEW',1),(0,1042,'com.liferay.dynamic.data.lists.model.DDLRecordSet','DELETE',2),(0,1043,'com.liferay.dynamic.data.lists.model.DDLRecordSet','PERMISSIONS',4),(0,1044,'com.liferay.dynamic.data.lists.model.DDLRecordSet','ADD_RECORD',8),(0,1045,'com.liferay.dynamic.data.lists.model.DDLRecordSet','UPDATE',16),(0,1046,'com.liferay.dynamic.data.lists.model.DDLRecordSet','VIEW',1),(0,1047,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet','ADD_TO_PAGE',2),(0,1048,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet','CONFIGURATION',4),(0,1049,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet','PERMISSIONS',8),(0,1050,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet','PREFERENCES',16),(0,1051,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet','VIEW',1),(0,1052,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet','ADD_TO_PAGE',2),(0,1053,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet','CONFIGURATION',4),(0,1054,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet','PERMISSIONS',8),(0,1055,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet','PREFERENCES',16),(0,1056,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet','VIEW',1),(0,1101,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet','ADD_TO_PAGE',2),(0,1102,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet','CONFIGURATION',4),(0,1103,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet','PERMISSIONS',8),(0,1104,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet','PREFERENCES',16),(0,1105,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet','VIEW',1),(0,1106,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','DELETE',2),(0,1107,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','PERMISSIONS',4),(0,1108,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','UPDATE',8),(0,1109,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','VIEW',1),(0,1110,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','DELETE',2),(0,1111,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','PERMISSIONS',4),(0,1112,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','SUBMIT',8),(0,1113,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','UPDATE',16),(0,1114,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','COMPLETE_FORM',32),(0,1115,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','VIEW',1),(0,1116,'com.liferay.portal.workflow.kaleo.forms','PERMISSIONS',2),(0,1117,'com.liferay.portal.workflow.kaleo.forms','ADD_PROCESS',4),(0,1118,'com.liferay.portal.workflow.kaleo.forms','ADD_TEMPLATE',8),(0,1119,'com.liferay.portal.workflow.kaleo.forms','ADD_STRUCTURE',16),(0,1120,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','DELETE',2),(0,1121,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','PERMISSIONS',4),(0,1122,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','UPDATE',8),(0,1123,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess','VIEW',1),(0,1201,'com_liferay_audit_web_portlet_AuditPortlet','ADD_TO_PAGE',2),(0,1202,'com_liferay_audit_web_portlet_AuditPortlet','CONFIGURATION',4),(0,1203,'com_liferay_audit_web_portlet_AuditPortlet','PERMISSIONS',8),(0,1204,'com_liferay_audit_web_portlet_AuditPortlet','PREFERENCES',16),(0,1205,'com_liferay_audit_web_portlet_AuditPortlet','VIEW',1),(0,1301,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet','ADD_TO_PAGE',2),(0,1302,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet','CONFIGURATION',4),(0,1303,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet','PERMISSIONS',8),(0,1304,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet','PREFERENCES',16),(0,1305,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet','VIEW',1),(0,1306,'com.liferay.portal.security.service.access.policy','PERMISSIONS',2),(0,1307,'com.liferay.portal.security.service.access.policy','ADD_SAP_ENTRY',4),(0,1308,'com.liferay.portal.security.service.access.policy','VIEW',1),(0,1309,'com.liferay.portal.security.service.access.policy.model.SAPEntry','DELETE',2),(0,1310,'com.liferay.portal.security.service.access.policy.model.SAPEntry','PERMISSIONS',4),(0,1311,'com.liferay.portal.security.service.access.policy.model.SAPEntry','UPDATE',8),(0,1312,'com.liferay.portal.security.service.access.policy.model.SAPEntry','VIEW',1),(0,1401,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet','ADD_TO_PAGE',2),(0,1402,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet','CONFIGURATION',4),(0,1403,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet','PERMISSIONS',8),(0,1404,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet','PREFERENCES',16),(0,1405,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet','VIEW',1),(0,1406,'com.liferay.marketplace','PERMISSIONS',2),(0,1407,'com.liferay.marketplace','CONFIGURATION',4),(0,1408,'com.liferay.marketplace','ACCESS_IN_CONTROL_PANEL',8),(0,1409,'com.liferay.marketplace','VIEW',1),(0,1410,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet','ADD_TO_PAGE',2),(0,1411,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet','CONFIGURATION',4),(0,1412,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet','PERMISSIONS',8),(0,1413,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet','PREFERENCES',16),(0,1414,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet','VIEW',1),(0,1415,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet','ADD_TO_PAGE',2),(0,1416,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet','CONFIGURATION',4),(0,1417,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet','PERMISSIONS',8),(0,1418,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet','PREFERENCES',16),(0,1419,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet','VIEW',1),(0,1501,'com_liferay_journal_web_portlet_JournalPortlet','ADD_TO_PAGE',2),(0,1502,'com_liferay_journal_web_portlet_JournalPortlet','CONFIGURATION',4),(0,1503,'com_liferay_journal_web_portlet_JournalPortlet','PERMISSIONS',8),(0,1504,'com_liferay_journal_web_portlet_JournalPortlet','PREFERENCES',16),(0,1505,'com_liferay_journal_web_portlet_JournalPortlet','VIEW',1),(0,1506,'com.liferay.journal.model.JournalFeed','DELETE',2),(0,1507,'com.liferay.journal.model.JournalFeed','PERMISSIONS',4),(0,1508,'com.liferay.journal.model.JournalFeed','UPDATE',8),(0,1509,'com.liferay.journal.model.JournalFeed','VIEW',1),(0,1510,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle','DELETE',2),(0,1511,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle','PERMISSIONS',4),(0,1512,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle','UPDATE',8),(0,1513,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle','VIEW',1),(0,1514,'com.liferay.journal.model.JournalArticle','UPDATE_DISCUSSION',2),(0,1515,'com.liferay.journal.model.JournalArticle','DELETE',4),(0,1516,'com.liferay.journal.model.JournalArticle','PERMISSIONS',8),(0,1517,'com.liferay.journal.model.JournalArticle','EXPIRE',16),(0,1518,'com.liferay.journal.model.JournalArticle','DELETE_DISCUSSION',32),(0,1519,'com.liferay.journal.model.JournalArticle','UPDATE',64),(0,1520,'com.liferay.journal.model.JournalArticle','VIEW',1),(0,1521,'com.liferay.journal.model.JournalArticle','ADD_DISCUSSION',128),(0,1522,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle','DELETE',2),(0,1523,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle','PERMISSIONS',4),(0,1524,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle','UPDATE',8),(0,1525,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle','VIEW',1),(0,1526,'com.liferay.journal','PERMISSIONS',2),(0,1527,'com.liferay.journal','ADD_FEED',4),(0,1528,'com.liferay.journal','ADD_TEMPLATE',8),(0,1529,'com.liferay.journal','UPDATE',16),(0,1530,'com.liferay.journal','ADD_ARTICLE',32),(0,1531,'com.liferay.journal','SUBSCRIBE',64),(0,1532,'com.liferay.journal','VIEW',1),(0,1533,'com.liferay.journal','ADD_FOLDER',128),(0,1534,'com.liferay.journal','ADD_STRUCTURE',256),(0,1535,'com.liferay.journal.model.JournalFolder','DELETE',2),(0,1536,'com.liferay.journal.model.JournalFolder','PERMISSIONS',4),(0,1537,'com.liferay.journal.model.JournalFolder','ADD_SUBFOLDER',8),(0,1538,'com.liferay.journal.model.JournalFolder','UPDATE',16),(0,1539,'com.liferay.journal.model.JournalFolder','ADD_ARTICLE',32),(0,1540,'com.liferay.journal.model.JournalFolder','SUBSCRIBE',64),(0,1541,'com.liferay.journal.model.JournalFolder','VIEW',1),(0,1542,'com.liferay.journal.model.JournalFolder','ACCESS',128),(0,1601,'1_WAR_lcsportlet','VIEW',1),(0,1602,'1_WAR_lcsportlet','ADD_TO_PAGE',2),(0,1603,'1_WAR_lcsportlet','CONFIGURATION',4),(0,1604,'1_WAR_lcsportlet','PERMISSIONS',8),(0,1605,'1_WAR_lcsportlet','PREFERENCES',16),(0,1606,'1_WAR_lcsportlet','ACCESS_IN_CONTROL_PANEL',32),(0,1607,'1_WAR_osbtestrayportlet','INDEX#FACTOR_CATEGORIES',2),(0,1608,'1_WAR_osbtestrayportlet','ADD#CASES',4),(0,1609,'1_WAR_osbtestrayportlet','ADD#FACTOR_OPTIONS',8),(0,1610,'1_WAR_osbtestrayportlet','PERMISSIONS',16),(0,1611,'1_WAR_osbtestrayportlet','INDEX#CASE_RESULTS',32),(0,1612,'1_WAR_osbtestrayportlet','ADD#TEAMS',64),(0,1613,'1_WAR_osbtestrayportlet','INDEX#COMPONENTS',128),(0,1614,'1_WAR_osbtestrayportlet','ADD#COMPONENTS',256),(0,1615,'1_WAR_osbtestrayportlet','ADD#BUILDS',512),(0,1616,'1_WAR_osbtestrayportlet','VIEW',1),(0,1617,'1_WAR_osbtestrayportlet','ADD#FACTOR_CATEGORIES',1024),(0,1618,'1_WAR_osbtestrayportlet','INDEX#TEAMS',2048),(0,1619,'1_WAR_osbtestrayportlet','CREATE#PROJECTS',4096),(0,1620,'1_WAR_osbtestrayportlet','ADD#PRODUCT_VERSIONS',8192),(0,1621,'1_WAR_osbtestrayportlet','INDEX#FACTOR_OPTIONS',16384),(0,1622,'1_WAR_osbtestrayportlet','CREATE#TEAMS',32768),(0,1623,'1_WAR_osbtestrayportlet','INDEX#RUNS',65536),(0,1624,'1_WAR_osbtestrayportlet','ADD#BUILD_TYPES',131072),(0,1625,'1_WAR_osbtestrayportlet','INDEX#BUILD_TYPES',262144),(0,1626,'1_WAR_osbtestrayportlet','ADD_TO_PAGE',524288),(0,1627,'1_WAR_osbtestrayportlet','CREATE#BUILD_TYPES',1048576),(0,1628,'1_WAR_osbtestrayportlet','ADD#TASKS',2097152),(0,1629,'1_WAR_osbtestrayportlet','CREATE#CASE_TYPES',4194304),(0,1630,'1_WAR_osbtestrayportlet','CONFIGURATION',8388608),(0,1631,'1_WAR_osbtestrayportlet','CREATE#BUILDS',16777216),(0,1632,'1_WAR_osbtestrayportlet','CREATE#PRODUCT_VERSIONS',33554432),(0,1633,'1_WAR_osbtestrayportlet','ADD#PROJECTS',67108864),(0,1634,'1_WAR_osbtestrayportlet','INDEX#BUILDS',134217728),(0,1635,'1_WAR_osbtestrayportlet','INDEX#CASE_TYPES',268435456),(0,1636,'1_WAR_osbtestrayportlet','ADD#CASE_TYPES',536870912),(0,1637,'1_WAR_osbtestrayportlet','CREATE#SUITES',1073741824),(0,1638,'1_WAR_osbtestrayportlet','INDEX#CASES',2147483648),(0,1639,'1_WAR_osbtestrayportlet','ADD#SUITES',4294967296),(0,1640,'1_WAR_osbtestrayportlet','INDEX#SUITES',8589934592),(0,1641,'1_WAR_osbtestrayportlet','CREATE#RUNS',17179869184),(0,1642,'1_WAR_osbtestrayportlet','CREATE#TASKS',34359738368),(0,1643,'1_WAR_osbtestrayportlet','ADD_TESTRAY_RUNS#FACTORS',68719476736),(0,1644,'1_WAR_osbtestrayportlet','ADD_TESTRAY_CASE_RESULTS#CASE_RESULTS',137438953472),(0,1645,'1_WAR_osbtestrayportlet','ADD_TESTRAY_FACTORS#FACTORS',274877906944),(0,1646,'1_WAR_osbtestrayportlet','PREFERENCES',549755813888),(0,1647,'1_WAR_osbtestrayportlet','INDEX#PRODUCT_VERSIONS',1099511627776),(0,1648,'1_WAR_osbtestrayportlet','METRICS#CASE_RESULTS',2199023255552),(0,1649,'1_WAR_osbtestrayportlet','CREATE#CASES',4398046511104),(0,1650,'1_WAR_osbtestrayportlet','CREATE#COMPONENTS',8796093022208),(0,1651,'1_WAR_osbtestrayportlet','CREATE#FACTOR_OPTIONS',17592186044416),(0,1652,'1_WAR_osbtestrayportlet','CREATE#FACTOR_CATEGORIES',35184372088832),(0,1653,'com.liferay.testray.model.TestrayRun','DELETE',2),(0,1654,'com.liferay.testray.model.TestrayRun','PERMISSIONS',4),(0,1655,'com.liferay.testray.model.TestrayRun','CONFIGURATION',8),(0,1656,'com.liferay.testray.model.TestrayRun','EDIT',16),(0,1657,'com.liferay.testray.model.TestrayRun','UPDATE',32),(0,1658,'com.liferay.testray.model.TestrayRun','VIEW',1),(0,1659,'com.liferay.testray.model.TestrayTask','DELETE',2),(0,1660,'com.liferay.testray.model.TestrayTask','PERMISSIONS',4),(0,1661,'com.liferay.testray.model.TestrayTask','UPDATE_USERS',8),(0,1662,'com.liferay.testray.model.TestrayTask','UPDATE_STATUS',16),(0,1663,'com.liferay.testray.model.TestrayCaseType','DELETE',2),(0,1664,'com.liferay.testray.model.TestrayCaseType','PERMISSIONS',4),(0,1665,'com.liferay.testray.model.TestrayCaseType','CONFIGURATION',8),(0,1666,'com.liferay.testray.model.TestrayCaseType','EDIT',16),(0,1667,'com.liferay.testray.model.TestrayCaseType','UPDATE',32),(0,1668,'com.liferay.testray.model.TestrayCase','DELETE',2),(0,1669,'com.liferay.testray.model.TestrayCase','PERMISSIONS',4),(0,1670,'com.liferay.testray.model.TestrayCase','CONFIGURATION',8),(0,1671,'com.liferay.testray.model.TestrayCase','EDIT',16),(0,1672,'com.liferay.testray.model.TestrayCase','UPDATE',32),(0,1673,'com.liferay.testray.model.TestrayCase','VIEW',1),(0,1674,'com.liferay.testray.model.TestrayProductVersion','DELETE',2),(0,1675,'com.liferay.testray.model.TestrayProductVersion','PERMISSIONS',4),(0,1676,'com.liferay.testray.model.TestrayProductVersion','CONFIGURATION',8),(0,1677,'com.liferay.testray.model.TestrayProductVersion','EDIT',16),(0,1678,'com.liferay.testray.model.TestrayProductVersion','UPDATE',32),(0,1679,'com.liferay.testray.model.TestrayBuildType','DELETE',2),(0,1680,'com.liferay.testray.model.TestrayBuildType','PERMISSIONS',4),(0,1681,'com.liferay.testray.model.TestrayBuildType','CONFIGURATION',8),(0,1682,'com.liferay.testray.model.TestrayBuildType','EDIT',16),(0,1683,'com.liferay.testray.model.TestrayBuildType','UPDATE',32),(0,1684,'com.liferay.testray.model.TestrayBuildType','VIEW',1),(0,1685,'com.liferay.testray.model.TestraySuite','DELETE',2),(0,1686,'com.liferay.testray.model.TestraySuite','PERMISSIONS',4),(0,1687,'com.liferay.testray.model.TestraySuite','REMOVE_CASE',8),(0,1688,'com.liferay.testray.model.TestraySuite','UPDATE_CASE_PARAMETERS',16),(0,1689,'com.liferay.testray.model.TestraySuite','CONFIGURATION',32),(0,1690,'com.liferay.testray.model.TestraySuite','REFRESH_CASES',64),(0,1691,'com.liferay.testray.model.TestraySuite','COPY',128),(0,1692,'com.liferay.testray.model.TestraySuite','EDIT',256),(0,1693,'com.liferay.testray.model.TestraySuite','UPDATE',512),(0,1694,'com.liferay.testray.model.TestraySuite','VIEW',1),(0,1695,'com.liferay.testray.model.TestraySuite','UPDATE_CASES',1024),(0,1696,'com.liferay.testray.model.TestrayProject','DELETE',2),(0,1697,'com.liferay.testray.model.TestrayProject','PERMISSIONS',4),(0,1698,'com.liferay.testray.model.TestrayProject','CONFIGURATION',8),(0,1699,'com.liferay.testray.model.TestrayProject','COPY',16),(0,1700,'com.liferay.testray.model.TestrayProject','DELETE_TREE',32),(0,1701,'com.liferay.testray.model.TestrayProject','EDIT',64),(0,1702,'com.liferay.testray.model.TestrayProject','UPDATE',128),(0,1703,'com.liferay.testray.model.TestrayProject','VIEW',1),(0,1704,'com.liferay.testray.model.TestrayCaseResult','DELETE',2),(0,1705,'com.liferay.testray.model.TestrayCaseResult','PERMISSIONS',4),(0,1706,'com.liferay.testray.model.TestrayCaseResult','CONFIGURATION',8),(0,1707,'com.liferay.testray.model.TestrayCaseResult','UPDATE_STATUS',16),(0,1708,'com.liferay.testray.model.TestrayCaseResult','UPDATE_USER',32),(0,1709,'com.liferay.testray.model.TestrayCaseResult','EDIT',64),(0,1710,'com.liferay.testray.model.TestrayCaseResult','UPDATE',128),(0,1711,'com.liferay.testray.model.TestrayCaseResult','VIEW',1),(0,1712,'com.liferay.testray.model.TestrayFactorOption','DELETE',2),(0,1713,'com.liferay.testray.model.TestrayFactorOption','PERMISSIONS',4),(0,1714,'com.liferay.testray.model.TestrayFactorOption','CONFIGURATION',8),(0,1715,'com.liferay.testray.model.TestrayFactorOption','EDIT',16),(0,1716,'com.liferay.testray.model.TestrayFactorOption','UPDATE',32),(0,1717,'com.liferay.testray.model.TestrayComponent','DELETE',2),(0,1718,'com.liferay.testray.model.TestrayComponent','PERMISSIONS',4),(0,1719,'com.liferay.testray.model.TestrayComponent','CONFIGURATION',8),(0,1720,'com.liferay.testray.model.TestrayComponent','EDIT',16),(0,1721,'com.liferay.testray.model.TestrayComponent','UPDATE',32),(0,1722,'com.liferay.testray.model.TestrayComponent','VIEW',1),(0,1723,'com.liferay.testray.model.TestrayBuild','UPDATE_PROMOTED',2),(0,1724,'com.liferay.testray.model.TestrayBuild','DELETE',4),(0,1725,'com.liferay.testray.model.TestrayBuild','PERMISSIONS',8),(0,1726,'com.liferay.testray.model.TestrayBuild','CONFIGURATION',16),(0,1727,'com.liferay.testray.model.TestrayBuild','UPDATE_STATUS',32),(0,1728,'com.liferay.testray.model.TestrayBuild','EDIT',64),(0,1729,'com.liferay.testray.model.TestrayBuild','UPDATE',128),(0,1730,'com.liferay.testray.model.TestrayBuild','VIEW',1),(0,1731,'com.liferay.testray.model.TestrayBuild','UPDATE_CASES',256),(0,1732,'com.liferay.testray.model.TestrayFactorCategory','DELETE',2),(0,1733,'com.liferay.testray.model.TestrayFactorCategory','PERMISSIONS',4),(0,1734,'com.liferay.testray.model.TestrayFactorCategory','CONFIGURATION',8),(0,1735,'com.liferay.testray.model.TestrayFactorCategory','EDIT',16),(0,1736,'com.liferay.testray.model.TestrayFactorCategory','UPDATE',32),(0,1737,'com.liferay.testray.model.TestrayTeam','DELETE',2),(0,1738,'com.liferay.testray.model.TestrayTeam','PERMISSIONS',4),(0,1739,'com.liferay.testray.model.TestrayTeam','CONFIGURATION',8),(0,1740,'com.liferay.testray.model.TestrayTeam','EDIT',16),(0,1741,'com.liferay.testray.model.TestrayTeam','UPDATE',32),(0,1742,'1_WAR_osbtestrayportlet','ACCESS_IN_CONTROL_PANEL',70368744177664),(0,1743,'com_liferay_comment_web_portlet_CommentPortlet','VIEW',1),(0,1744,'com_liferay_comment_web_portlet_CommentPortlet','ADD_TO_PAGE',2),(0,1745,'com_liferay_comment_web_portlet_CommentPortlet','CONFIGURATION',4),(0,1746,'com_liferay_comment_web_portlet_CommentPortlet','PERMISSIONS',8),(0,1747,'com_liferay_comment_web_portlet_CommentPortlet','PREFERENCES',16),(0,1748,'com_liferay_comment_web_portlet_CommentPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1749,'com_liferay_polls_web_portlet_PollsDisplayPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1750,'com_liferay_polls_web_portlet_PollsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1751,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet','VIEW',1),(0,1752,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet','ADD_TO_PAGE',2),(0,1753,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet','CONFIGURATION',4),(0,1754,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet','PERMISSIONS',8),(0,1755,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet','PREFERENCES',16),(0,1756,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1757,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet','VIEW',1),(0,1758,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet','ADD_TO_PAGE',2),(0,1759,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet','CONFIGURATION',4),(0,1760,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet','PERMISSIONS',8),(0,1761,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet','PREFERENCES',16),(0,1762,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1763,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet','VIEW',1),(0,1764,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet','ADD_TO_PAGE',2),(0,1765,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet','CONFIGURATION',4),(0,1766,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet','PERMISSIONS',8),(0,1767,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet','PREFERENCES',16),(0,1768,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1769,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet','VIEW',1),(0,1770,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet','ADD_TO_PAGE',2),(0,1771,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet','CONFIGURATION',4),(0,1772,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet','PERMISSIONS',8),(0,1773,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet','PREFERENCES',16),(0,1774,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1775,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet','VIEW',1),(0,1776,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet','ADD_TO_PAGE',2),(0,1777,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet','CONFIGURATION',4),(0,1778,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet','PERMISSIONS',8),(0,1779,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet','PREFERENCES',16),(0,1780,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1781,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet','VIEW',1),(0,1782,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet','ADD_TO_PAGE',2),(0,1783,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet','CONFIGURATION',4),(0,1784,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet','PERMISSIONS',8),(0,1785,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet','PREFERENCES',16),(0,1786,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1787,'com_liferay_image_editor_web_portlet_ImageEditorPortlet','VIEW',1),(0,1788,'com_liferay_image_editor_web_portlet_ImageEditorPortlet','ADD_TO_PAGE',2),(0,1789,'com_liferay_image_editor_web_portlet_ImageEditorPortlet','CONFIGURATION',4),(0,1790,'com_liferay_image_editor_web_portlet_ImageEditorPortlet','PERMISSIONS',8),(0,1791,'com_liferay_image_editor_web_portlet_ImageEditorPortlet','PREFERENCES',16),(0,1792,'com_liferay_image_editor_web_portlet_ImageEditorPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1793,'hello_soy_portlet','VIEW',1),(0,1794,'hello_soy_portlet','ADD_TO_PAGE',2),(0,1795,'hello_soy_portlet','CONFIGURATION',4),(0,1796,'hello_soy_portlet','PERMISSIONS',8),(0,1797,'hello_soy_portlet','PREFERENCES',16),(0,1798,'hello_soy_portlet','ACCESS_IN_CONTROL_PANEL',32),(0,1799,'com_liferay_hello_world_web_portlet_HelloWorldPortlet','VIEW',1),(0,1800,'com_liferay_hello_world_web_portlet_HelloWorldPortlet','ADD_TO_PAGE',2),(0,1801,'com_liferay_hello_world_web_portlet_HelloWorldPortlet','CONFIGURATION',4),(0,1802,'com_liferay_hello_world_web_portlet_HelloWorldPortlet','PERMISSIONS',8),(0,1803,'com_liferay_hello_world_web_portlet_HelloWorldPortlet','PREFERENCES',16),(0,1804,'com_liferay_hello_world_web_portlet_HelloWorldPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1805,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet','VIEW',1),(0,1806,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet','ADD_TO_PAGE',2),(0,1807,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet','CONFIGURATION',4),(0,1808,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet','PERMISSIONS',8),(0,1809,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet','PREFERENCES',16),(0,1810,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1811,'com_liferay_login_web_portlet_FastLoginPortlet','VIEW',1),(0,1812,'com_liferay_login_web_portlet_FastLoginPortlet','ADD_TO_PAGE',2),(0,1813,'com_liferay_login_web_portlet_FastLoginPortlet','CONFIGURATION',4),(0,1814,'com_liferay_login_web_portlet_FastLoginPortlet','PERMISSIONS',8),(0,1815,'com_liferay_login_web_portlet_FastLoginPortlet','PREFERENCES',16),(0,1816,'com_liferay_login_web_portlet_FastLoginPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1817,'com_liferay_login_web_portlet_LoginPortlet','PERMISSIONS',2),(0,1818,'com_liferay_login_web_portlet_LoginPortlet','PREFERENCES',4),(0,1819,'com_liferay_login_web_portlet_LoginPortlet','CONFIGURATION',8),(0,1820,'com_liferay_login_web_portlet_LoginPortlet','VIEW',1),(0,1821,'com_liferay_login_web_portlet_LoginPortlet','ADD_TO_PAGE',16),(0,1822,'com_liferay_monitoring_web_portlet_MonitoringPortlet','PERMISSIONS',2),(0,1823,'com_liferay_monitoring_web_portlet_MonitoringPortlet','PREFERENCES',4),(0,1824,'com_liferay_monitoring_web_portlet_MonitoringPortlet','CONFIGURATION',8),(0,1825,'com_liferay_monitoring_web_portlet_MonitoringPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,1826,'com_liferay_monitoring_web_portlet_MonitoringPortlet','VIEW',1),(0,1827,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet','PERMISSIONS',2),(0,1828,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet','PREFERENCES',4),(0,1829,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet','CONFIGURATION',8),(0,1830,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,1831,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet','VIEW',1),(0,1832,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet','PERMISSIONS',2),(0,1833,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet','PREFERENCES',4),(0,1834,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet','CONFIGURATION',8),(0,1835,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,1836,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet','VIEW',1),(0,1837,'com_liferay_server_admin_web_portlet_ServerAdminPortlet','PERMISSIONS',2),(0,1838,'com_liferay_server_admin_web_portlet_ServerAdminPortlet','PREFERENCES',4),(0,1839,'com_liferay_server_admin_web_portlet_ServerAdminPortlet','CONFIGURATION',8),(0,1840,'com_liferay_server_admin_web_portlet_ServerAdminPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,1841,'com_liferay_server_admin_web_portlet_ServerAdminPortlet','VIEW',1),(0,1842,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet','VIEW',1),(0,1843,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet','ADD_TO_PAGE',2),(0,1844,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet','CONFIGURATION',4),(0,1845,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet','PERMISSIONS',8),(0,1846,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet','PREFERENCES',16),(0,1847,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1848,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1849,'com_liferay_users_admin_web_portlet_UsersAdminPortlet','EXPORT_USER',64),(0,1850,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet','VIEW',1),(0,1851,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet','ADD_TO_PAGE',2),(0,1852,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet','CONFIGURATION',4),(0,1853,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet','PERMISSIONS',8),(0,1854,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet','PREFERENCES',16),(0,1855,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1856,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet','VIEW',1),(0,1857,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet','ADD_TO_PAGE',2),(0,1858,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet','CONFIGURATION',4),(0,1859,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet','PERMISSIONS',8),(0,1860,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet','PREFERENCES',16),(0,1861,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1862,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet','VIEW',1),(0,1863,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet','ADD_TO_PAGE',2),(0,1864,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet','CONFIGURATION',4),(0,1865,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet','PERMISSIONS',8),(0,1866,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet','PREFERENCES',16),(0,1867,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1868,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,1869,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet','PERMISSIONS',4),(0,1870,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet','PREFERENCES',8),(0,1871,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet','CONFIGURATION',16),(0,1872,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet','VIEW',1),(0,1873,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet','ADD_TO_PAGE',32),(0,1874,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet','VIEW',1),(0,1875,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet','ADD_TO_PAGE',2),(0,1876,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet','CONFIGURATION',4),(0,1877,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet','PERMISSIONS',8),(0,1878,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet','PREFERENCES',16),(0,1879,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1880,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet','VIEW',1),(0,1881,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet','ADD_TO_PAGE',2),(0,1882,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet','CONFIGURATION',4),(0,1883,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet','PERMISSIONS',8),(0,1884,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet','PREFERENCES',16),(0,1885,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1886,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet','VIEW',1),(0,1887,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet','ADD_TO_PAGE',2),(0,1888,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet','CONFIGURATION',4),(0,1889,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet','PERMISSIONS',8),(0,1890,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet','PREFERENCES',16),(0,1891,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1892,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,1893,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet','PERMISSIONS',4),(0,1894,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet','PREFERENCES',8),(0,1895,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet','CONFIGURATION',16),(0,1896,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet','VIEW',1),(0,1897,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet','ADD_TO_PAGE',32),(0,1898,'com_liferay_asset_web_portlet_AssetPortlet','VIEW',1),(0,1899,'com_liferay_asset_web_portlet_AssetPortlet','ADD_TO_PAGE',2),(0,1900,'com_liferay_asset_web_portlet_AssetPortlet','CONFIGURATION',4),(0,1901,'com_liferay_asset_web_portlet_AssetPortlet','PERMISSIONS',8),(0,1902,'com_liferay_asset_web_portlet_AssetPortlet','PREFERENCES',16),(0,1903,'com_liferay_asset_web_portlet_AssetPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1904,'com_liferay_exportimport_web_portlet_ExportPortlet','VIEW',1),(0,1905,'com_liferay_exportimport_web_portlet_ExportPortlet','ADD_TO_PAGE',2),(0,1906,'com_liferay_exportimport_web_portlet_ExportPortlet','CONFIGURATION',4),(0,1907,'com_liferay_exportimport_web_portlet_ExportPortlet','PERMISSIONS',8),(0,1908,'com_liferay_exportimport_web_portlet_ExportPortlet','PREFERENCES',16),(0,1909,'com_liferay_exportimport_web_portlet_ExportPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1910,'com_liferay_exportimport_web_portlet_ImportPortlet','VIEW',1),(0,1911,'com_liferay_exportimport_web_portlet_ImportPortlet','ADD_TO_PAGE',2),(0,1912,'com_liferay_exportimport_web_portlet_ImportPortlet','CONFIGURATION',4),(0,1913,'com_liferay_exportimport_web_portlet_ImportPortlet','PERMISSIONS',8),(0,1914,'com_liferay_exportimport_web_portlet_ImportPortlet','PREFERENCES',16),(0,1915,'com_liferay_exportimport_web_portlet_ImportPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1916,'com_liferay_iframe_web_portlet_IFramePortlet','VIEW',1),(0,1917,'com_liferay_iframe_web_portlet_IFramePortlet','ADD_TO_PAGE',2),(0,1918,'com_liferay_iframe_web_portlet_IFramePortlet','CONFIGURATION',4),(0,1919,'com_liferay_iframe_web_portlet_IFramePortlet','PERMISSIONS',8),(0,1920,'com_liferay_iframe_web_portlet_IFramePortlet','PREFERENCES',16),(0,1921,'com_liferay_iframe_web_portlet_IFramePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1922,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet','VIEW',1),(0,1923,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet','ADD_TO_PAGE',2),(0,1924,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet','CONFIGURATION',4),(0,1925,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet','PERMISSIONS',8),(0,1926,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet','PREFERENCES',16),(0,1927,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1928,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet','VIEW',1),(0,1929,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet','ADD_TO_PAGE',2),(0,1930,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet','CONFIGURATION',4),(0,1931,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet','PERMISSIONS',8),(0,1932,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet','PREFERENCES',16),(0,1933,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1934,'com_liferay_rss_web_portlet_RSSPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,1935,'com_liferay_rss_web_portlet_RSSPortlet','PERMISSIONS',4),(0,1936,'com_liferay_rss_web_portlet_RSSPortlet','PREFERENCES',8),(0,1937,'com_liferay_rss_web_portlet_RSSPortlet','CONFIGURATION',16),(0,1938,'com_liferay_rss_web_portlet_RSSPortlet','VIEW',1),(0,1939,'com_liferay_rss_web_portlet_RSSPortlet','ADD_TO_PAGE',32),(0,1940,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet','VIEW',1),(0,1941,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet','ADD_TO_PAGE',2),(0,1942,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet','CONFIGURATION',4),(0,1943,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet','PERMISSIONS',8),(0,1944,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet','PREFERENCES',16),(0,1945,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1946,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet','VIEW',1),(0,1947,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet','ADD_TO_PAGE',2),(0,1948,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet','CONFIGURATION',4),(0,1949,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet','PERMISSIONS',8),(0,1950,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet','PREFERENCES',16),(0,1951,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1952,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,1953,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet','PERMISSIONS',4),(0,1954,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet','PREFERENCES',8),(0,1955,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet','CONFIGURATION',16),(0,1956,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet','VIEW',1),(0,1957,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet','ADD_TO_PAGE',32),(0,1958,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet','VIEW',1),(0,1959,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet','ADD_TO_PAGE',2),(0,1960,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet','CONFIGURATION',4),(0,1961,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet','PERMISSIONS',8),(0,1962,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet','PREFERENCES',16),(0,1963,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1964,'com_liferay_xsl_content_web_portlet_XSLContentPortlet','VIEW',1),(0,1965,'com_liferay_xsl_content_web_portlet_XSLContentPortlet','ADD_TO_PAGE',2),(0,1966,'com_liferay_xsl_content_web_portlet_XSLContentPortlet','CONFIGURATION',4),(0,1967,'com_liferay_xsl_content_web_portlet_XSLContentPortlet','PERMISSIONS',8),(0,1968,'com_liferay_xsl_content_web_portlet_XSLContentPortlet','PREFERENCES',16),(0,1969,'com_liferay_xsl_content_web_portlet_XSLContentPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1970,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,1971,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet','PERMISSIONS',4),(0,1972,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet','PREFERENCES',8),(0,1973,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet','CONFIGURATION',16),(0,1974,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet','SUBSCRIBE',32),(0,1975,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet','VIEW',1),(0,1976,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet','ADD_TO_PAGE',64),(0,1977,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet','VIEW',1),(0,1978,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet','ADD_TO_PAGE',2),(0,1979,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet','CONFIGURATION',4),(0,1980,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet','PERMISSIONS',8),(0,1981,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet','PREFERENCES',16),(0,1982,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1983,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet','VIEW',1),(0,1984,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet','ADD_TO_PAGE',2),(0,1985,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet','CONFIGURATION',4),(0,1986,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet','PERMISSIONS',8),(0,1987,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet','PREFERENCES',16),(0,1988,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1989,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet','VIEW',1),(0,1990,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet','ADD_TO_PAGE',2),(0,1991,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet','CONFIGURATION',4),(0,1992,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet','PERMISSIONS',8),(0,1993,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet','PREFERENCES',16),(0,1994,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,1995,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet','VIEW',1),(0,1996,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet','ADD_TO_PAGE',2),(0,1997,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet','CONFIGURATION',4),(0,1998,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet','PERMISSIONS',8),(0,1999,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet','PREFERENCES',16),(0,2000,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2001,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2002,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2003,'com_liferay_expando_web_portlet_ExpandoPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2004,'com_liferay_expando_web_portlet_ExpandoPortlet','ADD_EXPANDO',64),(0,2005,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet','VIEW',1),(0,2006,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet','ADD_TO_PAGE',2),(0,2007,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet','CONFIGURATION',4),(0,2008,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet','PERMISSIONS',8),(0,2009,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet','PREFERENCES',16),(0,2010,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2011,'com_liferay_portal_search_web_portlet_SearchPortlet','VIEW',1),(0,2012,'com_liferay_portal_search_web_portlet_SearchPortlet','ADD_TO_PAGE',2),(0,2013,'com_liferay_portal_search_web_portlet_SearchPortlet','CONFIGURATION',4),(0,2014,'com_liferay_portal_search_web_portlet_SearchPortlet','PERMISSIONS',8),(0,2015,'com_liferay_portal_search_web_portlet_SearchPortlet','PREFERENCES',16),(0,2016,'com_liferay_portal_search_web_portlet_SearchPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2017,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2018,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet','VIEW',1),(0,2019,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet','ADD_TO_PAGE',2),(0,2020,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet','CONFIGURATION',4),(0,2021,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet','PERMISSIONS',8),(0,2022,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet','PREFERENCES',16),(0,2023,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2024,'com_liferay_mentions_web_portlet_MentionsPortlet','VIEW',1),(0,2025,'com_liferay_mentions_web_portlet_MentionsPortlet','ADD_TO_PAGE',2),(0,2026,'com_liferay_mentions_web_portlet_MentionsPortlet','CONFIGURATION',4),(0,2027,'com_liferay_mentions_web_portlet_MentionsPortlet','PERMISSIONS',8),(0,2028,'com_liferay_mentions_web_portlet_MentionsPortlet','PREFERENCES',16),(0,2029,'com_liferay_mentions_web_portlet_MentionsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2030,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2031,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2032,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2033,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet','VIEW',1),(0,2034,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet','ADD_TO_PAGE',2),(0,2035,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet','CONFIGURATION',4),(0,2036,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet','PERMISSIONS',8),(0,2037,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet','PREFERENCES',16),(0,2038,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2039,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2040,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet','VIEW',1),(0,2041,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet','ADD_TO_PAGE',2),(0,2042,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet','CONFIGURATION',4),(0,2043,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet','PERMISSIONS',8),(0,2044,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet','PREFERENCES',16),(0,2045,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2046,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet','VIEW',1),(0,2047,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet','ADD_TO_PAGE',2),(0,2048,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet','CONFIGURATION',4),(0,2049,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet','PERMISSIONS',8),(0,2050,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet','PREFERENCES',16),(0,2051,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2052,'com_liferay_trash_web_portlet_TrashPortlet','VIEW',1),(0,2053,'com_liferay_trash_web_portlet_TrashPortlet','ADD_TO_PAGE',2),(0,2054,'com_liferay_trash_web_portlet_TrashPortlet','CONFIGURATION',4),(0,2055,'com_liferay_trash_web_portlet_TrashPortlet','PERMISSIONS',8),(0,2056,'com_liferay_trash_web_portlet_TrashPortlet','PREFERENCES',16),(0,2057,'com_liferay_trash_web_portlet_TrashPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2058,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet','VIEW',1),(0,2059,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet','ADD_TO_PAGE',2),(0,2060,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet','CONFIGURATION',4),(0,2061,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet','PERMISSIONS',8),(0,2062,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet','PREFERENCES',16),(0,2063,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2064,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2065,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet','VIEW',1),(0,2066,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet','ADD_TO_PAGE',2),(0,2067,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet','CONFIGURATION',4),(0,2068,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet','PERMISSIONS',8),(0,2069,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet','PREFERENCES',16),(0,2070,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2071,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','VIEW',1),(0,2072,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','ADD_TO_PAGE',2),(0,2073,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','CONFIGURATION',4),(0,2074,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','PERMISSIONS',8),(0,2075,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','PREFERENCES',16),(0,2076,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2077,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2078,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','VIEW',1),(0,2079,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','ADD_TO_PAGE',2),(0,2080,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','CONFIGURATION',4),(0,2081,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','PERMISSIONS',8),(0,2082,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','PREFERENCES',16),(0,2083,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2084,'com_liferay_site_admin_web_portlet_SiteAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2085,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2086,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet','PERMISSIONS',2),(0,2087,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet','PREFERENCES',4),(0,2088,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet','CONFIGURATION',8),(0,2089,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,2090,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet','VIEW',1),(0,2091,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet','VIEW',1),(0,2092,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet','ADD_TO_PAGE',2),(0,2093,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet','CONFIGURATION',4),(0,2094,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet','PERMISSIONS',8),(0,2095,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet','PREFERENCES',16),(0,2096,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2097,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2098,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet','VIEW',1),(0,2099,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet','ADD_TO_PAGE',2),(0,2100,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet','CONFIGURATION',4),(0,2101,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet','PERMISSIONS',8),(0,2102,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet','PREFERENCES',16),(0,2103,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2104,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet','PERMISSIONS',2),(0,2105,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet','PREFERENCES',4),(0,2106,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet','CONFIGURATION',8),(0,2107,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet','VIEW',1),(0,2108,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet','ADD_TO_PAGE',16),(0,2109,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet','PERMISSIONS',2),(0,2110,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet','PREFERENCES',4),(0,2111,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet','CONFIGURATION',8),(0,2112,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet','VIEW',1),(0,2113,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet','ADD_TO_PAGE',16),(0,2114,'com_liferay_directory_web_portlet_DirectoryPortlet','PERMISSIONS',2),(0,2115,'com_liferay_directory_web_portlet_DirectoryPortlet','PREFERENCES',4),(0,2116,'com_liferay_directory_web_portlet_DirectoryPortlet','CONFIGURATION',8),(0,2117,'com_liferay_directory_web_portlet_DirectoryPortlet','VIEW',1),(0,2118,'com_liferay_directory_web_portlet_DirectoryPortlet','ADD_TO_PAGE',16),(0,2119,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet','PERMISSIONS',2),(0,2120,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet','PREFERENCES',4),(0,2121,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet','CONFIGURATION',8),(0,2122,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet','VIEW',1),(0,2123,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet','ADD_TO_PAGE',16),(0,2124,'com_liferay_flags_web_portlet_FlagsPortlet','VIEW',1),(0,2125,'com_liferay_flags_web_portlet_FlagsPortlet','ADD_TO_PAGE',2),(0,2126,'com_liferay_flags_web_portlet_FlagsPortlet','CONFIGURATION',4),(0,2127,'com_liferay_flags_web_portlet_FlagsPortlet','PERMISSIONS',8),(0,2128,'com_liferay_flags_web_portlet_FlagsPortlet','PREFERENCES',16),(0,2129,'com_liferay_flags_web_portlet_FlagsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2130,'com_liferay_flags_web_portlet_PageFlagsPortlet','VIEW',1),(0,2131,'com_liferay_flags_web_portlet_PageFlagsPortlet','ADD_TO_PAGE',2),(0,2132,'com_liferay_flags_web_portlet_PageFlagsPortlet','CONFIGURATION',4),(0,2133,'com_liferay_flags_web_portlet_PageFlagsPortlet','PERMISSIONS',8),(0,2134,'com_liferay_flags_web_portlet_PageFlagsPortlet','PREFERENCES',16),(0,2135,'com_liferay_flags_web_portlet_PageFlagsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2136,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet','VIEW',1),(0,2137,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet','ADD_TO_PAGE',2),(0,2138,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet','CONFIGURATION',4),(0,2139,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet','PERMISSIONS',8),(0,2140,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet','PREFERENCES',16),(0,2141,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2142,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet','VIEW',1),(0,2143,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet','ADD_TO_PAGE',2),(0,2144,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet','CONFIGURATION',4),(0,2145,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet','PERMISSIONS',8),(0,2146,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet','PREFERENCES',16),(0,2147,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2148,'com_liferay_quick_note_web_portlet_QuickNotePortlet','VIEW',1),(0,2149,'com_liferay_quick_note_web_portlet_QuickNotePortlet','ADD_TO_PAGE',2),(0,2150,'com_liferay_quick_note_web_portlet_QuickNotePortlet','CONFIGURATION',4),(0,2151,'com_liferay_quick_note_web_portlet_QuickNotePortlet','PERMISSIONS',8),(0,2152,'com_liferay_quick_note_web_portlet_QuickNotePortlet','PREFERENCES',16),(0,2153,'com_liferay_quick_note_web_portlet_QuickNotePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2154,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet','VIEW',1),(0,2155,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet','ADD_TO_PAGE',2),(0,2156,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet','CONFIGURATION',4),(0,2157,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet','PERMISSIONS',8),(0,2158,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet','PREFERENCES',16),(0,2159,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2160,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet','VIEW',1),(0,2161,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet','ADD_TO_PAGE',2),(0,2162,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet','CONFIGURATION',4),(0,2163,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet','PERMISSIONS',8),(0,2164,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet','PREFERENCES',16),(0,2165,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2166,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet','VIEW',1),(0,2167,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet','ADD_TO_PAGE',2),(0,2168,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet','CONFIGURATION',4),(0,2169,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet','PERMISSIONS',8),(0,2170,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet','PREFERENCES',16),(0,2171,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2172,'com_liferay_social_activity_web_portlet_SocialActivityPortlet','PERMISSIONS',2),(0,2173,'com_liferay_social_activity_web_portlet_SocialActivityPortlet','PREFERENCES',4),(0,2174,'com_liferay_social_activity_web_portlet_SocialActivityPortlet','CONFIGURATION',8),(0,2175,'com_liferay_social_activity_web_portlet_SocialActivityPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,2176,'com_liferay_social_activity_web_portlet_SocialActivityPortlet','VIEW',1),(0,2177,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet','VIEW',1),(0,2178,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet','ADD_TO_PAGE',2),(0,2179,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet','CONFIGURATION',4),(0,2180,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet','PERMISSIONS',8),(0,2181,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet','PREFERENCES',16),(0,2182,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2183,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet','VIEW',1),(0,2184,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet','ADD_TO_PAGE',2),(0,2185,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet','CONFIGURATION',4),(0,2186,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet','PERMISSIONS',8),(0,2187,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet','PREFERENCES',16),(0,2188,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2189,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet','VIEW',1),(0,2190,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet','ADD_TO_PAGE',2),(0,2191,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet','CONFIGURATION',4),(0,2192,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet','PERMISSIONS',8),(0,2193,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet','PREFERENCES',16),(0,2194,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2195,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet','VIEW',1),(0,2196,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet','ADD_TO_PAGE',2),(0,2197,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet','CONFIGURATION',4),(0,2198,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet','PERMISSIONS',8),(0,2199,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet','PREFERENCES',16),(0,2200,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2201,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2202,'com_liferay_my_account_web_portlet_MyAccountPortlet','PERMISSIONS',2),(0,2203,'com_liferay_my_account_web_portlet_MyAccountPortlet','PREFERENCES',4),(0,2204,'com_liferay_my_account_web_portlet_MyAccountPortlet','CONFIGURATION',8),(0,2205,'com_liferay_my_account_web_portlet_MyAccountPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,2206,'com_liferay_my_account_web_portlet_MyAccountPortlet','VIEW',1),(0,2207,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet','PERMISSIONS',2),(0,2208,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet','PREFERENCES',4),(0,2209,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet','CONFIGURATION',8),(0,2210,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,2211,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet','VIEW',1),(0,2212,'com_liferay_web_proxy_web_portlet_WebProxyPortlet','VIEW',1),(0,2213,'com_liferay_web_proxy_web_portlet_WebProxyPortlet','ADD_TO_PAGE',2),(0,2214,'com_liferay_web_proxy_web_portlet_WebProxyPortlet','CONFIGURATION',4),(0,2215,'com_liferay_web_proxy_web_portlet_WebProxyPortlet','PERMISSIONS',8),(0,2216,'com_liferay_web_proxy_web_portlet_WebProxyPortlet','PREFERENCES',16),(0,2217,'com_liferay_web_proxy_web_portlet_WebProxyPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2218,'com_liferay_exportimport_web_portlet_ExportImportPortlet','VIEW',1),(0,2219,'com_liferay_exportimport_web_portlet_ExportImportPortlet','ADD_TO_PAGE',2),(0,2220,'com_liferay_exportimport_web_portlet_ExportImportPortlet','CONFIGURATION',4),(0,2221,'com_liferay_exportimport_web_portlet_ExportImportPortlet','PERMISSIONS',8),(0,2222,'com_liferay_exportimport_web_portlet_ExportImportPortlet','PREFERENCES',16),(0,2223,'com_liferay_exportimport_web_portlet_ExportImportPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2224,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet','VIEW',1),(0,2225,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet','ADD_TO_PAGE',2),(0,2226,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet','CONFIGURATION',4),(0,2227,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet','PERMISSIONS',8),(0,2228,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet','PREFERENCES',16),(0,2229,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2230,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet','VIEW',1),(0,2231,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet','ADD_TO_PAGE',2),(0,2232,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet','CONFIGURATION',4),(0,2233,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet','PERMISSIONS',8),(0,2234,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet','PREFERENCES',16),(0,2235,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2236,'com_liferay_site_my_sites_web_portlet_MySitesPortlet','PERMISSIONS',2),(0,2237,'com_liferay_site_my_sites_web_portlet_MySitesPortlet','PREFERENCES',4),(0,2238,'com_liferay_site_my_sites_web_portlet_MySitesPortlet','CONFIGURATION',8),(0,2239,'com_liferay_site_my_sites_web_portlet_MySitesPortlet','VIEW',1),(0,2240,'com_liferay_site_my_sites_web_portlet_MySitesPortlet','ADD_TO_PAGE',16),(0,2241,'com_liferay_staging_bar_web_portlet_StagingBarPortlet','VIEW',1),(0,2242,'com_liferay_staging_bar_web_portlet_StagingBarPortlet','ADD_TO_PAGE',2),(0,2243,'com_liferay_staging_bar_web_portlet_StagingBarPortlet','CONFIGURATION',4),(0,2244,'com_liferay_staging_bar_web_portlet_StagingBarPortlet','PERMISSIONS',8),(0,2245,'com_liferay_staging_bar_web_portlet_StagingBarPortlet','PREFERENCES',16),(0,2246,'com_liferay_staging_bar_web_portlet_StagingBarPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2247,'com_liferay_message_boards_web_portlet_MBAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2248,'com_liferay_document_library_web_portlet_DLAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2249,'com_liferay_document_library_web_portlet_DLPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',32),(0,2250,'com_liferay_document_library_web_portlet_IGDisplayPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2251,'com_liferay_wiki_web_portlet_WikiAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2252,'com_liferay_wiki_web_portlet_WikiDisplayPortlet','VIEW',1),(0,2253,'com_liferay_wiki_web_portlet_WikiDisplayPortlet','ADD_TO_PAGE',2),(0,2254,'com_liferay_wiki_web_portlet_WikiDisplayPortlet','CONFIGURATION',4),(0,2255,'com_liferay_wiki_web_portlet_WikiDisplayPortlet','PERMISSIONS',8),(0,2256,'com_liferay_wiki_web_portlet_WikiDisplayPortlet','PREFERENCES',16),(0,2257,'com_liferay_wiki_web_portlet_WikiDisplayPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2258,'com_liferay_wiki_web_portlet_WikiPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',32),(0,2259,'com_liferay_blogs_web_portlet_BlogsAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2260,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet','VIEW',1),(0,2261,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet','ADD_TO_PAGE',2),(0,2262,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet','CONFIGURATION',4),(0,2263,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet','PERMISSIONS',8),(0,2264,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet','PREFERENCES',16),(0,2265,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2266,'com_liferay_blogs_web_portlet_BlogsPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',32),(0,2267,'com_liferay_notifications_web_portlet_NotificationsPortlet','VIEW',1),(0,2268,'com_liferay_notifications_web_portlet_NotificationsPortlet','ADD_TO_PAGE',2),(0,2269,'com_liferay_notifications_web_portlet_NotificationsPortlet','CONFIGURATION',4),(0,2270,'com_liferay_notifications_web_portlet_NotificationsPortlet','PERMISSIONS',8),(0,2271,'com_liferay_notifications_web_portlet_NotificationsPortlet','PREFERENCES',16),(0,2272,'com_liferay_notifications_web_portlet_NotificationsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2273,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet','VIEW',1),(0,2274,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet','ADD_TO_PAGE',2),(0,2275,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet','CONFIGURATION',4),(0,2276,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet','PERMISSIONS',8),(0,2277,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet','PREFERENCES',16),(0,2278,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2279,'com_liferay_microblogs_web_portlet_MicroblogsPortlet','PERMISSIONS',2),(0,2280,'com_liferay_microblogs_web_portlet_MicroblogsPortlet','PREFERENCES',4),(0,2281,'com_liferay_microblogs_web_portlet_MicroblogsPortlet','CONFIGURATION',8),(0,2282,'com_liferay_microblogs_web_portlet_MicroblogsPortlet','VIEW',1),(0,2283,'com_liferay_microblogs_web_portlet_MicroblogsPortlet','ADD_TO_PAGE',16),(0,2284,'com.liferay.microblogs.model.MicroblogsEntry','DELETE',2),(0,2285,'com.liferay.microblogs.model.MicroblogsEntry','PERMISSIONS',4),(0,2286,'com.liferay.microblogs.model.MicroblogsEntry','UPDATE',8),(0,2287,'com.liferay.microblogs.model.MicroblogsEntry','VIEW',1),(0,2288,'com.liferay.microblogs','ADD_ENTRY',2),(0,2289,'com.liferay.microblogs','PERMISSIONS',4),(0,2290,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet','VIEW',1),(0,2291,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet','ADD_TO_PAGE',2),(0,2292,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet','CONFIGURATION',4),(0,2293,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet','PERMISSIONS',8),(0,2294,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet','PREFERENCES',16),(0,2295,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2296,'com_liferay_calendar_web_portlet_CalendarPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2297,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2298,'com_liferay_contacts_web_portlet_ContactsCenterPortlet','PERMISSIONS',2),(0,2299,'com_liferay_contacts_web_portlet_ContactsCenterPortlet','PREFERENCES',4),(0,2300,'com_liferay_contacts_web_portlet_ContactsCenterPortlet','CONFIGURATION',8),(0,2301,'com_liferay_contacts_web_portlet_ContactsCenterPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,2302,'com_liferay_contacts_web_portlet_ContactsCenterPortlet','VIEW',1),(0,2303,'com_liferay_contacts_web_portlet_ContactsCenterPortlet','ADD_TO_PAGE',32),(0,2304,'com_liferay_contacts_web_portlet_MembersPortlet','VIEW',1),(0,2305,'com_liferay_contacts_web_portlet_MembersPortlet','ADD_TO_PAGE',2),(0,2306,'com_liferay_contacts_web_portlet_MembersPortlet','CONFIGURATION',4),(0,2307,'com_liferay_contacts_web_portlet_MembersPortlet','PERMISSIONS',8),(0,2308,'com_liferay_contacts_web_portlet_MembersPortlet','PREFERENCES',16),(0,2309,'com_liferay_contacts_web_portlet_MembersPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2310,'com_liferay_contacts_web_portlet_MyContactsPortlet','VIEW',1),(0,2311,'com_liferay_contacts_web_portlet_MyContactsPortlet','ADD_TO_PAGE',2),(0,2312,'com_liferay_contacts_web_portlet_MyContactsPortlet','CONFIGURATION',4),(0,2313,'com_liferay_contacts_web_portlet_MyContactsPortlet','PERMISSIONS',8),(0,2314,'com_liferay_contacts_web_portlet_MyContactsPortlet','PREFERENCES',16),(0,2315,'com_liferay_contacts_web_portlet_MyContactsPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2316,'com_liferay_contacts_web_portlet_ProfilePortlet','VIEW',1),(0,2317,'com_liferay_contacts_web_portlet_ProfilePortlet','ADD_TO_PAGE',2),(0,2318,'com_liferay_contacts_web_portlet_ProfilePortlet','CONFIGURATION',4),(0,2319,'com_liferay_contacts_web_portlet_ProfilePortlet','PERMISSIONS',8),(0,2320,'com_liferay_contacts_web_portlet_ProfilePortlet','PREFERENCES',16),(0,2321,'com_liferay_contacts_web_portlet_ProfilePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2322,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2323,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet','VIEW',1),(0,2324,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet','ADD_TO_PAGE',2),(0,2325,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet','CONFIGURATION',4),(0,2326,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet','PERMISSIONS',8),(0,2327,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet','PREFERENCES',16),(0,2328,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2329,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet','VIEW',1),(0,2330,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet','ADD_TO_PAGE',2),(0,2331,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet','CONFIGURATION',4),(0,2332,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet','PERMISSIONS',8),(0,2333,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet','PREFERENCES',16),(0,2334,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2335,'com_liferay_layout_admin_web_portlet_MyPagesPortlet','PERMISSIONS',2),(0,2336,'com_liferay_layout_admin_web_portlet_MyPagesPortlet','PREFERENCES',4),(0,2337,'com_liferay_layout_admin_web_portlet_MyPagesPortlet','CONFIGURATION',8),(0,2338,'com_liferay_layout_admin_web_portlet_MyPagesPortlet','ACCESS_IN_CONTROL_PANEL',16),(0,2339,'com_liferay_layout_admin_web_portlet_MyPagesPortlet','VIEW',1),(0,2340,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2341,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2342,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet','PERMISSIONS',2),(0,2343,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet','PREFERENCES',4),(0,2344,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet','CONFIGURATION',8),(0,2345,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet','VIEW',1),(0,2346,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet','ADD_TO_PAGE',16),(0,2347,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,2348,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','PERMISSIONS',4),(0,2349,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','PREFERENCES',8),(0,2350,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','CONFIGURATION',16),(0,2351,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','VIEW',1),(0,2352,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet','ADD_TO_PAGE',32),(0,2353,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,2354,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet','PERMISSIONS',4),(0,2355,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet','PREFERENCES',8),(0,2356,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet','CONFIGURATION',16),(0,2357,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet','VIEW',1),(0,2358,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet','ADD_TO_PAGE',32),(0,2359,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet','ADD_PORTLET_DISPLAY_TEMPLATE',2),(0,2360,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet','PERMISSIONS',4),(0,2361,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet','PREFERENCES',8),(0,2362,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet','CONFIGURATION',16),(0,2363,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet','VIEW',1),(0,2364,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet','ADD_TO_PAGE',32),(0,2365,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2366,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2367,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet','VIEW',1),(0,2368,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet','ADD_TO_PAGE',2),(0,2369,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet','CONFIGURATION',4),(0,2370,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet','PERMISSIONS',8),(0,2371,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet','PREFERENCES',16),(0,2372,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2373,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2374,'com_liferay_portal_security_audit_web_portlet_AuditPortlet','VIEW',1),(0,2375,'com_liferay_portal_security_audit_web_portlet_AuditPortlet','ADD_TO_PAGE',2),(0,2376,'com_liferay_portal_security_audit_web_portlet_AuditPortlet','CONFIGURATION',4),(0,2377,'com_liferay_portal_security_audit_web_portlet_AuditPortlet','PERMISSIONS',8),(0,2378,'com_liferay_portal_security_audit_web_portlet_AuditPortlet','PREFERENCES',16),(0,2379,'com_liferay_portal_security_audit_web_portlet_AuditPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2380,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2381,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2382,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2383,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2384,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet','VIEW',1),(0,2385,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet','ADD_TO_PAGE',2),(0,2386,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet','CONFIGURATION',4),(0,2387,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet','PERMISSIONS',8),(0,2388,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet','PREFERENCES',16),(0,2389,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2390,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet','VIEW',1),(0,2391,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet','ADD_TO_PAGE',2),(0,2392,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet','CONFIGURATION',4),(0,2393,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet','PERMISSIONS',8),(0,2394,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet','PREFERENCES',16),(0,2395,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2396,'com_liferay_journal_content_web_portlet_JournalContentPortlet','PERMISSIONS',2),(0,2397,'com_liferay_journal_content_web_portlet_JournalContentPortlet','PREFERENCES',4),(0,2398,'com_liferay_journal_content_web_portlet_JournalContentPortlet','CONFIGURATION',8),(0,2399,'com_liferay_journal_content_web_portlet_JournalContentPortlet','VIEW',1),(0,2400,'com_liferay_journal_content_web_portlet_JournalContentPortlet','ADD_TO_PAGE',16),(0,2401,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet','VIEW',1),(0,2402,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet','ADD_TO_PAGE',2),(0,2403,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet','CONFIGURATION',4),(0,2404,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet','PERMISSIONS',8),(0,2405,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet','PREFERENCES',16),(0,2406,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2407,'com_liferay_journal_web_portlet_JournalPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2408,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet','VIEW',1),(0,2409,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet','ADD_TO_PAGE',2),(0,2410,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet','CONFIGURATION',4),(0,2411,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet','PERMISSIONS',8),(0,2412,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet','PREFERENCES',16),(0,2413,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet','ACCESS_IN_CONTROL_PANEL',32),(0,2414,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet','VIEW',1),(0,2415,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet','ADD_TO_PAGE',2),(0,2416,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet','CONFIGURATION',4),(0,2417,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet','PERMISSIONS',8),(0,2418,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet','PREFERENCES',16),(0,2419,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet','ACCESS_IN_CONTROL_PANEL',32);
UNLOCK TABLES;

--
-- Table structure for table `ResourceBlock`
--

CREATE TABLE `ResourceBlock` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `resourceBlockId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `permissionsHash` varchar(75) DEFAULT NULL,
  `referenceCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceBlockId`),
  UNIQUE KEY `IX_AEEA209C` (`companyId`,`groupId`,`name`,`permissionsHash`),
  KEY `IX_2D4CC782` (`companyId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ResourceBlock`
--

LOCK TABLES `ResourceBlock` WRITE;
INSERT INTO `ResourceBlock` VALUES (0,1,20116,20143,'com.liferay.calendar.model.CalendarResource','305ed4810720b3a955d0a89f6caf5c5792e31fac',1),(0,4,20116,20143,'com.liferay.calendar.model.Calendar','059559173ca75d032d120c51f3db03459e169908',1);
UNLOCK TABLES;

--
-- Table structure for table `ResourceBlockPermission`
--

CREATE TABLE `ResourceBlockPermission` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `resourceBlockPermissionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceBlockPermissionId`),
  UNIQUE KEY `IX_D63D20BB` (`resourceBlockId`,`roleId`),
  KEY `IX_20A2E3D9` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ResourceBlockPermission`
--

LOCK TABLES `ResourceBlockPermission` WRITE;
INSERT INTO `ResourceBlockPermission` VALUES (0,31255,20116,1,20124,31),(0,31257,20116,2,20124,63),(0,31258,20116,3,20124,63),(0,31259,20116,3,20131,17),(0,31260,20116,4,20123,1),(0,31261,20116,4,20124,63),(0,31262,20116,4,20131,17);
UNLOCK TABLES;

--
-- Table structure for table `ResourcePermission`
--

CREATE TABLE `ResourcePermission` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `resourcePermissionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `primKey` varchar(255) DEFAULT NULL,
  `primKeyId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  `viewActionId` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`resourcePermissionId`),
  UNIQUE KEY `IX_8D83D0CE` (`companyId`,`name`,`scope`,`primKey`,`roleId`),
  KEY `IX_49AEC6F3` (`companyId`,`name`,`scope`,`primKeyId`,`roleId`,`viewActionId`),
  KEY `IX_26284944` (`companyId`,`primKey`),
  KEY `IX_F6BAE86A` (`companyId`,`scope`,`primKey`),
  KEY `IX_D5F1E2A2` (`name`),
  KEY `IX_A37A0588` (`roleId`),
  KEY `IX_F4555981` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ResourcePermission`
--

LOCK TABLES `ResourcePermission` WRITE;
INSERT INTO `ResourcePermission` VALUES (0,1,20116,'com.liferay.portal.kernel.model.Role',4,'20122',20122,20124,0,127,1),(0,2,20116,'com.liferay.portal.kernel.model.Role',4,'20123',20123,20124,0,127,1),(0,3,20116,'com.liferay.portal.kernel.model.Role',4,'20124',20124,20124,0,127,1),(0,4,20116,'com.liferay.portal.kernel.model.Role',4,'20125',20125,20124,0,127,1),(0,5,20116,'com.liferay.portal.kernel.model.Role',4,'20126',20126,20124,0,127,1),(0,6,20116,'com.liferay.portal.kernel.model.Role',4,'20127',20127,20124,0,127,1),(0,7,20116,'com.liferay.portal.kernel.model.Role',4,'20128',20128,20124,0,127,1),(0,8,20116,'com.liferay.portal.kernel.model.Role',4,'20129',20129,20124,0,127,1),(0,9,20116,'com.liferay.portal.kernel.model.Role',4,'20130',20130,20124,0,127,1),(0,10,20116,'com.liferay.portal.kernel.model.Role',4,'20131',20131,20124,0,127,1),(0,11,20116,'com.liferay.portal.kernel.model.Role',4,'20132',20132,20124,0,127,1),(0,12,20116,'com.liferay.portal.kernel.model.Role',4,'20122',20122,20126,0,1,1),(0,13,20116,'com.liferay.portal.kernel.model.Role',4,'20123',20123,20126,0,1,1),(0,14,20116,'com.liferay.portal.kernel.model.Role',4,'20124',20124,20126,0,1,1),(0,15,20116,'com.liferay.portal.kernel.model.Role',4,'20125',20125,20126,0,1,1),(0,16,20116,'com.liferay.portal.kernel.model.Role',4,'20126',20126,20126,0,1,1),(0,17,20116,'com.liferay.portal.kernel.model.Role',4,'20127',20127,20126,0,1,1),(0,18,20116,'com.liferay.portal.kernel.model.Role',4,'20128',20128,20126,0,1,1),(0,19,20116,'com.liferay.portal.kernel.model.Role',4,'20129',20129,20126,0,1,1),(0,20,20116,'com.liferay.portal.kernel.model.Role',4,'20130',20130,20126,0,1,1),(0,21,20116,'com.liferay.portal.kernel.model.Role',4,'20131',20131,20126,0,1,1),(0,22,20116,'com.liferay.portal.kernel.model.Role',4,'20132',20132,20126,0,1,1),(0,23,20116,'com.liferay.portal.kernel.model.Group',4,'20133',20133,20124,0,33554431,1),(0,24,20116,'com.liferay.portal.kernel.model.Layout',4,'20137',20137,20124,20120,1023,1),(0,25,20116,'com.liferay.portal.kernel.model.Layout',4,'20137',20137,20131,0,529,1),(0,26,20116,'com.liferay.portal.kernel.model.Layout',4,'20137',20137,20123,0,1,1),(0,27,20116,'com.liferay.portal.kernel.model.Group',4,'20140',20140,20124,0,33554431,1),(0,28,20116,'com.liferay.portal.kernel.model.Group',4,'20143',20143,20124,0,33554431,1),(0,29,20116,'com.liferay.portal.kernel.model.Layout',4,'20146',20146,20124,20120,1023,1),(0,30,20116,'com.liferay.portal.kernel.model.Layout',4,'20146',20146,20131,0,529,1),(0,31,20116,'com.liferay.portal.kernel.model.Layout',4,'20146',20146,20123,0,1,1),(0,32,20116,'com.liferay.portal.kernel.model.Group',4,'20149',20149,20124,0,33554431,1),(0,33,20116,'com.liferay.portal.kernel.model.Layout',2,'20149',20149,20126,0,1,1),(0,34,20116,'com.liferay.portal.kernel.model.Group',2,'20149',20149,20125,0,1280,0),(0,35,20116,'com.liferay.portal.kernel.model.Group',4,'20152',20152,20124,0,33554431,1),(0,36,20116,'com.liferay.portal.kernel.model.PasswordPolicy',4,'20155',20155,20124,0,31,1),(0,37,20116,'com.liferay.portal.kernel.model.Group',4,'20158',20158,20124,0,33554431,1),(0,38,20116,'com.liferay.portal.kernel.model.User',4,'20156',20156,20124,20156,31,1),(0,39,20116,'90',4,'90',90,20124,0,65534,0),(0,40,20116,'com.liferay.portal.kernel.model.Layout',4,'20162',20162,20124,20120,1023,1),(0,41,20116,'com.liferay.portal.kernel.model.Layout',4,'20162',20162,20131,0,529,1),(0,42,20116,'com.liferay.portal.kernel.model.Layout',4,'20162',20162,20123,0,1,1),(0,43,20116,'com.liferay.asset.kernel.model.AssetVocabulary',4,'20164',20164,20124,20120,15,1),(0,44,20116,'com.liferay.expando.kernel.model.ExpandoColumn',4,'20167',20167,20124,0,15,1),(0,45,20116,'com.liferay.expando.kernel.model.ExpandoColumn',4,'20168',20168,20124,0,15,1),(0,46,20116,'com.liferay.expando.kernel.model.ExpandoColumn',4,'20169',20169,20124,0,15,1),(0,47,20116,'com.liferay.expando.kernel.model.ExpandoColumn',4,'20170',20170,20124,0,15,1),(0,48,20116,'com.liferay.expando.kernel.model.ExpandoColumn',4,'20173',20173,20124,0,15,1),(0,49,20116,'com.liferay.expando.kernel.model.ExpandoColumn',4,'20174',20174,20124,0,15,1),(0,101,20116,'com.liferay.portal.kernel.model.Role',4,'29013',29013,20124,0,127,1),(0,102,20116,'com.liferay.portal.kernel.model.Role',4,'29019',29019,20124,0,127,1),(0,103,20116,'com.liferay.portal.kernel.model.Role',4,'29022',29022,20124,0,127,1),(0,104,20116,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition',4,'29032',29032,20124,20120,15,1),(0,201,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29102',29102,20124,20120,15,1),(0,202,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29105',29105,20124,20120,15,1),(0,203,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29108',29108,20124,20120,15,1),(0,204,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29111',29111,20124,20120,15,1),(0,205,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29114',29114,20124,20120,15,1),(0,206,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29117',29117,20124,20120,15,1),(0,207,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29120',29120,20124,20120,15,1),(0,208,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29123',29123,20124,20120,15,1),(0,209,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29126',29126,20124,20120,15,1),(0,210,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29129',29129,20124,20120,15,1),(0,211,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29132',29132,20124,20120,15,1),(0,212,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29135',29135,20124,20120,15,1),(0,213,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29138',29138,20124,20120,15,1),(0,214,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29141',29141,20124,20120,15,1),(0,215,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29144',29144,20124,20120,15,1),(0,216,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29148',29148,20124,20120,15,1),(0,217,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29151',29151,20124,20120,15,1),(0,218,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29155',29155,20124,20120,15,1),(0,219,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29158',29158,20124,20120,15,1),(0,220,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29161',29161,20124,20120,15,1),(0,221,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29165',29165,20124,20120,15,1),(0,222,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29169',29169,20124,20120,15,1),(0,223,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29172',29172,20124,20120,15,1),(0,224,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29175',29175,20124,20120,15,1),(0,225,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29178',29178,20124,20120,15,1),(0,226,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29181',29181,20124,20120,15,1),(0,227,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29184',29184,20124,20120,15,1),(0,228,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'29187',29187,20124,20120,15,1),(0,229,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29190',29190,20124,20120,15,1),(0,230,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29190',29190,20126,0,1,1),(0,231,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29190',29190,20123,0,1,1),(0,232,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29193',29193,20124,20120,15,1),(0,233,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29193',29193,20126,0,1,1),(0,234,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29193',29193,20123,0,1,1),(0,235,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29196',29196,20124,20120,15,1),(0,236,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29196',29196,20126,0,1,1),(0,237,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29196',29196,20123,0,1,1),(0,238,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29199',29199,20124,20120,15,1),(0,239,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29199',29199,20126,0,1,1),(0,240,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29199',29199,20123,0,1,1),(0,241,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29202',29202,20124,20120,15,1),(0,242,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29202',29202,20126,0,1,1),(0,243,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29202',29202,20123,0,1,1),(0,244,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29205',29205,20124,20120,15,1),(0,245,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29205',29205,20126,0,1,1),(0,246,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'29205',29205,20123,0,1,1),(0,301,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'29403',29403,20124,20120,15,1),(0,302,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'29404',29404,20124,20120,15,1),(0,303,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'29405',29405,20124,20120,15,1),(0,401,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30117',30117,20124,20120,15,1),(0,402,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30117',30117,20126,0,1,1),(0,403,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30117',30117,20123,0,1,1),(0,404,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30120',30120,20124,20120,15,1),(0,405,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30120',30120,20126,0,1,1),(0,406,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30120',30120,20123,0,1,1),(0,407,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30123',30123,20124,20120,15,1),(0,408,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30123',30123,20126,0,1,1),(0,409,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30123',30123,20123,0,1,1),(0,410,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30127',30127,20124,20120,15,1),(0,411,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30127',30127,20126,0,1,1),(0,412,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30127',30127,20123,0,1,1),(0,413,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30126',30126,20124,20120,15,1),(0,414,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30126',30126,20126,0,1,1),(0,415,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30126',30126,20123,0,1,1),(0,416,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30132',30132,20124,20120,15,1),(0,417,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30132',30132,20126,0,1,1),(0,418,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30132',30132,20123,0,1,1),(0,419,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30131',30131,20124,20120,15,1),(0,420,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30131',30131,20126,0,1,1),(0,421,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30131',30131,20123,0,1,1),(0,422,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30138',30138,20124,20120,15,1),(0,423,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30138',30138,20126,0,1,1),(0,424,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30138',30138,20123,0,1,1),(0,425,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30137',30137,20124,20120,15,1),(0,426,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30137',30137,20126,0,1,1),(0,427,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30137',30137,20123,0,1,1),(0,428,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30144',30144,20124,20120,15,1),(0,429,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30144',30144,20126,0,1,1),(0,430,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30144',30144,20123,0,1,1),(0,431,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30143',30143,20124,20120,15,1),(0,432,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30143',30143,20126,0,1,1),(0,433,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'30143',30143,20123,0,1,1),(0,434,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30150',30150,20124,20120,15,1),(0,435,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30150',30150,20126,0,1,1),(0,436,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure',4,'30150',30150,20123,0,1,1),(0,437,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'30153',30153,20124,20120,15,1),(0,438,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'30153',30153,20123,0,1,1),(0,439,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'30154',30154,20124,20120,15,1),(0,440,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'30154',30154,20123,0,1,1),(0,501,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle',4,'30808',30808,20124,20120,15,1),(0,502,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle',4,'30808',30808,20126,0,1,1),(0,503,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle',4,'30808',30808,20123,0,1,1),(0,504,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle',4,'30811',30811,20124,20120,15,1),(0,505,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle',4,'30811',30811,20126,0,1,1),(0,506,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle',4,'30811',30811,20123,0,1,1),(0,601,20116,'com.liferay.portal.kernel.model.LayoutSetPrototype',4,'31001',31001,20124,20120,15,1),(0,602,20116,'com.liferay.portal.kernel.model.Group',4,'31002',31002,20124,0,33554431,1),(0,606,20116,'com.liferay.portal.kernel.model.Layout',4,'31013',31013,20124,20120,1023,1),(0,607,20116,'com.liferay.portal.kernel.model.Layout',4,'31013',31013,20131,0,529,1),(0,608,20116,'com.liferay.portal.kernel.model.Layout',4,'31013',31013,20123,0,1,1),(0,609,20116,'1_WAR_lcsportlet',4,'1_WAR_lcsportlet',0,20123,0,1,1),(0,610,20116,'1_WAR_lcsportlet',4,'1_WAR_lcsportlet',0,20124,0,63,1),(0,611,20116,'1_WAR_lcsportlet',4,'1_WAR_lcsportlet',0,20131,0,1,1),(0,612,20116,'1_WAR_lcsportlet',1,'20116',20116,20122,0,2,0),(0,613,20116,'1_WAR_lcsportlet',1,'20116',20116,20123,0,2,0),(0,614,20116,'1_WAR_lcsportlet',1,'20116',20116,20125,0,2,0),(0,615,20116,'1_WAR_lcsportlet',1,'20116',20116,20126,0,2,0),(0,616,20116,'com.liferay.portal.kernel.model.Role',4,'31041',31041,20124,0,127,1),(18,617,20116,'1_WAR_osbtestrayportlet',1,'20116',20116,31041,0,3825073473699,1),(4,618,20116,'com.liferay.testray.model.TestrayBuild',1,'20116',20116,31041,0,227,1),(0,619,20116,'com.liferay.testray.model.TestrayBuildType',1,'20116',20116,31041,0,1,1),(2,620,20116,'com.liferay.testray.model.TestrayCase',1,'20116',20116,31041,0,49,1),(5,621,20116,'com.liferay.testray.model.TestrayCaseResult',1,'20116',20116,31041,0,243,1),(0,622,20116,'com.liferay.testray.model.TestrayComponent',1,'20116',20116,31041,0,1,1),(1,623,20116,'com.liferay.testray.model.TestrayProject',1,'20116',20116,31041,0,17,1),(0,624,20116,'com.liferay.testray.model.TestrayRun',1,'20116',20116,31041,0,1,1),(3,625,20116,'com.liferay.testray.model.TestraySuite',1,'20116',20116,31041,0,771,1),(2,626,20116,'com.liferay.testray.model.TestrayTask',1,'20116',20116,31041,0,26,0),(0,627,20116,'com.liferay.portal.kernel.model.Role',4,'31042',31042,20124,0,127,1),(19,628,20116,'1_WAR_osbtestrayportlet',1,'20116',20116,31042,0,3825081862307,1),(6,629,20116,'com.liferay.testray.model.TestrayBuild',1,'20116',20116,31042,0,487,1),(0,630,20116,'com.liferay.testray.model.TestrayBuildType',1,'20116',20116,31042,0,1,1),(3,631,20116,'com.liferay.testray.model.TestrayCase',1,'20116',20116,31042,0,51,1),(5,632,20116,'com.liferay.testray.model.TestrayCaseResult',1,'20116',20116,31042,0,243,1),(1,633,20116,'com.liferay.testray.model.TestrayCaseType',1,'20116',20116,31042,0,48,0),(2,634,20116,'com.liferay.testray.model.TestrayComponent',1,'20116',20116,31042,0,49,1),(1,635,20116,'com.liferay.testray.model.TestrayFactorCategory',1,'20116',20116,31042,0,48,0),(1,636,20116,'com.liferay.testray.model.TestrayFactorOption',1,'20116',20116,31042,0,48,0),(1,637,20116,'com.liferay.testray.model.TestrayProductVersion',1,'20116',20116,31042,0,48,0),(0,638,20116,'com.liferay.testray.model.TestrayProject',1,'20116',20116,31042,0,1,1),(0,639,20116,'com.liferay.testray.model.TestrayRun',1,'20116',20116,31042,0,1,1),(0,640,20116,'com.liferay.testray.model.TestraySuite',1,'20116',20116,31042,0,1,1),(2,641,20116,'com.liferay.testray.model.TestrayTask',1,'20116',20116,31042,0,26,0),(0,642,20116,'com.liferay.portal.kernel.model.Role',4,'31043',31043,20124,0,127,1),(13,643,20116,'1_WAR_osbtestrayportlet',1,'20116',20116,31043,0,3309675301027,1),(0,644,20116,'com.liferay.testray.model.TestrayBuild',1,'20116',20116,31043,0,1,1),(0,645,20116,'com.liferay.testray.model.TestrayBuildType',1,'20116',20116,31043,0,1,1),(0,646,20116,'com.liferay.testray.model.TestrayCase',1,'20116',20116,31043,0,1,1),(5,647,20116,'com.liferay.testray.model.TestrayCaseResult',1,'20116',20116,31043,0,243,1),(0,648,20116,'com.liferay.testray.model.TestrayComponent',1,'20116',20116,31043,0,1,1),(0,649,20116,'com.liferay.testray.model.TestrayProject',1,'20116',20116,31043,0,1,1),(0,650,20116,'com.liferay.testray.model.TestrayRun',1,'20116',20116,31043,0,1,1),(0,651,20116,'com.liferay.testray.model.TestraySuite',1,'20116',20116,31043,0,1,1),(0,652,20116,'com.liferay.portal.kernel.model.Role',4,'31044',31044,20124,0,127,1),(43,653,20116,'1_WAR_osbtestrayportlet',1,'20116',20116,31044,0,69818987839487,1),(8,654,20116,'com.liferay.testray.model.TestrayBuild',1,'20116',20116,31044,0,511,1),(5,655,20116,'com.liferay.testray.model.TestrayBuildType',1,'20116',20116,31044,0,63,1),(5,656,20116,'com.liferay.testray.model.TestrayCase',1,'20116',20116,31044,0,63,1),(7,657,20116,'com.liferay.testray.model.TestrayCaseResult',1,'20116',20116,31044,0,255,1),(4,658,20116,'com.liferay.testray.model.TestrayCaseType',1,'20116',20116,31044,0,62,0),(5,659,20116,'com.liferay.testray.model.TestrayComponent',1,'20116',20116,31044,0,63,1),(4,660,20116,'com.liferay.testray.model.TestrayFactorCategory',1,'20116',20116,31044,0,62,0),(4,661,20116,'com.liferay.testray.model.TestrayFactorOption',1,'20116',20116,31044,0,62,0),(4,662,20116,'com.liferay.testray.model.TestrayProductVersion',1,'20116',20116,31044,0,62,0),(7,663,20116,'com.liferay.testray.model.TestrayProject',1,'20116',20116,31044,0,255,1),(5,664,20116,'com.liferay.testray.model.TestrayRun',1,'20116',20116,31044,0,63,1),(10,665,20116,'com.liferay.testray.model.TestraySuite',1,'20116',20116,31044,0,2047,1),(4,666,20116,'com.liferay.testray.model.TestrayTeam',1,'20116',20116,31044,0,62,0),(2,667,20116,'com.liferay.testray.model.TestrayTask',1,'20116',20116,31044,0,26,0),(0,668,20116,'com.liferay.portal.kernel.model.Role',4,'31045',31045,20124,0,127,1),(8,669,20116,'1_WAR_osbtestrayportlet',1,'20116',20116,31045,0,2209895221281,1),(0,670,20116,'com.liferay.testray.model.TestrayBuild',1,'20116',20116,31045,0,1,1),(0,671,20116,'com.liferay.testray.model.TestrayBuildType',1,'20116',20116,31045,0,1,1),(0,672,20116,'com.liferay.testray.model.TestrayCase',1,'20116',20116,31045,0,1,1),(0,673,20116,'com.liferay.testray.model.TestrayCaseResult',1,'20116',20116,31045,0,1,1),(0,674,20116,'com.liferay.testray.model.TestrayProject',1,'20116',20116,31045,0,1,1),(0,675,20116,'com.liferay.testray.model.TestrayRun',1,'20116',20116,31045,0,1,1),(0,676,20116,'com.liferay.testray.model.TestraySuite',1,'20116',20116,31045,0,1,1),(0,677,20116,'1_WAR_osbtestrayportlet',4,'1_WAR_osbtestrayportlet',0,20124,0,140737488355327,1),(0,678,20116,'com.liferay.testray.model.TestrayRun',4,'com.liferay.testray.model.TestrayRun',0,20124,0,63,1),(0,679,20116,'com.liferay.testray.model.TestrayTask',4,'com.liferay.testray.model.TestrayTask',0,20124,0,30,0),(0,680,20116,'com.liferay.testray.model.TestrayCaseType',4,'com.liferay.testray.model.TestrayCaseType',0,20124,0,62,0),(0,681,20116,'com.liferay.testray.model.TestrayCase',4,'com.liferay.testray.model.TestrayCase',0,20124,0,63,1),(0,682,20116,'com.liferay.testray.model.TestrayProductVersion',4,'com.liferay.testray.model.TestrayProductVersion',0,20124,0,62,0),(0,683,20116,'com.liferay.testray.model.TestrayBuildType',4,'com.liferay.testray.model.TestrayBuildType',0,20124,0,63,1),(0,684,20116,'com.liferay.testray.model.TestraySuite',4,'com.liferay.testray.model.TestraySuite',0,20124,0,2047,1),(0,685,20116,'com.liferay.testray.model.TestrayProject',4,'com.liferay.testray.model.TestrayProject',0,20124,0,255,1),(0,686,20116,'com.liferay.testray.model.TestrayCaseResult',4,'com.liferay.testray.model.TestrayCaseResult',0,20124,0,255,1),(0,687,20116,'com.liferay.testray.model.TestrayFactorOption',4,'com.liferay.testray.model.TestrayFactorOption',0,20124,0,62,0),(0,688,20116,'com.liferay.testray.model.TestrayComponent',4,'com.liferay.testray.model.TestrayComponent',0,20124,0,63,1),(0,689,20116,'com.liferay.testray.model.TestrayBuild',4,'com.liferay.testray.model.TestrayBuild',0,20124,0,511,1),(0,690,20116,'com.liferay.testray.model.TestrayFactorCategory',4,'com.liferay.testray.model.TestrayFactorCategory',0,20124,0,62,0),(0,691,20116,'com.liferay.testray.model.TestrayTeam',4,'com.liferay.testray.model.TestrayTeam',0,20124,0,62,0),(0,692,20116,'1_WAR_osbtestrayportlet',2,'20149',20149,20125,0,140737488355327,1),(0,693,20116,'com_liferay_comment_web_portlet_CommentPortlet',4,'com_liferay_comment_web_portlet_CommentPortlet',0,20123,0,1,1),(0,694,20116,'com_liferay_comment_web_portlet_CommentPortlet',4,'com_liferay_comment_web_portlet_CommentPortlet',0,20124,0,63,1),(0,695,20116,'com_liferay_comment_web_portlet_CommentPortlet',4,'com_liferay_comment_web_portlet_CommentPortlet',0,20131,0,1,1),(0,696,20116,'com_liferay_comment_web_portlet_CommentPortlet',1,'20116',20116,20123,0,2,0),(0,697,20116,'com_liferay_comment_web_portlet_CommentPortlet',1,'20116',20116,20125,0,2,0),(0,698,20116,'com_liferay_comment_web_portlet_CommentPortlet',1,'20116',20116,20126,0,2,0),(0,699,20116,'com_liferay_polls_web_portlet_PollsDisplayPortlet',4,'com_liferay_polls_web_portlet_PollsDisplayPortlet',0,20123,0,1,1),(0,700,20116,'com_liferay_polls_web_portlet_PollsDisplayPortlet',4,'com_liferay_polls_web_portlet_PollsDisplayPortlet',0,20124,0,63,1),(0,701,20116,'com_liferay_polls_web_portlet_PollsDisplayPortlet',4,'com_liferay_polls_web_portlet_PollsDisplayPortlet',0,20131,0,1,1),(0,702,20116,'com.liferay.polls',4,'com.liferay.polls',0,20124,0,6,0),(0,703,20116,'com.liferay.polls.model.PollsQuestion',4,'com.liferay.polls.model.PollsQuestion',0,20124,0,31,1),(0,704,20116,'com.liferay.polls.model.PollsQuestion',4,'com.liferay.polls.model.PollsQuestion',0,20123,0,1,1),(0,705,20116,'com_liferay_polls_web_portlet_PollsDisplayPortlet',1,'20116',20116,20125,0,2,0),(0,706,20116,'com_liferay_polls_web_portlet_PollsDisplayPortlet',1,'20116',20116,20126,0,2,0),(0,707,20116,'com_liferay_polls_web_portlet_PollsPortlet',4,'com_liferay_polls_web_portlet_PollsPortlet',0,20123,0,1,1),(0,708,20116,'com_liferay_polls_web_portlet_PollsPortlet',4,'com_liferay_polls_web_portlet_PollsPortlet',0,20124,0,63,1),(0,709,20116,'com_liferay_polls_web_portlet_PollsPortlet',4,'com_liferay_polls_web_portlet_PollsPortlet',0,20131,0,1,1),(0,710,20116,'com_liferay_polls_web_portlet_PollsPortlet',1,'20116',20116,20125,0,2,0),(0,711,20116,'com_liferay_polls_web_portlet_PollsPortlet',1,'20116',20116,20126,0,2,0),(0,712,20116,'com_liferay_polls_web_portlet_PollsPortlet',2,'20149',20149,20125,0,63,1),(0,713,20116,'com.liferay.polls',2,'20149',20149,20125,0,6,0),(0,714,20116,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',4,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',0,20123,0,1,1),(0,715,20116,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',4,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',0,20124,0,63,1),(0,716,20116,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',4,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',0,20131,0,1,1),(0,717,20116,'com_liferay_portal_workflow_definition_web_portlet_WorkflowDefinitionPortlet',1,'20116',20116,20122,0,2,0),(0,718,20116,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',4,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',0,20123,0,1,1),(0,719,20116,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',4,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',0,20124,0,63,1),(0,720,20116,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',4,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',0,20131,0,1,1),(0,721,20116,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',1,'20116',20116,20125,0,2,0),(1,722,20116,'com_liferay_portal_workflow_instance_web_portlet_MyWorkflowInstancePortlet',1,'20116',20116,20126,0,34,0),(0,723,20116,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',4,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',0,20123,0,1,1),(0,724,20116,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',4,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',0,20124,0,63,1),(0,725,20116,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',4,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',0,20131,0,1,1),(0,726,20116,'com_liferay_portal_workflow_instance_web_portlet_WorkflowInstancePortlet',1,'20116',20116,20122,0,2,0),(0,727,20116,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet',4,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet',0,20123,0,1,1),(0,728,20116,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet',4,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet',0,20124,0,63,1),(0,729,20116,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet',4,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerLoaderPortlet',0,20131,0,1,1),(0,730,20116,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',4,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',0,20123,0,1,1),(0,731,20116,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',4,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',0,20124,0,63,1),(0,732,20116,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',4,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',0,20131,0,1,1),(0,733,20116,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',1,'20116',20116,20125,0,2,0),(1,734,20116,'com_liferay_portal_workflow_task_web_portlet_MyWorkflowTaskPortlet',1,'20116',20116,20126,0,34,0),(0,735,20116,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',4,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',0,20123,0,1,1),(0,736,20116,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',4,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',0,20124,0,63,1),(0,737,20116,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',4,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',0,20131,0,1,1),(0,738,20116,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',1,'20116',20116,20125,0,2,0),(0,739,20116,'com_liferay_configuration_admin_web_portlet_SystemSettingsPortlet',1,'20116',20116,20126,0,2,0),(0,740,20116,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',4,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',0,20123,0,1,1),(0,741,20116,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',4,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',0,20124,0,63,1),(0,742,20116,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',4,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',0,20131,0,1,1),(0,743,20116,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',1,'20116',20116,20123,0,2,0),(0,744,20116,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',1,'20116',20116,20125,0,2,0),(0,745,20116,'com_liferay_image_editor_web_portlet_ImageEditorPortlet',1,'20116',20116,20126,0,2,0),(0,746,20116,'hello_soy_portlet',4,'hello_soy_portlet',0,20123,0,1,1),(0,747,20116,'hello_soy_portlet',4,'hello_soy_portlet',0,20124,0,63,1),(0,748,20116,'hello_soy_portlet',4,'hello_soy_portlet',0,20131,0,1,1),(0,749,20116,'hello_soy_portlet',1,'20116',20116,20123,0,2,0),(0,750,20116,'hello_soy_portlet',1,'20116',20116,20125,0,2,0),(0,751,20116,'hello_soy_portlet',1,'20116',20116,20126,0,2,0),(0,752,20116,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',4,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',0,20123,0,1,1),(0,753,20116,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',4,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',0,20124,0,63,1),(0,754,20116,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',4,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',0,20131,0,1,1),(0,755,20116,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',1,'20116',20116,20123,0,2,0),(0,756,20116,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',1,'20116',20116,20125,0,2,0),(0,757,20116,'com_liferay_hello_world_web_portlet_HelloWorldPortlet',1,'20116',20116,20126,0,2,0),(0,758,20116,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',4,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',0,20123,0,1,1),(0,759,20116,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',4,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',0,20124,0,63,1),(0,760,20116,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',4,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',0,20131,0,1,1),(0,761,20116,'com_liferay_license_manager_web_portlet_LicenseManagerPortlet',1,'20116',20116,20122,0,2,0),(0,762,20116,'com_liferay_login_web_portlet_FastLoginPortlet',4,'com_liferay_login_web_portlet_FastLoginPortlet',0,20123,0,1,1),(0,763,20116,'com_liferay_login_web_portlet_FastLoginPortlet',4,'com_liferay_login_web_portlet_FastLoginPortlet',0,20124,0,63,1),(0,764,20116,'com_liferay_login_web_portlet_FastLoginPortlet',4,'com_liferay_login_web_portlet_FastLoginPortlet',0,20131,0,1,1),(0,765,20116,'com_liferay_login_web_portlet_FastLoginPortlet',1,'20116',20116,20123,0,2,0),(0,766,20116,'com_liferay_login_web_portlet_FastLoginPortlet',1,'20116',20116,20125,0,2,0),(0,767,20116,'com_liferay_login_web_portlet_FastLoginPortlet',1,'20116',20116,20126,0,2,0),(0,768,20116,'com_liferay_login_web_portlet_LoginPortlet',4,'com_liferay_login_web_portlet_LoginPortlet',0,20123,0,1,1),(0,769,20116,'com_liferay_login_web_portlet_LoginPortlet',4,'com_liferay_login_web_portlet_LoginPortlet',0,20124,0,31,1),(0,770,20116,'com_liferay_login_web_portlet_LoginPortlet',4,'com_liferay_login_web_portlet_LoginPortlet',0,20131,0,1,1),(0,771,20116,'com_liferay_login_web_portlet_LoginPortlet',1,'20116',20116,20123,0,16,0),(0,772,20116,'com_liferay_login_web_portlet_LoginPortlet',1,'20116',20116,20125,0,16,0),(0,773,20116,'com_liferay_login_web_portlet_LoginPortlet',1,'20116',20116,20126,0,16,0),(0,774,20116,'com_liferay_monitoring_web_portlet_MonitoringPortlet',4,'com_liferay_monitoring_web_portlet_MonitoringPortlet',0,20123,0,1,1),(0,775,20116,'com_liferay_monitoring_web_portlet_MonitoringPortlet',4,'com_liferay_monitoring_web_portlet_MonitoringPortlet',0,20124,0,31,1),(0,776,20116,'com_liferay_monitoring_web_portlet_MonitoringPortlet',4,'com_liferay_monitoring_web_portlet_MonitoringPortlet',0,20131,0,1,1),(0,777,20116,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet',4,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet',0,20123,0,1,1),(0,778,20116,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet',4,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet',0,20124,0,31,1),(0,779,20116,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet',4,'com_liferay_portal_instances_web_portlet_PortalInstancesPortlet',0,20131,0,1,1),(0,780,20116,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet',4,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet',0,20123,0,1,1),(0,781,20116,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet',4,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet',0,20124,0,31,1),(0,782,20116,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet',4,'com_liferay_portal_settings_web_portlet_PortalSettingsPortlet',0,20131,0,1,1),(0,783,20116,'com_liferay_server_admin_web_portlet_ServerAdminPortlet',4,'com_liferay_server_admin_web_portlet_ServerAdminPortlet',0,20123,0,1,1),(0,784,20116,'com_liferay_server_admin_web_portlet_ServerAdminPortlet',4,'com_liferay_server_admin_web_portlet_ServerAdminPortlet',0,20124,0,31,1),(0,785,20116,'com_liferay_server_admin_web_portlet_ServerAdminPortlet',4,'com_liferay_server_admin_web_portlet_ServerAdminPortlet',0,20131,0,1,1),(0,786,20116,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',4,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',0,20123,0,1,1),(0,787,20116,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',4,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',0,20124,0,63,1),(0,788,20116,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',4,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',0,20131,0,1,1),(0,789,20116,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',1,'20116',20116,20122,0,2,0),(0,790,20116,'com_liferay_users_admin_web_portlet_MyOrganizationsPortlet',1,'20116',20116,20126,0,32,0),(0,791,20116,'com_liferay_users_admin_web_portlet_UsersAdminPortlet',4,'com_liferay_users_admin_web_portlet_UsersAdminPortlet',0,20123,0,1,1),(0,792,20116,'com_liferay_users_admin_web_portlet_UsersAdminPortlet',4,'com_liferay_users_admin_web_portlet_UsersAdminPortlet',0,20124,0,125,1),(0,793,20116,'com_liferay_users_admin_web_portlet_UsersAdminPortlet',4,'com_liferay_users_admin_web_portlet_UsersAdminPortlet',0,20131,0,1,1),(0,794,20116,'com.liferay.portal.kernel.model.User',4,'com.liferay.portal.kernel.model.User',0,20124,0,31,1),(0,795,20116,'com.liferay.portal.kernel.model.Organization',4,'com.liferay.portal.kernel.model.Organization',0,20124,0,2047,1),(0,796,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',4,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',0,20123,0,1,1),(0,797,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',4,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',0,20124,0,63,1),(0,798,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',4,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',0,20131,0,1,1),(0,799,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',1,'20116',20116,20122,0,2,0),(0,800,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',1,'20116',20116,20123,0,2,0),(0,801,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',1,'20116',20116,20125,0,2,0),(0,802,20116,'com_liferay_ip_geocoder_sample_web_portlet_IPGeocoderSamplePortlet',1,'20116',20116,20126,0,2,0),(0,803,20116,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet',4,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet',0,20123,0,1,1),(0,804,20116,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet',4,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet',0,20124,0,63,1),(0,805,20116,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet',4,'com_liferay_oauth_web_internal_portlet_AuthorizePortlet',0,20131,0,1,1),(0,806,20116,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet',4,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet',0,20123,0,1,1),(0,807,20116,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet',4,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet',0,20124,0,63,1),(0,808,20116,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet',4,'com_liferay_asset_browser_web_portlet_AssetBrowserPortlet',0,20131,0,1,1),(0,809,20116,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',4,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',0,20123,0,1,1),(0,810,20116,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',4,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',0,20124,0,63,1),(0,811,20116,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',4,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',0,20131,0,1,1),(0,812,20116,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',1,'20116',20116,20123,0,32,0),(0,813,20116,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',1,'20116',20116,20125,0,32,0),(0,814,20116,'com_liferay_asset_categories_navigation_web_portlet_AssetCategoriesNavigationPortlet',1,'20116',20116,20126,0,32,0),(0,815,20116,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet',4,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet',0,20123,0,1,1),(0,816,20116,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet',4,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet',0,20124,0,63,1),(0,817,20116,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet',4,'com_liferay_asset_display_web_portlet_AssetDisplayPortlet',0,20131,0,1,1),(0,818,20116,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet',4,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet',0,20123,0,1,1),(0,819,20116,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet',4,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet',0,20124,0,63,1),(0,820,20116,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet',4,'com_liferay_asset_tags_compiler_web_portlet_AssetTagsCompilerPortlet',0,20131,0,1,1),(0,821,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',4,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',0,20123,0,1,1),(0,822,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',4,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',0,20124,0,63,1),(0,823,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',4,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',0,20131,0,1,1),(0,824,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',1,'20116',20116,20123,0,2,0),(0,825,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',1,'20116',20116,20125,0,2,0),(0,826,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsCloudPortlet',1,'20116',20116,20126,0,2,0),(0,827,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',4,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',0,20123,0,1,1),(0,828,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',4,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',0,20124,0,63,1),(0,829,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',4,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',0,20131,0,1,1),(0,830,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',1,'20116',20116,20123,0,32,0),(0,831,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',1,'20116',20116,20125,0,32,0),(0,832,20116,'com_liferay_asset_tags_navigation_web_portlet_AssetTagsNavigationPortlet',1,'20116',20116,20126,0,32,0),(0,833,20116,'com_liferay_asset_web_portlet_AssetPortlet',4,'com_liferay_asset_web_portlet_AssetPortlet',0,20123,0,1,1),(0,834,20116,'com_liferay_asset_web_portlet_AssetPortlet',4,'com_liferay_asset_web_portlet_AssetPortlet',0,20124,0,63,1),(0,835,20116,'com_liferay_asset_web_portlet_AssetPortlet',4,'com_liferay_asset_web_portlet_AssetPortlet',0,20131,0,1,1),(0,836,20116,'com_liferay_exportimport_web_portlet_ExportPortlet',4,'com_liferay_exportimport_web_portlet_ExportPortlet',0,20123,0,1,1),(0,837,20116,'com_liferay_exportimport_web_portlet_ExportPortlet',4,'com_liferay_exportimport_web_portlet_ExportPortlet',0,20124,0,63,1),(0,838,20116,'com_liferay_exportimport_web_portlet_ExportPortlet',4,'com_liferay_exportimport_web_portlet_ExportPortlet',0,20131,0,1,1),(0,839,20116,'com_liferay_exportimport_web_portlet_ExportPortlet',2,'20149',20149,20125,0,63,1),(0,840,20116,'com_liferay_exportimport_web_portlet_ImportPortlet',4,'com_liferay_exportimport_web_portlet_ImportPortlet',0,20123,0,1,1),(0,841,20116,'com_liferay_exportimport_web_portlet_ImportPortlet',4,'com_liferay_exportimport_web_portlet_ImportPortlet',0,20124,0,63,1),(0,842,20116,'com_liferay_exportimport_web_portlet_ImportPortlet',4,'com_liferay_exportimport_web_portlet_ImportPortlet',0,20131,0,1,1),(0,843,20116,'com_liferay_exportimport_web_portlet_ImportPortlet',2,'20149',20149,20125,0,63,1),(0,844,20116,'com_liferay_iframe_web_portlet_IFramePortlet',4,'com_liferay_iframe_web_portlet_IFramePortlet',0,20123,0,1,1),(0,845,20116,'com_liferay_iframe_web_portlet_IFramePortlet',4,'com_liferay_iframe_web_portlet_IFramePortlet',0,20124,0,63,1),(0,846,20116,'com_liferay_iframe_web_portlet_IFramePortlet',4,'com_liferay_iframe_web_portlet_IFramePortlet',0,20131,0,1,1),(0,847,20116,'com_liferay_iframe_web_portlet_IFramePortlet',1,'20116',20116,20125,0,2,0),(0,848,20116,'com_liferay_iframe_web_portlet_IFramePortlet',1,'20116',20116,20126,0,2,0),(0,849,20116,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet',4,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet',0,20123,0,1,1),(0,850,20116,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet',4,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet',0,20124,0,63,1),(0,851,20116,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet',4,'com_liferay_portlet_configuration_sharing_web_portlet_PortletConfigurationSharingPortlet',0,20131,0,1,1),(0,852,20116,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet',4,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet',0,20123,0,1,1),(0,853,20116,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet',4,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet',0,20124,0,63,1),(0,854,20116,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet',4,'com_liferay_product_navigation_control_menu_web_portlet_ProductNavigationControlMenuPortlet',0,20131,0,1,1),(0,855,20116,'com_liferay_rss_web_portlet_RSSPortlet',4,'com_liferay_rss_web_portlet_RSSPortlet',0,20123,0,1,1),(0,856,20116,'com_liferay_rss_web_portlet_RSSPortlet',4,'com_liferay_rss_web_portlet_RSSPortlet',0,20124,0,63,1),(0,857,20116,'com_liferay_rss_web_portlet_RSSPortlet',4,'com_liferay_rss_web_portlet_RSSPortlet',0,20131,0,1,1),(0,858,20116,'com_liferay_rss_web_portlet_RSSPortlet',1,'20116',20116,20125,0,32,0),(0,859,20116,'com_liferay_rss_web_portlet_RSSPortlet',1,'20116',20116,20126,0,32,0),(0,860,20116,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet',4,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet',0,20123,0,1,1),(0,861,20116,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet',4,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet',0,20124,0,63,1),(0,862,20116,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet',4,'com_liferay_site_browser_web_portlet_SiteBrowserPortlet',0,20131,0,1,1),(0,863,20116,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',4,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',0,20123,0,1,1),(0,864,20116,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',4,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',0,20124,0,63,1),(0,865,20116,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',4,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',0,20131,0,1,1),(0,866,20116,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',1,'20116',20116,20123,0,2,0),(0,867,20116,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',1,'20116',20116,20125,0,2,0),(0,868,20116,'com_liferay_site_navigation_directory_web_portlet_SitesDirectoryPortlet',1,'20116',20116,20126,0,2,0),(0,869,20116,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',4,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',0,20123,0,1,1),(0,870,20116,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',4,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',0,20124,0,63,1),(0,871,20116,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',4,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',0,20131,0,1,1),(0,872,20116,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',1,'20116',20116,20123,0,32,0),(0,873,20116,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',1,'20116',20116,20125,0,32,0),(0,874,20116,'com_liferay_site_navigation_site_map_web_portlet_SiteNavigationSiteMapPortlet',1,'20116',20116,20126,0,32,0),(0,875,20116,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet',4,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet',0,20123,0,1,1),(0,876,20116,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet',4,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet',0,20124,0,63,1),(0,877,20116,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet',4,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet',0,20131,0,1,1),(0,878,20116,'com_liferay_staging_processes_web_portlet_StagingProcessesPortlet',2,'20149',20149,20125,0,63,1),(0,879,20116,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',4,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',0,20123,0,1,1),(0,880,20116,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',4,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',0,20124,0,63,1),(0,881,20116,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',4,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',0,20131,0,1,1),(0,882,20116,'com_liferay_xsl_content_web_portlet_XSLContentPortlet',1,'20116',20116,20122,0,2,0),(0,883,20116,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',4,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',0,20123,0,1,1),(0,884,20116,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',4,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',0,20124,0,127,1),(0,885,20116,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',4,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',0,20131,0,33,1),(0,886,20116,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',1,'20116',20116,20125,0,64,0),(0,887,20116,'com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet',1,'20116',20116,20126,0,64,0),(0,888,20116,'com.liferay.portal.kernel.model.LayoutPrototype',4,'31080',31080,20124,20120,15,1),(0,889,20116,'com.liferay.portal.kernel.model.Group',4,'31081',31081,20124,0,33554431,1),(0,890,20116,'com.liferay.portal.kernel.model.Layout',4,'31084',31084,20124,20120,1023,1),(0,891,20116,'com.liferay.portal.kernel.model.Layout',4,'31084',31084,20131,0,529,1),(0,892,20116,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',0,20123,0,1,1),(0,893,20116,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',0,20124,0,63,1),(0,894,20116,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',0,20131,0,1,1),(0,895,20116,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',1,'20116',20116,20123,0,2,0),(0,896,20116,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',1,'20116',20116,20125,0,2,0),(0,897,20116,'com_liferay_asset_publisher_web_portlet_HighestRatedAssetsPortlet',1,'20116',20116,20126,0,2,0),(0,898,20116,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',0,20123,0,1,1),(0,899,20116,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',0,20124,0,63,1),(0,900,20116,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',0,20131,0,1,1),(0,901,20116,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',1,'20116',20116,20123,0,2,0),(0,902,20116,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',1,'20116',20116,20125,0,2,0),(0,903,20116,'com_liferay_asset_publisher_web_portlet_MostViewedAssetsPortlet',1,'20116',20116,20126,0,2,0),(0,904,20116,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',4,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',0,20123,0,1,1),(0,905,20116,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',4,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',0,20124,0,63,1),(0,906,20116,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',4,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',0,20131,0,1,1),(0,907,20116,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',1,'20116',20116,20123,0,2,0),(0,908,20116,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',1,'20116',20116,20125,0,2,0),(0,909,20116,'com_liferay_asset_publisher_web_portlet_RecentContentPortlet',1,'20116',20116,20126,0,2,0),(0,910,20116,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',0,20123,0,1,1),(0,911,20116,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',0,20124,0,63,1),(0,912,20116,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',4,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',0,20131,0,1,1),(0,913,20116,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',1,'20116',20116,20123,0,2,0),(0,914,20116,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',1,'20116',20116,20125,0,2,0),(0,915,20116,'com_liferay_asset_publisher_web_portlet_RelatedAssetsPortlet',1,'20116',20116,20126,0,2,0),(0,916,20116,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',4,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',0,20123,0,1,1),(0,917,20116,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',4,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',0,20124,0,61,1),(0,918,20116,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',4,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',0,20131,0,1,1),(0,919,20116,'com.liferay.asset.tags',4,'com.liferay.asset.tags',0,20124,0,6,0),(0,920,20116,'com.liferay.asset.kernel.model.AssetTag',4,'com.liferay.asset.kernel.model.AssetTag',0,20124,0,14,0),(0,921,20116,'com_liferay_asset_tags_admin_web_portlet_AssetTagsAdminPortlet',2,'20149',20149,20125,0,61,1),(0,922,20116,'com.liferay.asset.tags',2,'20149',20149,20125,0,6,0),(0,923,20116,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',4,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',0,20123,0,1,1),(0,924,20116,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',4,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',0,20124,0,61,1),(0,925,20116,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',4,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',0,20131,0,1,1),(0,926,20116,'com.liferay.asset.categories',4,'com.liferay.asset.categories',0,20124,0,14,0),(0,927,20116,'com.liferay.asset.kernel.model.AssetCategory',4,'com.liferay.asset.kernel.model.AssetCategory',0,20124,0,31,1),(0,928,20116,'com.liferay.asset.kernel.model.AssetCategory',4,'com.liferay.asset.kernel.model.AssetCategory',0,20123,0,1,1),(0,929,20116,'com.liferay.asset.kernel.model.AssetVocabulary',4,'com.liferay.asset.kernel.model.AssetVocabulary',0,20124,0,15,1),(0,930,20116,'com.liferay.asset.kernel.model.AssetVocabulary',4,'com.liferay.asset.kernel.model.AssetVocabulary',0,20123,0,1,1),(0,931,20116,'com_liferay_asset_categories_admin_web_portlet_AssetCategoriesAdminPortlet',2,'20149',20149,20125,0,61,1),(0,932,20116,'com.liferay.asset.categories',2,'20149',20149,20125,0,14,0),(0,933,20116,'com_liferay_expando_web_portlet_ExpandoPortlet',4,'com_liferay_expando_web_portlet_ExpandoPortlet',0,20124,0,125,1),(0,934,20116,'com.liferay.expando.kernel.model.ExpandoColumn',4,'com.liferay.expando.kernel.model.ExpandoColumn',0,20124,0,15,1),(0,935,20116,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet',4,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet',0,20123,0,1,1),(0,936,20116,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet',4,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet',0,20124,0,63,1),(0,937,20116,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet',4,'com_liferay_staging_configuration_web_portlet_StagingConfigurationPortlet',0,20131,0,1,1),(0,938,20116,'com_liferay_portal_search_web_portlet_SearchPortlet',4,'com_liferay_portal_search_web_portlet_SearchPortlet',0,20123,0,1,1),(0,939,20116,'com_liferay_portal_search_web_portlet_SearchPortlet',4,'com_liferay_portal_search_web_portlet_SearchPortlet',0,20124,0,63,1),(0,940,20116,'com_liferay_portal_search_web_portlet_SearchPortlet',4,'com_liferay_portal_search_web_portlet_SearchPortlet',0,20131,0,1,1),(0,941,20116,'com_liferay_portal_search_web_portlet_SearchPortlet',1,'20116',20116,20123,0,2,0),(0,942,20116,'com_liferay_portal_search_web_portlet_SearchPortlet',1,'20116',20116,20125,0,2,0),(0,943,20116,'com_liferay_portal_search_web_portlet_SearchPortlet',1,'20116',20116,20126,0,2,0),(0,944,20116,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet',4,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet',0,20123,0,1,1),(0,945,20116,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet',4,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet',0,20124,0,61,1),(0,946,20116,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet',4,'com_liferay_layout_prototype_web_portlet_LayoutPrototypePortlet',0,20131,0,1,1),(0,947,20116,'com.liferay.portal.kernel.model.LayoutPrototype',4,'com.liferay.portal.kernel.model.LayoutPrototype',0,20124,0,15,1),(0,948,20116,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',4,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',0,20123,0,1,1),(0,949,20116,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',4,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',0,20124,0,63,1),(0,950,20116,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',4,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',0,20131,0,1,1),(0,951,20116,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',1,'20116',20116,20123,0,2,0),(0,952,20116,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',1,'20116',20116,20125,0,2,0),(0,953,20116,'com_liferay_nested_portlets_web_portlet_NestedPortletsPortlet',1,'20116',20116,20126,0,2,0),(0,954,20116,'com_liferay_mentions_web_portlet_MentionsPortlet',4,'com_liferay_mentions_web_portlet_MentionsPortlet',0,20123,0,1,1),(0,955,20116,'com_liferay_mentions_web_portlet_MentionsPortlet',4,'com_liferay_mentions_web_portlet_MentionsPortlet',0,20124,0,63,1),(0,956,20116,'com_liferay_mentions_web_portlet_MentionsPortlet',4,'com_liferay_mentions_web_portlet_MentionsPortlet',0,20131,0,1,1),(0,957,20116,'com_liferay_mentions_web_portlet_MentionsPortlet',1,'20116',20116,20122,0,2,0),(0,958,20116,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet',4,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet',0,20123,0,1,1),(0,959,20116,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet',4,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet',0,20124,0,61,1),(0,960,20116,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet',4,'com_liferay_password_policies_admin_web_portlet_PasswordPoliciesAdminPortlet',0,20131,0,1,1),(0,961,20116,'com.liferay.portal.kernel.model.PasswordPolicy',4,'com.liferay.portal.kernel.model.PasswordPolicy',0,20124,0,31,1),(0,962,20116,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',4,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',0,20123,0,1,1),(0,963,20116,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',4,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',0,20124,0,63,1),(0,964,20116,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',4,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',0,20131,0,1,1),(0,965,20116,'com.liferay.portal.kernel.model.UserGroup',4,'com.liferay.portal.kernel.model.UserGroup',0,20124,0,127,1),(0,966,20116,'com_liferay_user_groups_admin_web_portlet_UserGroupsAdminPortlet',1,'20116',20116,20122,0,2,0),(0,967,20116,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet',4,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet',0,20123,0,1,1),(0,968,20116,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet',4,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet',0,20124,0,63,1),(0,969,20116,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet',4,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet',0,20131,0,1,1),(0,970,20116,'com.liferay.portal.kernel.model.Team',4,'com.liferay.portal.kernel.model.Team',0,20124,0,31,1),(0,971,20116,'com_liferay_site_teams_web_portlet_SiteTeamsPortlet',2,'20149',20149,20125,0,63,1),(0,972,20116,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet',4,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet',0,20123,0,1,1),(0,973,20116,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet',4,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet',0,20124,0,63,1),(0,974,20116,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet',4,'com_liferay_roles_selector_web_portlet_RolesSelectorPortlet',0,20131,0,1,1),(0,975,20116,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet',4,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet',0,20123,0,1,1),(0,976,20116,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet',4,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet',0,20124,0,63,1),(0,977,20116,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet',4,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet',0,20131,0,1,1),(0,978,20116,'com.liferay.portal.kernel.model.Group',4,'com.liferay.portal.kernel.model.Group',0,20124,0,33554431,1),(0,979,20116,'com_liferay_site_memberships_web_portlet_SiteMembershipsPortlet',2,'20149',20149,20125,0,63,1),(0,980,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',4,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',0,20123,0,1,1),(0,981,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',4,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',0,20124,0,63,1),(0,982,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',4,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',0,20131,0,1,1),(0,983,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',1,'20116',20116,20125,0,2,0),(0,984,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkControlPanelPortlet',1,'20116',20116,20126,0,2,0),(0,985,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',4,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',0,20123,0,1,1),(0,986,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',4,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',0,20124,0,63,1),(0,987,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',4,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',0,20131,0,1,1),(0,988,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',1,'20116',20116,20125,0,2,0),(0,989,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',1,'20116',20116,20126,0,2,0),(0,990,20116,'com_liferay_portal_workflow_definition_link_web_portlet_WorkflowDefinitionLinkPortlet',2,'20149',20149,20125,0,63,1),(0,991,20116,'com_liferay_trash_web_portlet_TrashPortlet',4,'com_liferay_trash_web_portlet_TrashPortlet',0,20123,0,1,1),(0,992,20116,'com_liferay_trash_web_portlet_TrashPortlet',4,'com_liferay_trash_web_portlet_TrashPortlet',0,20124,0,63,1),(0,993,20116,'com_liferay_trash_web_portlet_TrashPortlet',4,'com_liferay_trash_web_portlet_TrashPortlet',0,20131,0,1,1),(0,994,20116,'com_liferay_trash_web_portlet_TrashPortlet',1,'20116',20116,20122,0,2,0),(0,995,20116,'com_liferay_trash_web_portlet_TrashPortlet',2,'20149',20149,20125,0,63,1),(0,996,20116,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet',4,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet',0,20123,0,1,1),(0,997,20116,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet',4,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet',0,20124,0,63,1),(0,998,20116,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet',4,'com_liferay_product_navigation_simulation_web_portlet_SimulationPortlet',0,20131,0,1,1),(0,999,20116,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet',4,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet',0,20123,0,1,1),(0,1000,20116,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet',4,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet',0,20124,0,61,1),(0,1001,20116,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet',4,'com_liferay_layout_set_prototype_web_portlet_LayoutSetPrototypePortlet',0,20131,0,1,1),(0,1002,20116,'com.liferay.portal.kernel.model.LayoutSetPrototype',4,'com.liferay.portal.kernel.model.LayoutSetPrototype',0,20124,0,15,1),(0,1003,20116,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet',4,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet',0,20123,0,1,1),(0,1004,20116,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet',4,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet',0,20124,0,63,1),(0,1005,20116,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet',4,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet',0,20131,0,1,1),(0,1006,20116,'com_liferay_layout_set_prototype_web_portlet_SiteTemplateSettingsPortlet',2,'20149',20149,20125,0,63,1),(0,1007,20116,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',4,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',0,20123,0,1,1),(0,1008,20116,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',4,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',0,20124,0,63,1),(0,1009,20116,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',4,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',0,20131,0,1,1),(0,1010,20116,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',1,'20116',20116,20125,0,2,0),(0,1011,20116,'com_liferay_product_navigation_user_personal_bar_web_portlet_ProductNavigationUserPersonalBarPortlet',1,'20116',20116,20126,0,2,0),(0,1012,20116,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet',4,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet',0,20123,0,1,1),(0,1013,20116,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet',4,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet',0,20124,0,61,1),(0,1014,20116,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet',4,'com_liferay_roles_admin_web_portlet_RolesAdminPortlet',0,20131,0,1,1),(0,1015,20116,'com.liferay.portal.kernel.model.Role',4,'com.liferay.portal.kernel.model.Role',0,20124,0,127,1),(0,1016,20116,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet',4,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet',0,20123,0,1,1),(0,1017,20116,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet',4,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet',0,20124,0,63,1),(0,1018,20116,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet',4,'com_liferay_product_navigation_product_menu_web_portlet_ProductMenuPortlet',0,20131,0,1,1),(0,1019,20116,'com_liferay_site_admin_web_portlet_SiteAdminPortlet',4,'com_liferay_site_admin_web_portlet_SiteAdminPortlet',0,20123,0,1,1),(0,1020,20116,'com_liferay_site_admin_web_portlet_SiteAdminPortlet',4,'com_liferay_site_admin_web_portlet_SiteAdminPortlet',0,20124,0,61,1),(0,1021,20116,'com_liferay_site_admin_web_portlet_SiteAdminPortlet',4,'com_liferay_site_admin_web_portlet_SiteAdminPortlet',0,20131,0,1,1),(0,1022,20116,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet',4,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet',0,20123,0,1,1),(0,1023,20116,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet',4,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet',0,20124,0,63,1),(0,1024,20116,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet',4,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet',0,20131,0,1,1),(0,1025,20116,'com_liferay_site_admin_web_portlet_SiteSettingsPortlet',2,'20149',20149,20125,0,63,1),(0,1026,20116,'com_liferay_announcements_web_portlet_AlertsPortlet',4,'com_liferay_announcements_web_portlet_AlertsPortlet',0,20123,0,1,1),(0,1027,20116,'com_liferay_announcements_web_portlet_AlertsPortlet',4,'com_liferay_announcements_web_portlet_AlertsPortlet',0,20124,0,31,1),(0,1028,20116,'com_liferay_announcements_web_portlet_AlertsPortlet',4,'com_liferay_announcements_web_portlet_AlertsPortlet',0,20131,0,1,1),(0,1029,20116,'com.liferay.announcements.kernel.model.AnnouncementsEntry',4,'com.liferay.announcements.kernel.model.AnnouncementsEntry',0,20124,0,15,1),(0,1030,20116,'com.liferay.announcements.kernel.model.AnnouncementsEntry',4,'com.liferay.announcements.kernel.model.AnnouncementsEntry',0,20123,0,1,1),(0,1031,20116,'com_liferay_announcements_web_portlet_AlertsPortlet',1,'20116',20116,20125,0,2,0),(0,1032,20116,'com_liferay_announcements_web_portlet_AlertsPortlet',1,'20116',20116,20126,0,2,0),(0,1033,20116,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet',4,'com_liferay_announcements_web_portlet_AnnouncementsAdminPortlet',0,20124,0,31,1),(0,1034,20116,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',4,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',0,20123,0,1,1),(0,1035,20116,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',4,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',0,20124,0,31,1),(0,1036,20116,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',4,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',0,20131,0,1,1),(0,1037,20116,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',1,'20116',20116,20125,0,2,0),(0,1038,20116,'com_liferay_announcements_web_portlet_AnnouncementsPortlet',1,'20116',20116,20126,0,2,0),(0,1039,20116,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',4,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',0,20123,0,1,1),(0,1040,20116,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',4,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',0,20124,0,63,1),(0,1041,20116,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',4,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',0,20131,0,1,1),(0,1042,20116,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',1,'20116',20116,20123,0,2,0),(0,1043,20116,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',1,'20116',20116,20125,0,2,0),(0,1044,20116,'com_liferay_blogs_recent_bloggers_web_portlet_RecentBloggersPortlet',1,'20116',20116,20126,0,2,0),(0,1045,20116,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',4,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',0,20123,0,1,1),(0,1046,20116,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',4,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',0,20124,0,61,1),(0,1047,20116,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',4,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',0,20131,0,1,1),(0,1048,20116,'com.liferay.bookmarks',4,'com.liferay.bookmarks',0,20123,0,1,1),(0,1049,20116,'com.liferay.bookmarks',4,'com.liferay.bookmarks',0,20124,0,31,1),(0,1050,20116,'com.liferay.bookmarks',4,'com.liferay.bookmarks',0,20131,0,11,1),(0,1051,20116,'com_liferay_bookmarks_web_portlet_BookmarksAdminPortlet',2,'20149',20149,20125,0,61,1),(0,1052,20116,'com.liferay.bookmarks',2,'20149',20149,20125,0,31,1),(0,1053,20116,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',4,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',0,20123,0,1,1),(0,1054,20116,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',4,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',0,20124,0,31,1),(0,1055,20116,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',4,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',0,20131,0,1,1),(0,1056,20116,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',1,'20116',20116,20125,0,2,0),(0,1057,20116,'com_liferay_bookmarks_web_portlet_BookmarksPortlet',1,'20116',20116,20126,0,2,0),(0,1058,20116,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',4,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',0,20123,0,1,1),(0,1059,20116,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',4,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',0,20124,0,63,1),(0,1060,20116,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',4,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',0,20131,0,1,1),(0,1061,20116,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',1,'20116',20116,20125,0,2,0),(0,1062,20116,'com_liferay_comment_page_comments_web_portlet_PageCommentsPortlet',1,'20116',20116,20126,0,2,0),(0,1063,20116,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet',4,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet',0,20124,0,31,1),(0,1064,20116,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet',1,'20116',20116,20125,0,16,0),(0,1065,20116,'com_liferay_directory_web_portlet_FriendsDirectoryPortlet',1,'20116',20116,20126,0,16,0),(0,1066,20116,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet',4,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet',0,20124,0,31,1),(0,1067,20116,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet',1,'20116',20116,20125,0,16,0),(0,1068,20116,'com_liferay_directory_web_portlet_MySitesDirectoryPortlet',1,'20116',20116,20126,0,16,0),(0,1069,20116,'com_liferay_directory_web_portlet_DirectoryPortlet',4,'com_liferay_directory_web_portlet_DirectoryPortlet',0,20124,0,31,1),(0,1070,20116,'com_liferay_directory_web_portlet_DirectoryPortlet',1,'20116',20116,20125,0,16,0),(0,1071,20116,'com_liferay_directory_web_portlet_DirectoryPortlet',1,'20116',20116,20126,0,16,0),(0,1072,20116,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet',4,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet',0,20124,0,31,1),(0,1073,20116,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet',1,'20116',20116,20125,0,16,0),(0,1074,20116,'com_liferay_directory_web_portlet_SiteMembersDirectoryPortlet',1,'20116',20116,20126,0,16,0),(0,1075,20116,'com_liferay_flags_web_portlet_FlagsPortlet',4,'com_liferay_flags_web_portlet_FlagsPortlet',0,20123,0,1,1),(0,1076,20116,'com_liferay_flags_web_portlet_FlagsPortlet',4,'com_liferay_flags_web_portlet_FlagsPortlet',0,20124,0,63,1),(0,1077,20116,'com_liferay_flags_web_portlet_FlagsPortlet',4,'com_liferay_flags_web_portlet_FlagsPortlet',0,20131,0,1,1),(0,1078,20116,'com_liferay_flags_web_portlet_FlagsPortlet',1,'20116',20116,20123,0,2,0),(0,1079,20116,'com_liferay_flags_web_portlet_FlagsPortlet',1,'20116',20116,20125,0,2,0),(0,1080,20116,'com_liferay_flags_web_portlet_FlagsPortlet',1,'20116',20116,20126,0,2,0),(0,1081,20116,'com_liferay_flags_web_portlet_PageFlagsPortlet',4,'com_liferay_flags_web_portlet_PageFlagsPortlet',0,20123,0,1,1),(0,1082,20116,'com_liferay_flags_web_portlet_PageFlagsPortlet',4,'com_liferay_flags_web_portlet_PageFlagsPortlet',0,20124,0,63,1),(0,1083,20116,'com_liferay_flags_web_portlet_PageFlagsPortlet',4,'com_liferay_flags_web_portlet_PageFlagsPortlet',0,20131,0,1,1),(0,1084,20116,'com_liferay_flags_web_portlet_PageFlagsPortlet',1,'20116',20116,20123,0,2,0),(0,1085,20116,'com_liferay_flags_web_portlet_PageFlagsPortlet',1,'20116',20116,20125,0,2,0),(0,1086,20116,'com_liferay_flags_web_portlet_PageFlagsPortlet',1,'20116',20116,20126,0,2,0),(0,1087,20116,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',4,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',0,20123,0,1,1),(0,1088,20116,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',4,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',0,20124,0,63,1),(0,1089,20116,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',4,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',0,20131,0,1,1),(0,1090,20116,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',1,'20116',20116,20123,0,2,0),(0,1091,20116,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',1,'20116',20116,20125,0,2,0),(0,1092,20116,'com_liferay_image_uploader_web_portlet_ImageUploaderPortlet',1,'20116',20116,20126,0,2,0),(0,1093,20116,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet',4,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet',0,20123,0,1,1),(0,1094,20116,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet',4,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet',0,20124,0,63,1),(0,1095,20116,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet',4,'com_liferay_item_selector_web_portlet_ItemSelectorPortlet',0,20131,0,1,1),(0,1096,20116,'com_liferay_quick_note_web_portlet_QuickNotePortlet',4,'com_liferay_quick_note_web_portlet_QuickNotePortlet',0,20123,0,1,1),(0,1097,20116,'com_liferay_quick_note_web_portlet_QuickNotePortlet',4,'com_liferay_quick_note_web_portlet_QuickNotePortlet',0,20124,0,63,1),(0,1098,20116,'com_liferay_quick_note_web_portlet_QuickNotePortlet',4,'com_liferay_quick_note_web_portlet_QuickNotePortlet',0,20131,0,1,1),(0,1099,20116,'com_liferay_quick_note_web_portlet_QuickNotePortlet',1,'20116',20116,20125,0,2,0),(0,1100,20116,'com_liferay_quick_note_web_portlet_QuickNotePortlet',1,'20116',20116,20126,0,2,0),(0,1101,20116,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',4,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',0,20123,0,1,1),(0,1102,20116,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',4,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',0,20124,0,63,1),(0,1103,20116,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',4,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',0,20131,0,1,1),(0,1104,20116,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',1,'20116',20116,20125,0,2,0),(0,1105,20116,'com_liferay_ratings_page_ratings_web_portlet_PageRatingsPortlet',1,'20116',20116,20126,0,2,0),(0,1106,20116,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',4,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',0,20123,0,1,1),(0,1107,20116,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',4,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',0,20124,0,63,1),(0,1108,20116,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',4,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',0,20131,0,1,1),(0,1109,20116,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',1,'20116',20116,20123,0,2,0),(0,1110,20116,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',1,'20116',20116,20125,0,2,0),(0,1111,20116,'com_liferay_recent_documents_web_portlet_RecentDocumentsPortlet',1,'20116',20116,20126,0,2,0),(0,1112,20116,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',4,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',0,20123,0,1,1),(0,1113,20116,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',4,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',0,20124,0,63,1),(0,1114,20116,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',4,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',0,20131,0,1,1),(0,1115,20116,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',1,'20116',20116,20123,0,2,0),(0,1116,20116,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',1,'20116',20116,20125,0,2,0),(0,1117,20116,'com_liferay_social_activities_web_portlet_SocialActivitiesPortlet',1,'20116',20116,20126,0,2,0),(0,1118,20116,'com_liferay_social_activity_web_portlet_SocialActivityPortlet',4,'com_liferay_social_activity_web_portlet_SocialActivityPortlet',0,20124,0,31,1),(0,1119,20116,'com_liferay_social_activity_web_portlet_SocialActivityPortlet',2,'20149',20149,20125,0,31,1),(0,1120,20116,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',4,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',0,20123,0,1,1),(0,1121,20116,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',4,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',0,20124,0,63,1),(0,1122,20116,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',4,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',0,20131,0,1,1),(0,1123,20116,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',1,'20116',20116,20123,0,2,0),(0,1124,20116,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',1,'20116',20116,20125,0,2,0),(0,1125,20116,'com_liferay_social_group_statistics_web_portlet_SocialGroupStatisticsPortlet',1,'20116',20116,20126,0,2,0),(0,1126,20116,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',4,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',0,20123,0,1,1),(0,1127,20116,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',4,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',0,20124,0,63,1),(0,1128,20116,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',4,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',0,20131,0,1,1),(0,1129,20116,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',1,'20116',20116,20123,0,2,0),(0,1130,20116,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',1,'20116',20116,20125,0,2,0),(0,1131,20116,'com_liferay_social_requests_web_portlet_SocialRequestsPortlet',1,'20116',20116,20126,0,2,0),(0,1132,20116,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',4,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',0,20123,0,1,1),(0,1133,20116,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',4,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',0,20124,0,63,1),(0,1134,20116,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',4,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',0,20131,0,1,1),(0,1135,20116,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',1,'20116',20116,20123,0,2,0),(0,1136,20116,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',1,'20116',20116,20125,0,2,0),(0,1137,20116,'com_liferay_social_user_statistics_web_portlet_SocialUserStatisticsPortlet',1,'20116',20116,20126,0,2,0),(0,1138,20116,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',4,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',0,20123,0,1,1),(0,1139,20116,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',4,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',0,20124,0,63,1),(0,1140,20116,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',4,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',0,20131,0,1,1),(0,1141,20116,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',1,'20116',20116,20125,0,2,0),(0,1142,20116,'com_liferay_hello_velocity_web_portlet_HelloVelocityPortlet',1,'20116',20116,20126,0,2,0),(0,1143,20116,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',4,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',0,20123,0,1,1),(0,1144,20116,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',4,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',0,20124,0,63,1),(0,1145,20116,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',4,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',0,20131,0,1,1),(0,1146,20116,'com.liferay.mobile.device.rules',4,'com.liferay.mobile.device.rules',0,20124,0,31,1),(0,1147,20116,'com.liferay.mobile.device.rules.model.MDRRuleGroupInstance',4,'com.liferay.mobile.device.rules.model.MDRRuleGroupInstance',0,20124,0,15,1),(0,1148,20116,'com.liferay.mobile.device.rules.model.MDRRuleGroup',4,'com.liferay.mobile.device.rules.model.MDRRuleGroup',0,20124,0,15,1),(0,1149,20116,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',1,'20116',20116,20125,0,2,0),(0,1150,20116,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',1,'20116',20116,20126,0,2,0),(0,1151,20116,'com_liferay_mobile_device_rules_web_portlet_MDRPortlet',2,'20149',20149,20125,0,63,1),(0,1152,20116,'com.liferay.mobile.device.rules',2,'20149',20149,20125,0,31,1),(0,1153,20116,'com_liferay_my_account_web_portlet_MyAccountPortlet',4,'com_liferay_my_account_web_portlet_MyAccountPortlet',0,20124,0,31,1),(0,1154,20116,'com_liferay_my_account_web_portlet_MyAccountPortlet',1,'20116',20116,20126,0,16,0),(0,1155,20116,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet',4,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet',0,20123,0,1,1),(0,1156,20116,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet',4,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet',0,20124,0,31,1),(0,1157,20116,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet',4,'com_liferay_plugins_admin_web_portlet_PluginsAdminPortlet',0,20131,0,1,1),(0,1158,20116,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',4,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',0,20123,0,1,1),(0,1159,20116,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',4,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',0,20124,0,63,1),(0,1160,20116,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',4,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',0,20131,0,1,1),(0,1161,20116,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',1,'20116',20116,20125,0,2,0),(0,1162,20116,'com_liferay_web_proxy_web_portlet_WebProxyPortlet',1,'20116',20116,20126,0,2,0),(0,1163,20116,'com_liferay_exportimport_web_portlet_ExportImportPortlet',4,'com_liferay_exportimport_web_portlet_ExportImportPortlet',0,20123,0,1,1),(0,1164,20116,'com_liferay_exportimport_web_portlet_ExportImportPortlet',4,'com_liferay_exportimport_web_portlet_ExportImportPortlet',0,20124,0,63,1),(0,1165,20116,'com_liferay_exportimport_web_portlet_ExportImportPortlet',4,'com_liferay_exportimport_web_portlet_ExportImportPortlet',0,20131,0,1,1),(0,1166,20116,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet',4,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet',0,20123,0,1,1),(0,1167,20116,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet',4,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet',0,20124,0,63,1),(0,1168,20116,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet',4,'com_liferay_portlet_configuration_css_web_portlet_PortletConfigurationCSSPortlet',0,20131,0,1,1),(0,1169,20116,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet',4,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet',0,20123,0,1,1),(0,1170,20116,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet',4,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet',0,20124,0,63,1),(0,1171,20116,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet',4,'com_liferay_portlet_configuration_web_portlet_PortletConfigurationPortlet',0,20131,0,1,1),(0,1172,20116,'com_liferay_site_my_sites_web_portlet_MySitesPortlet',4,'com_liferay_site_my_sites_web_portlet_MySitesPortlet',0,20124,0,31,1),(0,1173,20116,'com_liferay_site_my_sites_web_portlet_MySitesPortlet',4,'com_liferay_site_my_sites_web_portlet_MySitesPortlet',0,20131,0,1,1),(0,1174,20116,'com_liferay_site_my_sites_web_portlet_MySitesPortlet',1,'20116',20116,20125,0,16,0),(0,1175,20116,'com_liferay_site_my_sites_web_portlet_MySitesPortlet',1,'20116',20116,20126,0,16,0),(0,1176,20116,'com_liferay_staging_bar_web_portlet_StagingBarPortlet',4,'com_liferay_staging_bar_web_portlet_StagingBarPortlet',0,20123,0,1,1),(0,1177,20116,'com_liferay_staging_bar_web_portlet_StagingBarPortlet',4,'com_liferay_staging_bar_web_portlet_StagingBarPortlet',0,20124,0,63,1),(0,1178,20116,'com_liferay_staging_bar_web_portlet_StagingBarPortlet',4,'com_liferay_staging_bar_web_portlet_StagingBarPortlet',0,20131,0,1,1),(0,1179,20116,'com_liferay_message_boards_web_portlet_MBAdminPortlet',4,'com_liferay_message_boards_web_portlet_MBAdminPortlet',0,20123,0,1,1),(0,1180,20116,'com_liferay_message_boards_web_portlet_MBAdminPortlet',4,'com_liferay_message_boards_web_portlet_MBAdminPortlet',0,20124,0,61,1),(0,1181,20116,'com_liferay_message_boards_web_portlet_MBAdminPortlet',4,'com_liferay_message_boards_web_portlet_MBAdminPortlet',0,20131,0,1,1),(0,1182,20116,'com.liferay.message.boards',4,'com.liferay.message.boards',0,20123,0,1,1),(0,1183,20116,'com.liferay.message.boards',4,'com.liferay.message.boards',0,20124,0,2047,1),(0,1184,20116,'com.liferay.message.boards',4,'com.liferay.message.boards',0,20131,0,421,1),(0,1185,20116,'com.liferay.message.boards.kernel.model.MBThread',4,'com.liferay.message.boards.kernel.model.MBThread',0,20124,0,7,1),(0,1186,20116,'com.liferay.message.boards.kernel.model.MBThread',4,'com.liferay.message.boards.kernel.model.MBThread',0,20123,0,1,1),(0,1187,20116,'com.liferay.message.boards.kernel.model.MBCategory',4,'com.liferay.message.boards.kernel.model.MBCategory',0,20124,0,4095,1),(0,1188,20116,'com.liferay.message.boards.kernel.model.MBCategory',4,'com.liferay.message.boards.kernel.model.MBCategory',0,20123,0,1,1),(0,1189,20116,'com.liferay.message.boards.kernel.model.MBMessage',4,'com.liferay.message.boards.kernel.model.MBMessage',0,20124,0,31,1),(0,1190,20116,'com.liferay.message.boards.kernel.model.MBMessage',4,'com.liferay.message.boards.kernel.model.MBMessage',0,20123,0,1,1),(0,1191,20116,'com_liferay_message_boards_web_portlet_MBAdminPortlet',2,'20149',20149,20125,0,61,1),(0,1192,20116,'com.liferay.message.boards',2,'20149',20149,20125,0,2047,1),(0,1193,20116,'com_liferay_message_boards_web_portlet_MBPortlet',4,'com_liferay_message_boards_web_portlet_MBPortlet',0,20123,0,1,1),(0,1194,20116,'com_liferay_message_boards_web_portlet_MBPortlet',4,'com_liferay_message_boards_web_portlet_MBPortlet',0,20124,0,31,1),(0,1195,20116,'com_liferay_message_boards_web_portlet_MBPortlet',4,'com_liferay_message_boards_web_portlet_MBPortlet',0,20131,0,1,1),(0,1196,20116,'com_liferay_message_boards_web_portlet_MBPortlet',1,'20116',20116,20125,0,2,0),(0,1197,20116,'com_liferay_message_boards_web_portlet_MBPortlet',1,'20116',20116,20126,0,2,0),(0,1198,20116,'com_liferay_document_library_web_portlet_DLAdminPortlet',4,'com_liferay_document_library_web_portlet_DLAdminPortlet',0,20123,0,1,1),(0,1199,20116,'com_liferay_document_library_web_portlet_DLAdminPortlet',4,'com_liferay_document_library_web_portlet_DLAdminPortlet',0,20124,0,61,1),(0,1200,20116,'com_liferay_document_library_web_portlet_DLAdminPortlet',4,'com_liferay_document_library_web_portlet_DLAdminPortlet',0,20131,0,1,1),(0,1201,20116,'com.liferay.document.library',4,'com.liferay.document.library',0,20123,0,1,1),(0,1202,20116,'com.liferay.document.library',4,'com.liferay.document.library',0,20124,0,1023,1),(0,1203,20116,'com.liferay.document.library',4,'com.liferay.document.library',0,20131,0,465,1),(0,1204,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'com.liferay.document.library.kernel.model.DLFileEntryType',0,20124,0,15,1),(0,1205,20116,'com.liferay.document.library.kernel.model.DLFileEntryType',4,'com.liferay.document.library.kernel.model.DLFileEntryType',0,20123,0,1,1),(0,1206,20116,'com.liferay.document.library.kernel.model.DLFileEntry',4,'com.liferay.document.library.kernel.model.DLFileEntry',0,20124,0,255,1),(0,1207,20116,'com.liferay.document.library.kernel.model.DLFileEntry',4,'com.liferay.document.library.kernel.model.DLFileEntry',0,20123,0,129,1),(0,1208,20116,'com.liferay.document.library.kernel.model.DLFileShortcut',4,'com.liferay.document.library.kernel.model.DLFileShortcut',0,20124,0,15,1),(0,1209,20116,'com.liferay.document.library.kernel.model.DLFileShortcut',4,'com.liferay.document.library.kernel.model.DLFileShortcut',0,20123,0,1,1),(0,1210,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',0,20124,0,15,1),(0,1211,20116,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'com.liferay.document.library.kernel.model.DLFileEntryMetadata-com.liferay.dynamic.data.mapping.model.DDMStructure',0,20123,0,1,1),(0,1212,20116,'com.liferay.document.library.kernel.model.DLFolder',4,'com.liferay.document.library.kernel.model.DLFolder',0,20124,0,511,1),(0,1213,20116,'com.liferay.document.library.kernel.model.DLFolder',4,'com.liferay.document.library.kernel.model.DLFolder',0,20123,0,1,1),(0,1214,20116,'com_liferay_document_library_web_portlet_DLAdminPortlet',2,'20149',20149,20125,0,61,1),(0,1215,20116,'com.liferay.document.library',2,'20149',20149,20125,0,1023,1),(0,1216,20116,'com_liferay_document_library_web_portlet_DLPortlet',4,'com_liferay_document_library_web_portlet_DLPortlet',0,20123,0,1,1),(0,1217,20116,'com_liferay_document_library_web_portlet_DLPortlet',4,'com_liferay_document_library_web_portlet_DLPortlet',0,20124,0,63,1),(0,1218,20116,'com_liferay_document_library_web_portlet_DLPortlet',4,'com_liferay_document_library_web_portlet_DLPortlet',0,20131,0,1,1),(0,1219,20116,'com_liferay_document_library_web_portlet_DLPortlet',1,'20116',20116,20123,0,2,0),(0,1220,20116,'com_liferay_document_library_web_portlet_DLPortlet',1,'20116',20116,20125,0,2,0),(0,1221,20116,'com_liferay_document_library_web_portlet_DLPortlet',1,'20116',20116,20126,0,2,0),(0,1222,20116,'com_liferay_document_library_web_portlet_IGDisplayPortlet',4,'com_liferay_document_library_web_portlet_IGDisplayPortlet',0,20123,0,1,1),(0,1223,20116,'com_liferay_document_library_web_portlet_IGDisplayPortlet',4,'com_liferay_document_library_web_portlet_IGDisplayPortlet',0,20124,0,63,1),(0,1224,20116,'com_liferay_document_library_web_portlet_IGDisplayPortlet',4,'com_liferay_document_library_web_portlet_IGDisplayPortlet',0,20131,0,1,1),(0,1225,20116,'com_liferay_document_library_web_portlet_IGDisplayPortlet',1,'20116',20116,20123,0,2,0),(0,1226,20116,'com_liferay_document_library_web_portlet_IGDisplayPortlet',1,'20116',20116,20125,0,2,0),(0,1227,20116,'com_liferay_document_library_web_portlet_IGDisplayPortlet',1,'20116',20116,20126,0,2,0),(0,1228,20116,'com_liferay_wiki_web_portlet_WikiAdminPortlet',4,'com_liferay_wiki_web_portlet_WikiAdminPortlet',0,20124,0,61,1),(0,1229,20116,'com.liferay.wiki',4,'com.liferay.wiki',0,20124,0,6,0),(0,1230,20116,'com.liferay.wiki.model.WikiPage',4,'com.liferay.wiki.model.WikiPage',0,20124,0,255,1),(0,1231,20116,'com.liferay.wiki.model.WikiPage',4,'com.liferay.wiki.model.WikiPage',0,20123,0,129,1),(0,1232,20116,'com.liferay.wiki.model.WikiNode',4,'com.liferay.wiki.model.WikiNode',0,20124,0,255,1),(0,1233,20116,'com.liferay.wiki.model.WikiNode',4,'com.liferay.wiki.model.WikiNode',0,20123,0,1,1),(0,1234,20116,'com_liferay_wiki_web_portlet_WikiAdminPortlet',2,'20149',20149,20125,0,61,1),(0,1235,20116,'com.liferay.wiki',2,'20149',20149,20125,0,6,0),(0,1236,20116,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',4,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',0,20123,0,1,1),(0,1237,20116,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',4,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',0,20124,0,63,1),(0,1238,20116,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',4,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',0,20131,0,1,1),(0,1239,20116,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',1,'20116',20116,20125,0,2,0),(0,1240,20116,'com_liferay_wiki_web_portlet_WikiDisplayPortlet',1,'20116',20116,20126,0,2,0),(0,1241,20116,'com_liferay_wiki_web_portlet_WikiPortlet',4,'com_liferay_wiki_web_portlet_WikiPortlet',0,20123,0,1,1),(0,1242,20116,'com_liferay_wiki_web_portlet_WikiPortlet',4,'com_liferay_wiki_web_portlet_WikiPortlet',0,20124,0,63,1),(0,1243,20116,'com_liferay_wiki_web_portlet_WikiPortlet',4,'com_liferay_wiki_web_portlet_WikiPortlet',0,20131,0,1,1),(0,1244,20116,'com_liferay_wiki_web_portlet_WikiPortlet',1,'20116',20116,20125,0,2,0),(0,1245,20116,'com_liferay_wiki_web_portlet_WikiPortlet',1,'20116',20116,20126,0,2,0),(0,1246,20116,'com.liferay.portal.kernel.model.LayoutPrototype',4,'31143',31143,20124,20120,15,1),(0,1247,20116,'com.liferay.portal.kernel.model.Group',4,'31144',31144,20124,0,33554431,1),(0,1248,20116,'com.liferay.portal.kernel.model.Layout',4,'31147',31147,20124,20120,1023,1),(0,1249,20116,'com.liferay.portal.kernel.model.Layout',4,'31147',31147,20131,0,529,1),(0,1250,20116,'com.liferay.wiki',4,'31144',31144,20124,0,6,0),(0,1251,20116,'com.liferay.portal.kernel.model.LayoutSetPrototype',4,'31151',31151,20124,20120,15,1),(0,1252,20116,'com.liferay.portal.kernel.model.Group',4,'31152',31152,20124,0,33554431,1),(0,1256,20116,'com.liferay.portal.kernel.model.Layout',4,'31161',31161,20124,20120,1023,1),(0,1257,20116,'com.liferay.portal.kernel.model.Layout',4,'31161',31161,20131,0,529,1),(0,1258,20116,'com.liferay.portal.kernel.model.Layout',4,'31161',31161,20123,0,1,1),(0,1259,20116,'com.liferay.message.boards',4,'31152',31152,20124,0,2047,1),(0,1260,20116,'com.liferay.message.boards',4,'31152',31152,20131,0,421,1),(0,1261,20116,'com.liferay.message.boards',4,'31152',31152,20123,0,1,1),(0,1262,20116,'com.liferay.polls',4,'31152',31152,20124,0,6,0),(0,1263,20116,'com.liferay.portal.kernel.model.Layout',4,'31165',31165,20124,20120,1023,1),(0,1264,20116,'com.liferay.portal.kernel.model.Layout',4,'31165',31165,20131,0,529,1),(0,1265,20116,'com.liferay.portal.kernel.model.Layout',4,'31165',31165,20123,0,1,1),(0,1266,20116,'com.liferay.wiki',4,'31152',31152,20124,0,6,0),(0,1267,20116,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',4,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',0,20123,0,1,1),(0,1268,20116,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',4,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',0,20124,0,61,1),(0,1269,20116,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',4,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',0,20131,0,1,1),(0,1270,20116,'com.liferay.blogs',4,'com.liferay.blogs',0,20124,0,14,0),(0,1271,20116,'com.liferay.blogs',4,'com.liferay.blogs',0,20131,0,8,0),(0,1272,20116,'com.liferay.blogs.kernel.model.BlogsEntry',4,'com.liferay.blogs.kernel.model.BlogsEntry',0,20124,0,127,1),(0,1273,20116,'com.liferay.blogs.kernel.model.BlogsEntry',4,'com.liferay.blogs.kernel.model.BlogsEntry',0,20123,0,65,1),(0,1274,20116,'com_liferay_blogs_web_portlet_BlogsAdminPortlet',2,'20149',20149,20125,0,61,1),(0,1275,20116,'com.liferay.blogs',2,'20149',20149,20125,0,14,0),(0,1276,20116,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',4,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',0,20123,0,1,1),(0,1277,20116,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',4,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',0,20124,0,63,1),(0,1278,20116,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',4,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',0,20131,0,1,1),(0,1279,20116,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',1,'20116',20116,20123,0,2,0),(0,1280,20116,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',1,'20116',20116,20125,0,2,0),(0,1281,20116,'com_liferay_blogs_web_portlet_BlogsAgreggatorPortlet',1,'20116',20116,20126,0,2,0),(0,1282,20116,'com_liferay_blogs_web_portlet_BlogsPortlet',4,'com_liferay_blogs_web_portlet_BlogsPortlet',0,20123,0,1,1),(0,1283,20116,'com_liferay_blogs_web_portlet_BlogsPortlet',4,'com_liferay_blogs_web_portlet_BlogsPortlet',0,20124,0,63,1),(0,1284,20116,'com_liferay_blogs_web_portlet_BlogsPortlet',4,'com_liferay_blogs_web_portlet_BlogsPortlet',0,20131,0,1,1),(0,1285,20116,'com_liferay_blogs_web_portlet_BlogsPortlet',1,'20116',20116,20123,0,2,0),(0,1286,20116,'com_liferay_blogs_web_portlet_BlogsPortlet',1,'20116',20116,20125,0,2,0),(0,1287,20116,'com_liferay_blogs_web_portlet_BlogsPortlet',1,'20116',20116,20126,0,2,0),(0,1288,20116,'com.liferay.portal.kernel.model.LayoutPrototype',4,'31171',31171,20124,20120,15,1),(0,1289,20116,'com.liferay.portal.kernel.model.Group',4,'31172',31172,20124,0,33554431,1),(0,1290,20116,'com.liferay.portal.kernel.model.Layout',4,'31175',31175,20124,20120,1023,1),(0,1291,20116,'com.liferay.portal.kernel.model.Layout',4,'31175',31175,20131,0,529,1),(0,1292,20116,'com.liferay.blogs',4,'31172',31172,20124,0,14,0),(0,1293,20116,'com.liferay.blogs',4,'31172',31172,20131,0,8,0),(0,1294,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',4,'com_liferay_notifications_web_portlet_NotificationsPortlet',0,20123,0,1,1),(0,1295,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',4,'com_liferay_notifications_web_portlet_NotificationsPortlet',0,20124,0,63,1),(0,1296,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',4,'com_liferay_notifications_web_portlet_NotificationsPortlet',0,20131,0,1,1),(0,1297,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',1,'20116',20116,20122,0,2,0),(0,1298,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',1,'20116',20116,20123,0,2,0),(0,1299,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',1,'20116',20116,20125,0,2,0),(1,1300,20116,'com_liferay_notifications_web_portlet_NotificationsPortlet',1,'20116',20116,20126,0,34,0),(0,1301,20116,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',4,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',0,20123,0,1,1),(0,1302,20116,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',4,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',0,20124,0,63,1),(0,1303,20116,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',4,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',0,20131,0,1,1),(0,1304,20116,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',1,'20116',20116,20123,0,2,0),(0,1305,20116,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',1,'20116',20116,20125,0,2,0),(0,1306,20116,'com_liferay_invitation_invite_members_web_portlet_InviteMembersPortlet',1,'20116',20116,20126,0,2,0),(0,1307,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',4,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',0,20123,0,1,1),(0,1308,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',4,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',0,20124,0,31,1),(0,1309,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',4,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',0,20131,0,1,1),(0,1310,20116,'com.liferay.microblogs',4,'com.liferay.microblogs',0,20124,0,6,0),(0,1311,20116,'com.liferay.microblogs.model.MicroblogsEntry',4,'com.liferay.microblogs.model.MicroblogsEntry',0,20124,0,15,1),(0,1312,20116,'com.liferay.microblogs.model.MicroblogsEntry',4,'com.liferay.microblogs.model.MicroblogsEntry',0,20123,0,1,1),(0,1313,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',1,'20116',20116,20122,0,16,0),(0,1314,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',1,'20116',20116,20123,0,16,0),(0,1315,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',1,'20116',20116,20125,0,16,0),(0,1316,20116,'com_liferay_microblogs_web_portlet_MicroblogsPortlet',1,'20116',20116,20126,0,16,0),(0,1317,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',4,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',0,20123,0,1,1),(0,1318,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',4,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',0,20124,0,63,1),(0,1319,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',4,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',0,20131,0,1,1),(0,1320,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',1,'20116',20116,20122,0,2,0),(0,1321,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',1,'20116',20116,20123,0,2,0),(0,1322,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',1,'20116',20116,20125,0,2,0),(0,1323,20116,'com_liferay_microblogs_web_portlet_MicroblogsStatusUpdatePortlet',1,'20116',20116,20126,0,2,0),(0,1324,20116,'com_liferay_calendar_web_portlet_CalendarPortlet',4,'com_liferay_calendar_web_portlet_CalendarPortlet',0,20123,0,1,1),(0,1325,20116,'com_liferay_calendar_web_portlet_CalendarPortlet',4,'com_liferay_calendar_web_portlet_CalendarPortlet',0,20124,0,63,1),(0,1326,20116,'com_liferay_calendar_web_portlet_CalendarPortlet',4,'com_liferay_calendar_web_portlet_CalendarPortlet',0,20131,0,1,1),(0,1327,20116,'com.liferay.calendar',4,'com.liferay.calendar',0,20124,0,6,0),(0,1328,20116,'com_liferay_calendar_web_portlet_CalendarPortlet',1,'20116',20116,20122,0,2,0),(0,1329,20116,'com_liferay_calendar_web_portlet_CalendarPortlet',1,'20116',20116,20125,0,2,0),(0,1330,20116,'com_liferay_calendar_web_portlet_CalendarPortlet',1,'20116',20116,20126,0,2,0),(0,1331,20116,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet',4,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet',0,20124,0,61,1),(0,1332,20116,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet',4,'com_liferay_portal_workflow_kaleo_designer_web_portlet_KaleoDesignerPortlet',0,20131,0,1,1),(0,1333,20116,'com.liferay.portal.workflow.kaleo.designer',4,'com.liferay.portal.workflow.kaleo.designer',0,20124,0,15,1),(0,1334,20116,'com.liferay.portal.workflow.kaleo.designer',4,'com.liferay.portal.workflow.kaleo.designer',0,20131,0,1,1),(0,1335,20116,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition',4,'com.liferay.portal.workflow.kaleo.designer.model.KaleoDraftDefinition',0,20124,0,15,1),(0,1336,20116,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',4,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',0,20123,0,1,1),(0,1337,20116,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',4,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',0,20124,0,63,1),(0,1338,20116,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',4,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',0,20131,0,1,1),(0,1339,20116,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',1,'20116',20116,20122,0,32,0),(0,1340,20116,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',1,'20116',20116,20125,0,32,0),(0,1341,20116,'com_liferay_contacts_web_portlet_ContactsCenterPortlet',1,'20116',20116,20126,0,32,0),(0,1342,20116,'com_liferay_contacts_web_portlet_MembersPortlet',4,'com_liferay_contacts_web_portlet_MembersPortlet',0,20123,0,1,1),(0,1343,20116,'com_liferay_contacts_web_portlet_MembersPortlet',4,'com_liferay_contacts_web_portlet_MembersPortlet',0,20124,0,63,1),(0,1344,20116,'com_liferay_contacts_web_portlet_MembersPortlet',4,'com_liferay_contacts_web_portlet_MembersPortlet',0,20131,0,1,1),(0,1345,20116,'com_liferay_contacts_web_portlet_MembersPortlet',1,'20116',20116,20122,0,2,0),(0,1346,20116,'com_liferay_contacts_web_portlet_MembersPortlet',1,'20116',20116,20123,0,2,0),(0,1347,20116,'com_liferay_contacts_web_portlet_MembersPortlet',1,'20116',20116,20125,0,2,0),(0,1348,20116,'com_liferay_contacts_web_portlet_MembersPortlet',1,'20116',20116,20126,0,2,0),(0,1349,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',4,'com_liferay_contacts_web_portlet_MyContactsPortlet',0,20123,0,1,1),(0,1350,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',4,'com_liferay_contacts_web_portlet_MyContactsPortlet',0,20124,0,63,1),(0,1351,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',4,'com_liferay_contacts_web_portlet_MyContactsPortlet',0,20131,0,1,1),(0,1352,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',1,'20116',20116,20122,0,2,0),(0,1353,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',1,'20116',20116,20123,0,2,0),(0,1354,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',1,'20116',20116,20125,0,2,0),(0,1355,20116,'com_liferay_contacts_web_portlet_MyContactsPortlet',1,'20116',20116,20126,0,2,0),(0,1356,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',4,'com_liferay_contacts_web_portlet_ProfilePortlet',0,20123,0,1,1),(0,1357,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',4,'com_liferay_contacts_web_portlet_ProfilePortlet',0,20124,0,63,1),(0,1358,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',4,'com_liferay_contacts_web_portlet_ProfilePortlet',0,20131,0,1,1),(0,1359,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',1,'20116',20116,20122,0,2,0),(0,1360,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',1,'20116',20116,20123,0,2,0),(0,1361,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',1,'20116',20116,20125,0,2,0),(0,1362,20116,'com_liferay_contacts_web_portlet_ProfilePortlet',1,'20116',20116,20126,0,2,0),(0,1363,20116,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet',4,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet',0,20123,0,1,1),(0,1364,20116,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet',4,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet',0,20124,0,63,1),(0,1365,20116,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet',4,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet',0,20131,0,1,1),(0,1366,20116,'com.liferay.portal.kernel.model.LayoutSetBranch',4,'com.liferay.portal.kernel.model.LayoutSetBranch',0,20124,0,30,0),(0,1367,20116,'com.liferay.portal.kernel.model.Layout',4,'com.liferay.portal.kernel.model.Layout',0,20124,0,1023,1),(0,1368,20116,'com.liferay.portal.kernel.model.Layout',4,'com.liferay.portal.kernel.model.Layout',0,20123,0,1,1),(0,1369,20116,'com.liferay.portal.kernel.model.LayoutBranch',4,'com.liferay.portal.kernel.model.LayoutBranch',0,20124,0,14,0),(0,1370,20116,'com_liferay_layout_admin_web_portlet_GroupPagesPortlet',2,'20149',20149,20125,0,63,1),(0,1371,20116,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet',4,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet',0,20123,0,1,1),(0,1372,20116,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet',4,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet',0,20124,0,63,1),(0,1373,20116,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet',4,'com_liferay_layout_admin_web_portlet_LayoutAdminPortlet',0,20131,0,1,1),(0,1374,20116,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet',4,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet',0,20123,0,1,1),(0,1375,20116,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet',4,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet',0,20124,0,63,1),(0,1376,20116,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet',4,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet',0,20131,0,1,1),(0,1377,20116,'com_liferay_layout_admin_web_portlet_LayoutPrototypePagePortlet',2,'20149',20149,20125,0,63,1),(0,1378,20116,'com_liferay_layout_admin_web_portlet_MyPagesPortlet',4,'com_liferay_layout_admin_web_portlet_MyPagesPortlet',0,20124,0,31,1),(0,1379,20116,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',4,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',0,20123,0,1,1),(0,1380,20116,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',4,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',0,20124,0,63,1),(0,1381,20116,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',4,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',0,20131,0,1,1),(0,1382,20116,'com.liferay.dynamic.data.mapping',4,'com.liferay.dynamic.data.mapping',0,20124,0,6,0),(0,1383,20116,'com.liferay.dynamic.data.mapping',4,'com.liferay.dynamic.data.mapping',0,20131,0,4,0),(0,1384,20116,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstance',4,'com.liferay.dynamic.data.mapping.model.DDMDataProviderInstance',0,20124,0,15,1),(0,1385,20116,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',1,'20116',20116,20125,0,2,0),(0,1386,20116,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',1,'20116',20116,20126,0,2,0),(0,1387,20116,'com_liferay_dynamic_data_mapping_data_provider_web_portlet_DDMDataProviderPortlet',2,'20149',20149,20125,0,63,1),(0,1388,20116,'com.liferay.dynamic.data.mapping',2,'20149',20149,20125,0,6,0),(0,1389,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',4,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',0,20123,0,1,1),(0,1390,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',4,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',0,20124,0,63,1),(0,1391,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',4,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',0,20131,0,1,1),(0,1392,20116,'com.liferay.dynamic.data.lists',4,'com.liferay.dynamic.data.lists',0,20124,0,30,0),(0,1393,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',0,20124,0,15,1),(0,1394,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',4,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMStructure',0,20123,0,1,1),(0,1395,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet',4,'com.liferay.dynamic.data.lists.model.DDLRecordSet',0,20124,0,31,1),(0,1396,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet',4,'com.liferay.dynamic.data.lists.model.DDLRecordSet',0,20123,0,1,1),(0,1397,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',1,'20116',20116,20125,0,2,0),(0,1398,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',1,'20116',20116,20126,0,2,0),(0,1399,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormAdminPortlet',2,'20149',20149,20125,0,63,1),(0,1400,20116,'com.liferay.dynamic.data.lists',2,'20149',20149,20125,0,30,0),(0,1401,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',4,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',0,20123,0,1,1),(0,1402,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',4,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',0,20124,0,31,1),(0,1403,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',4,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',0,20131,0,1,1),(0,1404,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',1,'20116',20116,20123,0,16,0),(0,1405,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',1,'20116',20116,20125,0,16,0),(0,1406,20116,'com_liferay_dynamic_data_lists_form_web_portlet_DDLFormPortlet',1,'20116',20116,20126,0,16,0),(0,1407,20116,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',4,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',0,20123,0,1,1),(0,1408,20116,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',4,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',0,20124,0,63,1),(0,1409,20116,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',4,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',0,20131,0,1,1),(0,1410,20116,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',1,'20116',20116,20123,0,32,0),(0,1411,20116,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',1,'20116',20116,20125,0,32,0),(0,1412,20116,'com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet',1,'20116',20116,20126,0,32,0),(0,1413,20116,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',4,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',0,20123,0,1,1),(0,1414,20116,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',4,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',0,20124,0,63,1),(0,1415,20116,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',4,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',0,20131,0,1,1),(0,1416,20116,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',1,'20116',20116,20123,0,32,0),(0,1417,20116,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',1,'20116',20116,20125,0,32,0),(0,1418,20116,'com_liferay_site_navigation_breadcrumb_web_portlet_SiteNavigationBreadcrumbPortlet',1,'20116',20116,20126,0,32,0),(0,1419,20116,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',4,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',0,20123,0,1,1),(0,1420,20116,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',4,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',0,20124,0,63,1),(0,1421,20116,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',4,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',0,20131,0,1,1),(0,1422,20116,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',1,'20116',20116,20123,0,32,0),(0,1423,20116,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',1,'20116',20116,20125,0,32,0),(0,1424,20116,'com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet',1,'20116',20116,20126,0,32,0),(0,1425,20116,'com.liferay.portal.kernel.model.LayoutSetPrototype',4,'31196',31196,20124,20120,15,1),(0,1426,20116,'com.liferay.portal.kernel.model.Group',4,'31197',31197,20124,0,33554431,1),(0,1430,20116,'com.liferay.portal.kernel.model.Layout',4,'31206',31206,20124,20120,1023,1),(0,1431,20116,'com.liferay.portal.kernel.model.Layout',4,'31206',31206,20131,0,529,1),(0,1432,20116,'com.liferay.portal.kernel.model.Layout',4,'31206',31206,20123,0,1,1),(0,1433,20116,'com.liferay.portal.kernel.model.Layout',4,'31210',31210,20124,20120,1023,1),(0,1434,20116,'com.liferay.portal.kernel.model.Layout',4,'31210',31210,20131,0,529,1),(0,1435,20116,'com.liferay.portal.kernel.model.Layout',4,'31210',31210,20123,0,1,1),(0,1436,20116,'com.liferay.document.library',4,'31197',31197,20124,0,1023,1),(0,1437,20116,'com.liferay.document.library',4,'31197',31197,20131,0,465,1),(0,1438,20116,'com.liferay.document.library',4,'31197',31197,20123,0,1,1),(0,1439,20116,'com.liferay.portal.kernel.model.Layout',4,'31214',31214,20124,20120,1023,1),(0,1440,20116,'com.liferay.portal.kernel.model.Layout',4,'31214',31214,20131,0,529,1),(0,1441,20116,'com.liferay.portal.kernel.model.Layout',4,'31214',31214,20123,0,1,1),(0,1442,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',4,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',0,20123,0,1,1),(0,1443,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',4,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',0,20124,0,31,1),(0,1444,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',4,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',0,20131,0,1,1),(0,1445,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate',0,20124,0,15,1),(0,1446,20116,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'com.liferay.dynamic.data.lists.model.DDLRecordSet-com.liferay.dynamic.data.mapping.model.DDMTemplate',0,20123,0,1,1),(0,1447,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',1,'20116',20116,20123,0,2,0),(0,1448,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',1,'20116',20116,20125,0,2,0),(0,1449,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLDisplayPortlet',1,'20116',20116,20126,0,2,0),(0,1450,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',4,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',0,20123,0,1,1),(0,1451,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',4,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',0,20124,0,63,1),(0,1452,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',4,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',0,20131,0,1,1),(0,1453,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',1,'20116',20116,20125,0,2,0),(0,1454,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',1,'20116',20116,20126,0,2,0),(0,1455,20116,'com_liferay_dynamic_data_lists_web_portlet_DDLPortlet',2,'20149',20149,20125,0,63,1),(0,1456,20116,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',4,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',0,20123,0,1,1),(0,1457,20116,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',4,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',0,20124,0,63,1),(0,1458,20116,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',4,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',0,20131,0,1,1),(0,1459,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'com.liferay.dynamic.data.mapping.model.DDMTemplate',0,20124,0,15,1),(0,1460,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate',4,'com.liferay.dynamic.data.mapping.model.DDMTemplate',0,20123,0,1,1),(0,1461,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure',4,'com.liferay.dynamic.data.mapping.model.DDMStructure',0,20124,0,15,1),(0,1462,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure',4,'com.liferay.dynamic.data.mapping.model.DDMStructure',0,20123,0,1,1),(0,1463,20116,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',1,'20116',20116,20125,0,2,0),(0,1464,20116,'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',1,'20116',20116,20126,0,2,0),(0,1465,20116,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',4,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',0,20123,0,1,1),(0,1466,20116,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',4,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',0,20124,0,63,1),(0,1467,20116,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',4,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',0,20131,0,1,1),(0,1468,20116,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',1,'20116',20116,20122,0,2,0),(0,1469,20116,'com_liferay_dynamic_data_mapping_web_portlet_PortletDisplayTemplatePortlet',2,'20149',20149,20125,0,63,1),(0,1470,20116,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',4,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',0,20123,0,1,1),(0,1471,20116,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',4,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',0,20124,0,63,1),(0,1472,20116,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',4,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',0,20131,0,1,1),(0,1473,20116,'com.liferay.portal.workflow.kaleo.forms',4,'com.liferay.portal.workflow.kaleo.forms',0,20124,0,30,0),(0,1474,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',4,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',0,20124,0,15,1),(0,1475,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',4,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',0,20123,0,1,1),(0,1476,20116,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',4,'com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',0,20124,0,63,1),(0,1477,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',4,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',0,20124,0,15,1),(0,1478,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',4,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.portal.workflow.kaleo.forms.model.KaleoProcess',0,20123,0,1,1),(0,1479,20116,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',1,'20116',20116,20122,0,2,0),(0,1480,20116,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',1,'20116',20116,20125,0,2,0),(0,1481,20116,'com_liferay_portal_workflow_kaleo_forms_web_portlet_KaleoFormsAdminPortlet',2,'20149',20149,20125,0,63,1),(0,1482,20116,'com.liferay.portal.workflow.kaleo.forms',2,'20149',20149,20125,0,30,0),(0,1483,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',4,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',0,20123,0,1,1),(0,1484,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',4,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',0,20124,0,63,1),(0,1485,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',4,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',0,20131,0,1,1),(0,1486,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',1,'20116',20116,20122,0,2,0),(0,1487,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',1,'20116',20116,20123,0,2,0),(0,1488,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',1,'20116',20116,20125,0,2,0),(0,1489,20116,'com_liferay_portal_security_audit_web_portlet_AuditPortlet',1,'20116',20116,20126,0,2,0),(0,1490,20116,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',4,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',0,20123,0,1,1),(0,1491,20116,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',4,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',0,20124,0,63,1),(0,1492,20116,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',4,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',0,20131,0,1,1),(0,1493,20116,'com.liferay.portal.security.service.access.policy',4,'com.liferay.portal.security.service.access.policy',0,20124,0,7,1),(0,1494,20116,'com.liferay.portal.security.service.access.policy.model.SAPEntry',4,'com.liferay.portal.security.service.access.policy.model.SAPEntry',0,20124,0,15,1),(0,1495,20116,'com_liferay_portal_security_service_access_policy_web_portlet_SAPPortlet',1,'20116',20116,20122,0,2,0),(0,1496,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',4,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',0,20123,0,1,1),(0,1497,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',4,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',0,20124,0,63,1),(0,1498,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',4,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',0,20131,0,1,1),(0,1499,20116,'com.liferay.marketplace',4,'com.liferay.marketplace',0,20124,0,15,1),(0,1500,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',1,'20116',20116,20122,0,2,0),(0,1501,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',1,'20116',20116,20123,0,2,0),(0,1502,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',1,'20116',20116,20125,0,2,0),(0,1503,20116,'com_liferay_marketplace_app_manager_web_portlet_MarketplaceAppManagerPortlet',1,'20116',20116,20126,0,2,0),(0,1504,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',4,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',0,20123,0,1,1),(0,1505,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',4,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',0,20124,0,63,1),(0,1506,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',4,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',0,20131,0,1,1),(0,1507,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',1,'20116',20116,20122,0,2,0),(0,1508,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',1,'20116',20116,20123,0,2,0),(0,1509,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',1,'20116',20116,20125,0,2,0),(0,1510,20116,'com_liferay_marketplace_store_web_portlet_MarketplacePurchasedPortlet',1,'20116',20116,20126,0,2,0),(0,1511,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',4,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',0,20123,0,1,1),(0,1512,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',4,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',0,20124,0,63,1),(0,1513,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',4,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',0,20131,0,1,1),(0,1514,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',1,'20116',20116,20122,0,2,0),(0,1515,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',1,'20116',20116,20123,0,2,0),(0,1516,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',1,'20116',20116,20125,0,2,0),(0,1517,20116,'com_liferay_marketplace_store_web_portlet_MarketplaceStorePortlet',1,'20116',20116,20126,0,2,0),(0,1518,20116,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',4,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',0,20123,0,1,1),(0,1519,20116,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',4,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',0,20124,0,63,1),(0,1520,20116,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',4,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',0,20131,0,1,1),(0,1521,20116,'com_liferay_sync_connector_web_portlet_SyncAdminPortlet',1,'20116',20116,20122,0,2,0),(0,1522,20116,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',4,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',0,20123,0,1,1),(0,1523,20116,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',4,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',0,20124,0,63,1),(0,1524,20116,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',4,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',0,20131,0,1,1),(0,1525,20116,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',1,'20116',20116,20125,0,2,0),(1,1526,20116,'com_liferay_sync_connector_web_portlet_SyncDevicesPortlet',1,'20116',20116,20126,0,34,0),(0,1527,20116,'com_liferay_journal_content_web_portlet_JournalContentPortlet',4,'com_liferay_journal_content_web_portlet_JournalContentPortlet',0,20123,0,1,1),(0,1528,20116,'com_liferay_journal_content_web_portlet_JournalContentPortlet',4,'com_liferay_journal_content_web_portlet_JournalContentPortlet',0,20124,0,31,1),(0,1529,20116,'com_liferay_journal_content_web_portlet_JournalContentPortlet',4,'com_liferay_journal_content_web_portlet_JournalContentPortlet',0,20131,0,1,1),(0,1530,20116,'com_liferay_journal_content_web_portlet_JournalContentPortlet',1,'20116',20116,20123,0,16,0),(0,1531,20116,'com_liferay_journal_content_web_portlet_JournalContentPortlet',1,'20116',20116,20125,0,16,0),(0,1532,20116,'com_liferay_journal_content_web_portlet_JournalContentPortlet',1,'20116',20116,20126,0,16,0),(0,1533,20116,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',4,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',0,20123,0,1,1),(0,1534,20116,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',4,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',0,20124,0,63,1),(0,1535,20116,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',4,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',0,20131,0,1,1),(0,1536,20116,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',1,'20116',20116,20123,0,2,0),(0,1537,20116,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',1,'20116',20116,20125,0,2,0),(0,1538,20116,'com_liferay_journal_content_search_web_portlet_JournalContentSearchPortlet',1,'20116',20116,20126,0,2,0),(0,1539,20116,'com_liferay_journal_web_portlet_JournalPortlet',4,'com_liferay_journal_web_portlet_JournalPortlet',0,20123,0,1,1),(0,1540,20116,'com_liferay_journal_web_portlet_JournalPortlet',4,'com_liferay_journal_web_portlet_JournalPortlet',0,20124,0,63,1),(0,1541,20116,'com_liferay_journal_web_portlet_JournalPortlet',4,'com_liferay_journal_web_portlet_JournalPortlet',0,20131,0,1,1),(0,1542,20116,'com.liferay.journal',4,'com.liferay.journal',0,20123,0,1,1),(0,1543,20116,'com.liferay.journal',4,'com.liferay.journal',0,20124,0,511,1),(0,1544,20116,'com.liferay.journal',4,'com.liferay.journal',0,20131,0,1,1),(0,1545,20116,'com.liferay.journal.model.JournalFeed',4,'com.liferay.journal.model.JournalFeed',0,20124,0,15,1),(0,1546,20116,'com.liferay.journal.model.JournalFeed',4,'com.liferay.journal.model.JournalFeed',0,20123,0,1,1),(0,1547,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle',4,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle',0,20124,0,15,1),(0,1548,20116,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle',4,'com.liferay.dynamic.data.mapping.model.DDMStructure-com.liferay.journal.model.JournalArticle',0,20123,0,1,1),(0,1549,20116,'com.liferay.journal.model.JournalArticle',4,'com.liferay.journal.model.JournalArticle',0,20124,0,255,1),(0,1550,20116,'com.liferay.journal.model.JournalArticle',4,'com.liferay.journal.model.JournalArticle',0,20123,0,129,1),(0,1551,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle',4,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle',0,20124,0,15,1),(0,1552,20116,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle',4,'com.liferay.dynamic.data.mapping.model.DDMTemplate-com.liferay.journal.model.JournalArticle',0,20123,0,1,1),(0,1553,20116,'com.liferay.journal.model.JournalFolder',4,'com.liferay.journal.model.JournalFolder',0,20124,0,255,1),(0,1554,20116,'com.liferay.journal.model.JournalFolder',4,'com.liferay.journal.model.JournalFolder',0,20123,0,1,1),(0,1555,20116,'com_liferay_journal_web_portlet_JournalPortlet',1,'20116',20116,20125,0,2,0),(0,1556,20116,'com_liferay_journal_web_portlet_JournalPortlet',1,'20116',20116,20126,0,2,0),(0,1557,20116,'com_liferay_journal_web_portlet_JournalPortlet',2,'20149',20149,20125,0,63,1),(0,1558,20116,'com.liferay.journal',2,'20149',20149,20125,0,511,1),(0,1559,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',4,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',0,20123,0,1,1),(0,1560,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',4,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',0,20124,0,63,1),(0,1561,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',4,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',0,20131,0,1,1),(0,1562,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',1,'20116',20116,20122,0,2,0),(0,1563,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',1,'20116',20116,20123,0,2,0),(0,1564,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',1,'20116',20116,20125,0,2,0),(0,1565,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationPageMenuPortlet',1,'20116',20116,20126,0,2,0),(0,1566,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',4,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',0,20123,0,1,1),(0,1567,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',4,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',0,20124,0,63,1),(0,1568,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',4,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',0,20131,0,1,1),(0,1569,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',1,'20116',20116,20122,0,2,0),(0,1570,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',1,'20116',20116,20123,0,2,0),(0,1571,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',1,'20116',20116,20125,0,2,0),(0,1572,20116,'com_liferay_wiki_navigation_web_portlet_WikiNavigationTreeMenuPortlet',1,'20116',20116,20126,0,2,0),(0,1573,20116,'com.liferay.portal.kernel.model.Layout',4,'31244',31244,20124,20156,1023,1),(0,1574,20116,'com.liferay.portal.kernel.model.Layout',4,'31247',31247,20124,20156,1023,1),(0,1575,20116,'com.liferay.portal.kernel.model.Layout',4,'31247',31247,20126,0,529,1),(0,1576,20116,'com.liferay.portal.kernel.model.Layout',4,'31247',31247,20123,0,1,1),(0,1601,20116,'com.liferay.portal.kernel.model.Group',4,'31303',31303,20124,0,33554431,1),(0,1602,20116,'com.liferay.portal.kernel.model.User',4,'31301',31301,20124,20156,31,1);
UNLOCK TABLES;

--
-- Table structure for table `ResourceTypePermission`
--

CREATE TABLE `ResourceTypePermission` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `resourceTypePermissionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceTypePermissionId`),
  UNIQUE KEY `IX_BA497163` (`companyId`,`groupId`,`name`,`roleId`),
  KEY `IX_7D81F66F` (`companyId`,`name`,`roleId`),
  KEY `IX_A82690E2` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Role_`
--

CREATE TABLE `Role_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `roleId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `type_` int(11) DEFAULT NULL,
  `subtype` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  UNIQUE KEY `IX_A88E424E` (`companyId`,`classNameId`,`classPK`),
  UNIQUE KEY `IX_EBC931B8` (`companyId`,`name`),
  KEY `IX_F3E1C6FC` (`companyId`,`type_`),
  KEY `IX_F436EC8E` (`name`),
  KEY `IX_5EB4E2FB` (`subtype`),
  KEY `IX_CBE204` (`type_`,`subtype`),
  KEY `IX_B9FF6043` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Role_`
--

LOCK TABLES `Role_` WRITE;
INSERT INTO `Role_` VALUES (0,'827ad40e-977d-bbd0-192b-c8ce427d9ab3',20122,20116,20120,NULL,'2017-06-03 00:42:23.083000','2017-06-03 00:42:23.083000',20081,20122,'Administrator',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Administrators are super users who can do anything.</Description></root>',1,NULL),(0,'414c5372-8722-0b60-02aa-14bb00c1c4cc',20123,20116,20120,NULL,'2017-06-03 00:42:23.119000','2017-06-03 00:42:23.119000',20081,20123,'Guest',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Unauthenticated users always have this role.</Description></root>',1,NULL),(0,'b32fd1c1-70a9-e78d-6609-8d7634ea55d0',20124,20116,20120,NULL,'2017-06-03 00:42:23.137000','2017-06-03 00:42:23.137000',20081,20124,'Owner',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">This is an implied role with respect to the objects users create.</Description></root>',1,NULL),(0,'805797df-622d-e390-0631-83ee4f08efeb',20125,20116,20120,NULL,'2017-06-03 00:42:23.153000','2017-06-03 00:42:23.153000',20081,20125,'Power User',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Power Users have their own personal site.</Description></root>',1,NULL),(0,'2954ef88-f122-6813-c912-929247aa0afa',20126,20116,20120,NULL,'2017-06-03 00:42:23.171000','2017-06-03 00:42:23.171000',20081,20126,'User',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Authenticated users should be assigned this role.</Description></root>',1,NULL),(0,'6339ddae-2926-7434-1091-22f93b5ce24d',20127,20116,20120,NULL,'2017-06-03 00:42:23.211000','2017-06-03 00:42:23.211000',20081,20127,'Organization Administrator',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Administrators are super users of their organization but cannot make other users into Organization Administrators.</Description></root>',3,NULL),(0,'0be65e85-a7b2-886a-76bf-e007b0d34c76',20128,20116,20120,NULL,'2017-06-03 00:42:23.225000','2017-06-03 00:42:23.225000',20081,20128,'Organization Owner',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Owners are super users of their organization and can assign organization roles to users.</Description></root>',3,NULL),(0,'b9b67866-1045-48dc-61b2-b09a8efa5175',20129,20116,20120,NULL,'2017-06-03 00:42:23.236000','2017-06-03 00:42:23.236000',20081,20129,'Organization User',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to an organization have this role within that organization.</Description></root>',3,NULL),(0,'e0f3e576-578f-b333-bbba-a554213076cc',20130,20116,20120,NULL,'2017-06-03 00:42:23.248000','2017-06-03 00:42:23.248000',20081,20130,'Site Administrator',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Administrators are super users of their site but cannot make other users into Site Administrators.</Description></root>',2,NULL),(0,'ed6adc08-22c5-e7a9-ac03-c575c0746313',20131,20116,20120,NULL,'2017-06-03 00:42:23.260000','2017-06-03 00:42:23.260000',20081,20131,'Site Member',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to a site have this role within that site.</Description></root>',2,NULL),(0,'cc1160fa-a596-a379-da70-fb668518ab51',20132,20116,20120,NULL,'2017-06-03 00:42:23.273000','2017-06-03 00:42:23.273000',20081,20132,'Site Owner',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Owners are super users of their site and can assign site roles to users.</Description></root>',2,NULL),(0,'0f00e841-39cb-850e-5073-98ceec5ace6e',29013,20116,20120,NULL,'2017-06-03 00:42:35.542000','2017-06-03 00:42:35.542000',20081,29013,'Organization Content Reviewer',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">This is an autogenerated role from the workflow definition.</Description></root>',3,NULL),(0,'0152743d-db15-0c13-b5dc-ff3f7f27e372',29019,20116,20120,NULL,'2017-06-03 00:42:35.557000','2017-06-03 00:42:35.557000',20081,29019,'Site Content Reviewer',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">This is an autogenerated role from the workflow definition.</Description></root>',2,NULL),(0,'a82b4424-c145-4b0c-6df6-03aa17ed49a2',29022,20116,20120,NULL,'2017-06-03 00:42:35.562000','2017-06-03 00:42:35.562000',20081,29022,'Portal Content Reviewer',NULL,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">This is an autogenerated role from the workflow definition.</Description></root>',1,NULL),(0,'fff2b0b3-0d0e-1c38-00a7-f45ab94d819e',31041,20116,20120,NULL,'2017-06-03 00:44:53.403000','2017-06-03 00:44:53.403000',20081,31041,'Test Designer',NULL,NULL,1,NULL),(0,'e23ba62f-852b-6efc-a455-973ec620151f',31042,20116,20120,NULL,'2017-06-03 00:44:53.561000','2017-06-03 00:44:53.561000',20081,31042,'Test Lead',NULL,NULL,1,NULL),(0,'641c96ce-aaaf-b9b2-02b5-6cbab7c1c162',31043,20116,20120,NULL,'2017-06-03 00:44:53.736000','2017-06-03 00:44:53.736000',20081,31043,'Tester',NULL,NULL,1,NULL),(0,'ae2f1bf5-c180-4aca-0228-319aa2545d37',31044,20116,20120,NULL,'2017-06-03 00:44:53.822000','2017-06-03 00:44:53.822000',20081,31044,'Testray Administrator',NULL,NULL,1,NULL),(0,'80eb04b4-30c0-3d3c-7cb1-5b4f4785bc0c',31045,20116,20120,NULL,'2017-06-03 00:44:54.246000','2017-06-03 00:44:54.246000',20081,31045,'Testray User',NULL,NULL,1,NULL);
UNLOCK TABLES;

--
-- Table structure for table `SAPEntry`
--

CREATE TABLE `SAPEntry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `sapEntryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `allowedServiceSignatures` longtext,
  `defaultSAPEntry` tinyint(4) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  PRIMARY KEY (`sapEntryId`),
  KEY `IX_6D669D6F` (`companyId`,`defaultSAPEntry`),
  KEY `IX_90740311` (`companyId`,`name`),
  KEY `IX_AAAEBA0A` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SAPEntry`
--

LOCK TABLES `SAPEntry` WRITE;
INSERT INTO `SAPEntry` VALUES ('b02928ae-c6ab-a436-6d41-5961e093149d',29403,20116,20120,NULL,'2017-06-03 00:42:40.290000','2017-06-03 00:42:40.290000','com.liferay.sync.service.SyncDLObjectService#getSyncContext',1,1,'SYNC_DEFAULT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">SYNC_DEFAULT</Title></root>'),('90a21a56-c614-a24e-9c9b-7a43bb3cfdcc',29404,20116,20120,NULL,'2017-06-03 00:42:40.302000','2017-06-03 00:42:40.302000','com.liferay.sync.service.*',0,1,'SYNC_TOKEN','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">SYNC_TOKEN</Title></root>'),('3c805e0c-0b59-b481-bc1b-79e80d242eac',29405,20116,20120,NULL,'2017-06-03 00:42:40.317000','2017-06-03 00:42:40.317000','com.liferay.calendar.service.CalendarBookingService#search\ncom.liferay.calendar.service.CalendarBookingService#searchCount',1,1,'CALENDAR_DEFAULT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,zh_CN,es_ES,ja_JP,nl_NL,hu_HU,pt_BR,de_DE,iw_IL,fi_FI,ca_ES,fr_FR,\" default-locale=\"en_US\"><Title language-id=\"zh_CN\">公众进入日历搜索 API (Automatic Translation)</Title><Title language-id=\"es_ES\">Acceso público a la búsqueda de calendario API (Automatic Translation)</Title><Title language-id=\"ja_JP\">Public Access to the Calendar Search API (Automatic Copy)</Title><Title language-id=\"nl_NL\">Public Access to the Calendar Search API (Automatic Copy)</Title><Title language-id=\"hu_HU\">A naptár Search API való nyilvános hozzáférés (Automatic Translation)</Title><Title language-id=\"pt_BR\">Acesso do público à busca de calendário API (Automatic Translation)</Title><Title language-id=\"de_DE\">Öffentlicher Zugriff auf Such-API des Kalenders</Title><Title language-id=\"iw_IL\">גישה ציבורית החיפוש לוח שנה API (Automatic Translation)</Title><Title language-id=\"fi_FI\">Public Access to the Calendar Search API (Automatic Copy)</Title><Title language-id=\"ca_ES\">Accés públic a l\'API de cerca de calendari (Automatic Translation)</Title><Title language-id=\"fr_FR\">Accès du public à la recherche de calendrier API (Automatic Translation)</Title><Title language-id=\"en_US\">Public Access to the Calendar Search API</Title></root>'),('2956d7de-6f1d-90a3-d6b2-492a5aa2fddc',30153,20116,20120,NULL,'2017-06-03 00:44:27.548000','2017-06-03 00:44:27.548000','com.liferay.portal.kernel.service.CountryService#getCountries\ncom.liferay.portal.kernel.service.RegionService#getRegions',1,1,'SYSTEM_DEFAULT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">System Service Access Policy Applied on Every Request</Title></root>'),('ac182920-3b68-d8d4-58db-0a6577bbff4c',30154,20116,20120,NULL,'2017-06-03 00:44:27.562000','2017-06-03 00:44:27.562000','*',0,1,'SYSTEM_USER_PASSWORD','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">System Service Access Policy for Requests Authenticated Using User Password</Title></root>');
UNLOCK TABLES;

--
-- Table structure for table `ServiceComponent`
--

CREATE TABLE `ServiceComponent` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `serviceComponentId` bigint(20) NOT NULL,
  `buildNamespace` varchar(75) DEFAULT NULL,
  `buildNumber` bigint(20) DEFAULT NULL,
  `buildDate` bigint(20) DEFAULT NULL,
  `data_` longtext,
  PRIMARY KEY (`serviceComponentId`),
  UNIQUE KEY `IX_4F0315B8` (`buildNamespace`,`buildNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ServiceComponent`
--

LOCK TABLES `ServiceComponent` WRITE;
INSERT INTO `ServiceComponent` VALUES (0,27203,'Bookmarks',2,1454719820635,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,27301,'Flags',2,1454719855705,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,27402,'IM',1,1455550401806,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,27502,'Microblogs',3,1454719889744,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,27604,'Wiki',2,1454719940880,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,27705,'Calendar',5,1454719830714,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,28004,'Polls',2,1454719903688,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,28102,'KaleoDesigner',2,1343264313201,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,28417,'Kaleo',9,1454719802532,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,28502,'Contacts',2,1343264272450,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,28605,'MDR',3,1454719897533,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,28702,'BackgroundTask',2,1454719807550,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,28901,'PortalInstances',1,1477512433639,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,29002,'Lock',2,1454719810794,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,29044,'DDM',2,1454719850972,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,29048,'DDL',1,1455828666350,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,29209,'KaleoForms',3,1425751448273,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,29302,'Audit',2,1343264257622,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,29402,'SAP',3,1454719911670,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,29503,'Marketplace',6,1459893726893,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,30704,'Sync',8,1466622039628,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,30807,'Journal',2,1454719879908,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(0,31040,'OSB',14,1491313881982,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table OSB_TestrayArchive (\n	testrayArchiveId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	classPK LONG,\n	className VARCHAR(75) null,\n	compressedData BLOB\n);\n\ncreate table OSB_TestrayAssignment (\n	testrayAssignmentId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	assignedUserId LONG,\n	classNameId LONG,\n	classPK LONG\n);\n\ncreate table OSB_TestrayBuild (\n	testrayBuildId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	templateTestrayBuildId LONG,\n	testrayBuildTypeId LONG,\n	testrayProductVersionId LONG,\n	testrayProjectId LONG,\n	name VARCHAR(150) null,\n	description STRING null,\n	template BOOLEAN,\n	dueDate DATE null,\n	githubCompareURLs VARCHAR(500) null,\n	promoted BOOLEAN,\n	archived BOOLEAN\n);\n\ncreate table OSB_TestrayBuildMetric (\n	testrayBuildMetricId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayBuildId LONG,\n	testrayCaseTypeId LONG,\n	status INTEGER,\n	count LONG\n);\n\ncreate table OSB_TestrayBuildType (\n	testrayBuildTypeId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayProjectId LONG,\n	name VARCHAR(75) null,\n	autoanalyze BOOLEAN\n);\n\ncreate table OSB_TestrayBuilds_TestrayCases (\n	companyId LONG not null,\n	testrayBuildId LONG not null,\n	testrayCaseId LONG not null,\n	primary key (testrayBuildId, testrayCaseId)\n);\n\ncreate table OSB_TestrayCase (\n	testrayCaseId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayCaseTypeId LONG,\n	testrayComponentId LONG,\n	testrayProjectId LONG,\n	name VARCHAR(150) null,\n	description STRING null,\n	originationKey LONG,\n	priority INTEGER,\n	estimatedDuration INTEGER,\n	steps STRING null,\n	caseNumber LONG\n);\n\ncreate table OSB_TestrayCaseResult (\n	testrayCaseResultId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	commentMBMessageId LONG,\n	testrayBuildId LONG,\n	testrayCaseId LONG,\n	testrayComponentId LONG,\n	testrayRunId LONG,\n	assignedUserId LONG,\n	startDate DATE null,\n	closedDate DATE null,\n	attachments STRING null,\n	errors STRING null,\n	status INTEGER\n);\n\ncreate table OSB_TestrayCaseResultWarning (\n	testrayCaseResultWarningId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayCaseResultId LONG,\n	content STRING null\n);\n\ncreate table OSB_TestrayCaseResults_TestrayIssues (\n	companyId LONG not null,\n	testrayCaseResultId LONG not null,\n	testrayIssueId LONG not null,\n	primary key (testrayCaseResultId, testrayIssueId)\n);\n\ncreate table OSB_TestrayCaseType (\n	testrayCaseTypeId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(75) null,\n	testTypeLabel VARCHAR(75) null\n);\n\ncreate table OSB_TestrayCases_TestrayComponents (\n	companyId LONG not null,\n	testrayCaseId LONG not null,\n	testrayComponentId LONG not null,\n	primary key (testrayCaseId, testrayComponentId)\n);\n\ncreate table OSB_TestrayComponent (\n	testrayComponentId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayProjectId LONG,\n	testrayTeamId LONG,\n	name VARCHAR(75) null,\n	originationKey LONG\n);\n\ncreate table OSB_TestrayFactor (\n	testrayFactorId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	classNameId LONG,\n	classPK LONG,\n	testrayFactorCategoryId LONG,\n	testrayFactorCategoryName VARCHAR(75) null,\n	testrayFactorOptionId LONG,\n	testrayFactorOptionName VARCHAR(75) null\n);\n\ncreate table OSB_TestrayFactorCategory (\n	testrayFactorCategoryId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(75) null\n);\n\ncreate table OSB_TestrayFactorOption (\n	testrayFactorOptionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayFactorCategoryId LONG,\n	name VARCHAR(75) null\n);\n\ncreate table OSB_TestrayIssue (\n	testrayIssueId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(150) null\n);\n\ncreate table OSB_TestrayProductVersion (\n	testrayProductVersionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayProjectId LONG,\n	name VARCHAR(75) null\n);\n\ncreate table OSB_TestrayProject (\n	testrayProjectId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(150) null,\n	description STRING null\n);\n\ncreate table OSB_TestrayRun (\n	testrayRunId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayBuildId LONG,\n	name VARCHAR(150) null,\n	description STRING null,\n	externalReferencePK VARCHAR(255) null,\n	externalReferenceType INTEGER,\n	jenkinsJobKey LONG,\n	number_ LONG,\n	environmentHash VARCHAR(75) null\n);\n\ncreate table OSB_TestraySubtask (\n	testraySubtaskId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	commentMBMessageId LONG,\n	mergedToTestraySubtaskId LONG,\n	splitFromTestraySubtaskId LONG,\n	testrayTaskId LONG,\n	name VARCHAR(75) null,\n	score INTEGER,\n	status INTEGER,\n	statusUpdateDate DATE null\n);\n\ncreate table OSB_TestraySubtasks_TestrayCaseResults (\n	companyId LONG not null,\n	testrayCaseResultId LONG not null,\n	testraySubtaskId LONG not null,\n	primary key (testrayCaseResultId, testraySubtaskId)\n);\n\ncreate table OSB_TestraySubtasks_TestrayIssues (\n	companyId LONG not null,\n	testrayIssueId LONG not null,\n	testraySubtaskId LONG not null,\n	primary key (testrayIssueId, testraySubtaskId)\n);\n\ncreate table OSB_TestraySuite (\n	testraySuiteId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayProjectId LONG,\n	name VARCHAR(75) null,\n	description STRING null,\n	caseParameters STRING null\n);\n\ncreate table OSB_TestraySuites_TestrayCases (\n	companyId LONG not null,\n	testrayCaseId LONG not null,\n	testraySuiteId LONG not null,\n	primary key (testrayCaseId, testraySuiteId)\n);\n\ncreate table OSB_TestrayTask (\n	testrayTaskId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayBuildId LONG,\n	name VARCHAR(150) null,\n	status INTEGER,\n	statusUpdateDate DATE null\n);\n\ncreate table OSB_TestrayTasks_TestrayCaseTypes (\n	companyId LONG not null,\n	testrayCaseTypeId LONG not null,\n	testrayTaskId LONG not null,\n	primary key (testrayCaseTypeId, testrayTaskId)\n);\n\ncreate table OSB_TestrayTeam (\n	testrayTeamId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	testrayProjectId LONG,\n	name VARCHAR(75) null\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create unique index IX_57029B81 on OSB_TestrayBuildMetric (testrayBuildId, testrayCaseTypeId, status);\n\ncreate index IX_B8573C94 on OSB_TestrayBuilds_TestrayCases (companyId);\ncreate index IX_20CBE2F9 on OSB_TestrayBuilds_TestrayCases (testrayBuildId);\ncreate index IX_D374433F on OSB_TestrayBuilds_TestrayCases (testrayCaseId);\n\ncreate unique index IX_E3EAF8FC on OSB_TestrayCase (testrayProjectId, name[$COLUMN_LENGTH:150$]);\n\ncreate index IX_A700B728 on OSB_TestrayCaseResult (createDate);\ncreate index IX_A08EDB4F on OSB_TestrayCaseResult (testrayBuildId);\ncreate index IX_21E5E829 on OSB_TestrayCaseResult (testrayCaseId);\ncreate index IX_E79A1BE0 on OSB_TestrayCaseResult (testrayComponentId, testrayRunId);\ncreate index IX_7631F5EC on OSB_TestrayCaseResult (testrayRunId);\n\ncreate index IX_F6B7D0B2 on OSB_TestrayCaseResultWarning (testrayCaseResultId);\n\ncreate index IX_49918CC0 on OSB_TestrayCaseResults_TestrayIssues (companyId);\ncreate index IX_7F6E24A8 on OSB_TestrayCaseResults_TestrayIssues (testrayCaseResultId);\ncreate index IX_711D8338 on OSB_TestrayCaseResults_TestrayIssues (testrayIssueId);\n\ncreate index IX_185D7EE7 on OSB_TestrayCases_TestrayComponents (companyId);\ncreate index IX_671B2412 on OSB_TestrayCases_TestrayComponents (testrayCaseId);\ncreate index IX_A0EBE615 on OSB_TestrayCases_TestrayComponents (testrayComponentId);\n\ncreate index IX_5E2C79A1 on OSB_TestrayFactor (classNameId, classPK);\n\ncreate index IX_3F42321A on OSB_TestraySubtasks_TestrayCaseResults (companyId);\ncreate index IX_D8BB6182 on OSB_TestraySubtasks_TestrayCaseResults (testrayCaseResultId);\ncreate index IX_78C8D50A on OSB_TestraySubtasks_TestrayCaseResults (testraySubtaskId);\n\ncreate index IX_7DD2C30A on OSB_TestraySubtasks_TestrayIssues (companyId);\ncreate index IX_6174AB2E on OSB_TestraySubtasks_TestrayIssues (testrayIssueId);\ncreate index IX_C490561A on OSB_TestraySubtasks_TestrayIssues (testraySubtaskId);\n\ncreate index IX_FEDBA5CA on OSB_TestraySuites_TestrayCases (companyId);\ncreate index IX_2952175 on OSB_TestraySuites_TestrayCases (testrayCaseId);\ncreate index IX_BC07070D on OSB_TestraySuites_TestrayCases (testraySuiteId);\n\ncreate index IX_6CA79E29 on OSB_TestrayTasks_TestrayCaseTypes (companyId);\ncreate index IX_9470ED2E on OSB_TestrayTasks_TestrayCaseTypes (testrayCaseTypeId);\ncreate index IX_25285A29 on OSB_TestrayTasks_TestrayCaseTypes (testrayTaskId);]]></indexes-sql>\n</data>');
UNLOCK TABLES;

--
-- Table structure for table `SocialActivity`
--

CREATE TABLE `SocialActivity` (
  `activityId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `activitySetId` bigint(20) DEFAULT NULL,
  `mirrorActivityId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `parentClassNameId` bigint(20) DEFAULT NULL,
  `parentClassPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `receiverUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activityId`),
  UNIQUE KEY `IX_8F32DEC9` (`groupId`,`userId`,`createDate`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  KEY `IX_F542E9BC` (`activitySetId`),
  KEY `IX_D0E9029E` (`classNameId`,`classPK`,`type_`),
  KEY `IX_64B1BC66` (`companyId`),
  KEY `IX_FB604DC7` (`groupId`,`userId`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  KEY `IX_1F00C374` (`mirrorActivityId`,`classNameId`,`classPK`),
  KEY `IX_121CA3CB` (`receiverUserId`),
  KEY `IX_3504B8BC` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SocialActivityAchievement`
--

CREATE TABLE `SocialActivityAchievement` (
  `activityAchievementId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `firstInGroup` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`activityAchievementId`),
  UNIQUE KEY `IX_D4390CAA` (`groupId`,`userId`,`name`),
  KEY `IX_83E16F2F` (`groupId`,`firstInGroup`),
  KEY `IX_8F6408F0` (`groupId`,`name`),
  KEY `IX_AABC18E9` (`groupId`,`userId`,`firstInGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SocialActivityCounter`
--

CREATE TABLE `SocialActivityCounter` (
  `activityCounterId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `currentValue` int(11) DEFAULT NULL,
  `totalValue` int(11) DEFAULT NULL,
  `graceValue` int(11) DEFAULT NULL,
  `startPeriod` int(11) DEFAULT NULL,
  `endPeriod` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`activityCounterId`),
  UNIQUE KEY `IX_1B7E3B67` (`groupId`,`classNameId`,`classPK`,`name`,`ownerType`,`endPeriod`),
  UNIQUE KEY `IX_374B35AE` (`groupId`,`classNameId`,`classPK`,`name`,`ownerType`,`startPeriod`),
  KEY `IX_A4B9A23B` (`classNameId`,`classPK`),
  KEY `IX_926CDD04` (`groupId`,`classNameId`,`classPK`,`ownerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SocialActivityLimit`
--

CREATE TABLE `SocialActivityLimit` (
  `activityLimitId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `activityType` int(11) DEFAULT NULL,
  `activityCounterName` varchar(75) DEFAULT NULL,
  `value` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`activityLimitId`),
  UNIQUE KEY `IX_F1C1A617` (`groupId`,`userId`,`classNameId`,`classPK`,`activityType`,`activityCounterName`),
  KEY `IX_B15863FA` (`classNameId`,`classPK`),
  KEY `IX_6F9EDE9F` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SocialActivitySet`
--

CREATE TABLE `SocialActivitySet` (
  `activitySetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `modifiedDate` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `activityCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`activitySetId`),
  KEY `IX_4460FA14` (`classNameId`,`classPK`,`type_`),
  KEY `IX_9BE30DDF` (`groupId`,`userId`,`classNameId`,`type_`),
  KEY `IX_F71071BD` (`groupId`,`userId`,`type_`),
  KEY `IX_62AC101A` (`userId`,`classNameId`,`classPK`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SocialActivitySetting`
--

CREATE TABLE `SocialActivitySetting` (
  `activitySettingId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `activityType` int(11) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`activitySettingId`),
  KEY `IX_384788CD` (`groupId`,`activityType`),
  KEY `IX_D984AABA` (`groupId`,`classNameId`,`activityType`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SocialRelation`
--

CREATE TABLE `SocialRelation` (
  `uuid_` varchar(75) DEFAULT NULL,
  `relationId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `userId1` bigint(20) DEFAULT NULL,
  `userId2` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  PRIMARY KEY (`relationId`),
  UNIQUE KEY `IX_12A92145` (`userId1`,`userId2`,`type_`),
  KEY `IX_95135D1C` (`companyId`,`type_`),
  KEY `IX_C31A64C6` (`type_`),
  KEY `IX_4B52BE89` (`userId1`,`type_`),
  KEY `IX_3F9C2FA8` (`userId2`,`type_`),
  KEY `IX_5B30F663` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SocialRequest`
--

CREATE TABLE `SocialRequest` (
  `uuid_` varchar(75) DEFAULT NULL,
  `requestId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `modifiedDate` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `receiverUserId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`requestId`),
  UNIQUE KEY `IX_36A90CA7` (`userId`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  UNIQUE KEY `IX_4F973EFE` (`uuid_`,`groupId`),
  KEY `IX_D3425487` (`classNameId`,`classPK`,`type_`,`receiverUserId`,`status`),
  KEY `IX_A90FE5A0` (`companyId`),
  KEY `IX_D9380CB7` (`receiverUserId`,`status`),
  KEY `IX_CC86A444` (`userId`,`classNameId`,`classPK`,`type_`,`status`),
  KEY `IX_AB5906A8` (`userId`,`status`),
  KEY `IX_8D42897C` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Subscription`
--

CREATE TABLE `Subscription` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `subscriptionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `frequency` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`subscriptionId`),
  UNIQUE KEY `IX_2E1A92D4` (`companyId`,`userId`,`classNameId`,`classPK`),
  KEY `IX_786D171A` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_1290B81` (`groupId`,`userId`),
  KEY `IX_E8F34171` (`userId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SyncDLFileVersionDiff`
--

CREATE TABLE `SyncDLFileVersionDiff` (
  `syncDLFileVersionDiffId` bigint(20) NOT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `sourceFileVersionId` bigint(20) DEFAULT NULL,
  `targetFileVersionId` bigint(20) DEFAULT NULL,
  `dataFileEntryId` bigint(20) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `expirationDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`syncDLFileVersionDiffId`),
  UNIQUE KEY `IX_AC4C7667` (`fileEntryId`,`sourceFileVersionId`,`targetFileVersionId`),
  KEY `IX_A9B43C55` (`expirationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SyncDLObject`
--

CREATE TABLE `SyncDLObject` (
  `syncDLObjectId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createTime` bigint(20) DEFAULT NULL,
  `modifiedTime` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `description` longtext,
  `changeLog` varchar(75) DEFAULT NULL,
  `extraSettings` longtext,
  `version` varchar(75) DEFAULT NULL,
  `versionId` bigint(20) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `checksum` varchar(75) DEFAULT NULL,
  `event` varchar(75) DEFAULT NULL,
  `lastPermissionChangeDate` datetime(6) DEFAULT NULL,
  `lockExpirationDate` datetime(6) DEFAULT NULL,
  `lockUserId` bigint(20) DEFAULT NULL,
  `lockUserName` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  `typeUuid` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`syncDLObjectId`),
  UNIQUE KEY `IX_E3F57BD6` (`type_`,`typePK`),
  KEY `IX_8D4FDC9F` (`modifiedTime`,`repositoryId`,`event`),
  KEY `IX_A3ACE372` (`modifiedTime`,`repositoryId`,`parentFolderId`),
  KEY `IX_38C38A09` (`repositoryId`,`event`),
  KEY `IX_3BE7BB8D` (`repositoryId`,`parentFolderId`,`type_`),
  KEY `IX_57F62914` (`repositoryId`,`type_`),
  KEY `IX_EE41CBEB` (`treePath`(255),`event`),
  KEY `IX_28CD54BB` (`type_`,`version`),
  KEY `IX_1CCA3B5` (`version`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SyncDevice`
--

CREATE TABLE `SyncDevice` (
  `uuid_` varchar(75) DEFAULT NULL,
  `syncDeviceId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `buildNumber` bigint(20) DEFAULT NULL,
  `featureSet` int(11) DEFAULT NULL,
  `hostname` varchar(75) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`syncDeviceId`),
  KEY `IX_176DF87B` (`companyId`,`userName`),
  KEY `IX_A18EDDB1` (`userId`),
  KEY `IX_AE38DEAB` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `SystemEvent`
--

CREATE TABLE `SystemEvent` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `systemEventId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `referrerClassNameId` bigint(20) DEFAULT NULL,
  `parentSystemEventId` bigint(20) DEFAULT NULL,
  `systemEventSetKey` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  PRIMARY KEY (`systemEventId`),
  KEY `IX_FFCBB747` (`groupId`,`classNameId`,`classPK`,`type_`),
  KEY `IX_A19C89FF` (`groupId`,`systemEventSetKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SystemEvent`
--

LOCK TABLES `SystemEvent` WRITE;
INSERT INTO `SystemEvent` VALUES (0,31011,31002,20116,0,NULL,'2017-06-03 00:44:41.359000',20047,31005,'a7536e34-cb53-66ca-81df-32524573d011',0,0,31012,1,'{\"privateLayout\":\"true\"}'),(0,31159,31152,20116,0,NULL,'2017-06-03 00:45:07.973000',20047,31155,'0489b081-7e65-8c20-e2a7-148675ff9d2f',0,0,31160,1,'{\"privateLayout\":\"true\"}'),(0,31204,31197,20116,0,NULL,'2017-06-03 00:45:10.427000',20047,31200,'bc9f7ae6-0e89-5b8e-9987-5cdfe0c33099',0,0,31205,1,'{\"privateLayout\":\"true\"}');
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `teamId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`teamId`),
  UNIQUE KEY `IX_143DC786` (`groupId`,`name`),
  UNIQUE KEY `IX_39F69E79` (`uuid_`,`groupId`),
  KEY `IX_5D47F637` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Ticket`
--

CREATE TABLE `Ticket` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `ticketId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraInfo` longtext,
  `expirationDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ticketId`),
  KEY `IX_1E8DFB2E` (`classNameId`,`classPK`,`type_`),
  KEY `IX_B2468446` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `TrashEntry`
--

CREATE TABLE `TrashEntry` (
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `systemEventSetKey` bigint(20) DEFAULT NULL,
  `typeSettings` longtext,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_B35F73D5` (`classNameId`,`classPK`),
  KEY `IX_2674F2A8` (`companyId`),
  KEY `IX_FC4EEA64` (`groupId`,`classNameId`),
  KEY `IX_6CAAE2E8` (`groupId`,`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `TrashVersion`
--

CREATE TABLE `TrashVersion` (
  `versionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `entryId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `typeSettings` longtext,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`versionId`),
  UNIQUE KEY `IX_630A643B` (`classNameId`,`classPK`),
  KEY `IX_72D58D37` (`entryId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserGroup`
--

CREATE TABLE `UserGroup` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `userGroupId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `parentUserGroupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `addedByLDAPImport` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userGroupId`),
  UNIQUE KEY `IX_23EAD0D` (`companyId`,`name`),
  KEY `IX_69771487` (`companyId`,`parentUserGroupId`),
  KEY `IX_72394F8E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserGroupGroupRole`
--

CREATE TABLE `UserGroupGroupRole` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `userGroupId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userGroupId`,`groupId`,`roleId`),
  KEY `IX_CAB0CCC8` (`groupId`,`roleId`),
  KEY `IX_1CDF88C` (`roleId`),
  KEY `IX_73C52252` (`userGroupId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserGroupRole`
--

CREATE TABLE `UserGroupRole` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `userId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`groupId`,`roleId`),
  KEY `IX_871412DF` (`groupId`,`roleId`),
  KEY `IX_887A2C95` (`roleId`),
  KEY `IX_4D040680` (`userId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserGroups_Teams`
--

CREATE TABLE `UserGroups_Teams` (
  `companyId` bigint(20) NOT NULL,
  `teamId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`teamId`,`userGroupId`),
  KEY `IX_2AC5356C` (`companyId`),
  KEY `IX_31FB0B08` (`teamId`),
  KEY `IX_7F187E63` (`userGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserIdMapper`
--

CREATE TABLE `UserIdMapper` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `userIdMapperId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `description` varchar(75) DEFAULT NULL,
  `externalUserId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`userIdMapperId`),
  UNIQUE KEY `IX_41A32E0D` (`type_`,`externalUserId`),
  UNIQUE KEY `IX_D1C44A6E` (`userId`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserNotificationDelivery`
--

CREATE TABLE `UserNotificationDelivery` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `userNotificationDeliveryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `notificationType` int(11) DEFAULT NULL,
  `deliveryType` int(11) DEFAULT NULL,
  `deliver` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userNotificationDeliveryId`),
  UNIQUE KEY `IX_8B6E3ACE` (`userId`,`portletId`,`classNameId`,`notificationType`,`deliveryType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserNotificationEvent`
--

CREATE TABLE `UserNotificationEvent` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `userNotificationEventId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(200) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `deliveryType` int(11) DEFAULT NULL,
  `deliverBy` bigint(20) DEFAULT NULL,
  `delivered` tinyint(4) DEFAULT NULL,
  `payload` longtext,
  `actionRequired` tinyint(4) DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userNotificationEventId`),
  KEY `IX_BF29100B` (`type_`),
  KEY `IX_5CE95F03` (`userId`,`actionRequired`,`archived`),
  KEY `IX_3DBB361A` (`userId`,`archived`),
  KEY `IX_E32CC19` (`userId`,`delivered`,`actionRequired`),
  KEY `IX_C4EFBD45` (`userId`,`deliveryType`,`actionRequired`,`archived`),
  KEY `IX_A87A585C` (`userId`,`deliveryType`,`archived`),
  KEY `IX_A6F83617` (`userId`,`deliveryType`,`delivered`,`actionRequired`),
  KEY `IX_8FB65EC1` (`userId`,`type_`,`deliveryType`,`delivered`),
  KEY `IX_A6BAFDFE` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserTracker`
--

CREATE TABLE `UserTracker` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `userTrackerId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `sessionId` varchar(200) DEFAULT NULL,
  `remoteAddr` varchar(75) DEFAULT NULL,
  `remoteHost` varchar(75) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userTrackerId`),
  KEY `IX_29BA1CF5` (`companyId`),
  KEY `IX_46B0AE8E` (`sessionId`),
  KEY `IX_E4EFBA8D` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `UserTrackerPath`
--

CREATE TABLE `UserTrackerPath` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `userTrackerPathId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userTrackerId` bigint(20) DEFAULT NULL,
  `path_` longtext,
  `pathDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`userTrackerPathId`),
  KEY `IX_14D8BCC0` (`userTrackerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `User_`
--

CREATE TABLE `User_` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `defaultUser` tinyint(4) DEFAULT NULL,
  `contactId` bigint(20) DEFAULT NULL,
  `password_` varchar(75) DEFAULT NULL,
  `passwordEncrypted` tinyint(4) DEFAULT NULL,
  `passwordReset` tinyint(4) DEFAULT NULL,
  `passwordModifiedDate` datetime(6) DEFAULT NULL,
  `digest` varchar(255) DEFAULT NULL,
  `reminderQueryQuestion` varchar(75) DEFAULT NULL,
  `reminderQueryAnswer` varchar(75) DEFAULT NULL,
  `graceLoginCount` int(11) DEFAULT NULL,
  `screenName` varchar(75) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `facebookId` bigint(20) DEFAULT NULL,
  `googleUserId` varchar(75) DEFAULT NULL,
  `ldapServerId` bigint(20) DEFAULT NULL,
  `openId` varchar(1024) DEFAULT NULL,
  `portraitId` bigint(20) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  `timeZoneId` varchar(75) DEFAULT NULL,
  `greeting` varchar(255) DEFAULT NULL,
  `comments` longtext,
  `firstName` varchar(75) DEFAULT NULL,
  `middleName` varchar(75) DEFAULT NULL,
  `lastName` varchar(75) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `loginDate` datetime(6) DEFAULT NULL,
  `loginIP` varchar(75) DEFAULT NULL,
  `lastLoginDate` datetime(6) DEFAULT NULL,
  `lastLoginIP` varchar(75) DEFAULT NULL,
  `lastFailedLoginDate` datetime(6) DEFAULT NULL,
  `failedLoginAttempts` int(11) DEFAULT NULL,
  `lockout` tinyint(4) DEFAULT NULL,
  `lockoutDate` datetime(6) DEFAULT NULL,
  `agreedToTermsOfUse` tinyint(4) DEFAULT NULL,
  `emailAddressVerified` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `IX_615E9F7A` (`companyId`,`emailAddress`),
  UNIQUE KEY `IX_C5806019` (`companyId`,`screenName`),
  UNIQUE KEY `IX_9782AD88` (`companyId`,`userId`),
  UNIQUE KEY `IX_5ADBE171` (`contactId`),
  KEY `IX_BCFDA257` (`companyId`,`createDate`,`modifiedDate`),
  KEY `IX_C6EA4F34` (`companyId`,`defaultUser`,`status`),
  KEY `IX_1D731F03` (`companyId`,`facebookId`),
  KEY `IX_B6E3AE1` (`companyId`,`googleUserId`),
  KEY `IX_EE8ABD19` (`companyId`,`modifiedDate`),
  KEY `IX_89509087` (`companyId`,`openId`(255)),
  KEY `IX_F6039434` (`companyId`,`status`),
  KEY `IX_762F63C6` (`emailAddress`),
  KEY `IX_A18034A4` (`portraitId`),
  KEY `IX_405CC0E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User_`
--

LOCK TABLES `User_` WRITE;
INSERT INTO `User_` VALUES (0,'f48b9304-8079-3359-6b8a-44de5a82cbb7',20120,20116,'2017-06-03 00:42:22.978000','2017-06-03 00:42:22.978000',1,20121,'password',0,0,NULL,'5533ed38b5e33c076a804bb4bca644f9,99972e2d98120fd5622e3acb2d069f98,99972e2d98120fd5622e3acb2d069f98',NULL,NULL,0,'20120','default@liferay.com',0,NULL,0,NULL,0,'en_US','UTC','Welcome!',NULL,NULL,NULL,NULL,NULL,'2017-06-03 00:42:22.868000',NULL,NULL,NULL,NULL,0,0,NULL,1,0,0),(5,'c58b5756-7f65-79b7-35f5-d7cb3fc7ab4e',20156,20116,'2017-06-03 00:42:24.575000','2017-06-03 00:46:45.838000',0,20157,'{PBKDF2WITHHMACSHA1}AAAAoAAB9ABRBLnl5DPmgbw3KY/jUwO/udu0OFStkUG2STiS',1,0,NULL,'e5d86c6f3672e52795891c3597f20de0,751da756639bc033b572ba2e7849b589,661bac48a3b1b89826c6b0fb9f75de20','what-is-your-father\'s-middle-name','test',0,'test','test@liferay.com',0,NULL,-1,NULL,0,'en_US','UTC','Welcome Test Test!',NULL,'Test',NULL,'Test',NULL,'2017-06-03 00:46:35.770000','127.0.0.1','2017-06-03 00:42:24.652000',NULL,NULL,0,0,NULL,1,1,0),(2,'caa5bd34-4ed1-c0b9-57c7-0a90f54de7bf',31301,20116,'2017-06-03 00:49:07.170000','2017-06-03 00:51:32.694000',0,31302,'{PBKDF2WITHHMACSHA1}AAAAoAAB9AByH+hBvnZd2athwDmSrfSR6avTwWaV8JBPoBqz',1,0,'2017-06-03 00:51:32.686000',NULL,NULL,NULL,0,'sir.testalot','sir.testalot@liferay.com',0,NULL,-1,NULL,0,'en_US','UTC','Welcome Sir Testalot!',NULL,'Sir',NULL,'Testalot',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,0,0);
UNLOCK TABLES;

--
-- Table structure for table `Users_Groups`
--

CREATE TABLE `Users_Groups` (
  `companyId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`userId`),
  KEY `IX_3499B657` (`companyId`),
  KEY `IX_C4F9E699` (`groupId`),
  KEY `IX_F10B6C6B` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users_Groups`
--

LOCK TABLES `Users_Groups` WRITE;
INSERT INTO `Users_Groups` VALUES (20116,20143,20156);
UNLOCK TABLES;

--
-- Table structure for table `Users_Orgs`
--

CREATE TABLE `Users_Orgs` (
  `companyId` bigint(20) NOT NULL,
  `organizationId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`organizationId`,`userId`),
  KEY `IX_5FBB883C` (`companyId`),
  KEY `IX_7EF4EC0E` (`organizationId`),
  KEY `IX_FB646CA6` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Users_Roles`
--

CREATE TABLE `Users_Roles` (
  `companyId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `IX_F987A0DC` (`companyId`),
  KEY `IX_C19E5F31` (`roleId`),
  KEY `IX_C1A01806` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users_Roles`
--

LOCK TABLES `Users_Roles` WRITE;
INSERT INTO `Users_Roles` VALUES (20116,20122,20156),(20116,20123,20120),(20116,20125,20156),(20116,20126,20156),(20116,20126,31301);
UNLOCK TABLES;

--
-- Table structure for table `Users_Teams`
--

CREATE TABLE `Users_Teams` (
  `companyId` bigint(20) NOT NULL,
  `teamId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`teamId`,`userId`),
  KEY `IX_799F8283` (`companyId`),
  KEY `IX_4D06AD51` (`teamId`),
  KEY `IX_A098EFBF` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Users_UserGroups`
--

CREATE TABLE `Users_UserGroups` (
  `companyId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`userGroupId`),
  KEY `IX_BB65040C` (`companyId`),
  KEY `IX_66FF2503` (`userGroupId`),
  KEY `IX_BE8102D6` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `VirtualHost`
--

CREATE TABLE `VirtualHost` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `virtualHostId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `layoutSetId` bigint(20) DEFAULT NULL,
  `hostname` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`virtualHostId`),
  UNIQUE KEY `IX_A083D394` (`companyId`,`layoutSetId`),
  UNIQUE KEY `IX_431A3960` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VirtualHost`
--

LOCK TABLES `VirtualHost` WRITE;
INSERT INTO `VirtualHost` VALUES (0,20119,20116,0,'localhost');
UNLOCK TABLES;

--
-- Table structure for table `WebDAVProps`
--

CREATE TABLE `WebDAVProps` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `webDavPropsId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `props` longtext,
  PRIMARY KEY (`webDavPropsId`),
  UNIQUE KEY `IX_97DFA146` (`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Website`
--

CREATE TABLE `Website` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `uuid_` varchar(75) DEFAULT NULL,
  `websiteId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `url` longtext,
  `typeId` bigint(20) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`websiteId`),
  KEY `IX_1AA07A6D` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_F75690BB` (`userId`),
  KEY `IX_712BCD35` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `WikiNode`
--

CREATE TABLE `WikiNode` (
  `uuid_` varchar(75) DEFAULT NULL,
  `nodeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `lastPostDate` datetime(6) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`nodeId`),
  UNIQUE KEY `IX_920CD8B1` (`groupId`,`name`),
  UNIQUE KEY `IX_7609B2AE` (`uuid_`,`groupId`),
  KEY `IX_B54332D6` (`companyId`,`status`),
  KEY `IX_23325358` (`groupId`,`status`),
  KEY `IX_E0E6D12C` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `WikiPage`
--

CREATE TABLE `WikiPage` (
  `uuid_` varchar(75) DEFAULT NULL,
  `pageId` bigint(20) NOT NULL,
  `resourcePrimKey` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `nodeId` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `minorEdit` tinyint(4) DEFAULT NULL,
  `content` longtext,
  `summary` longtext,
  `format` varchar(75) DEFAULT NULL,
  `head` tinyint(4) DEFAULT NULL,
  `parentTitle` varchar(255) DEFAULT NULL,
  `redirectTitle` varchar(255) DEFAULT NULL,
  `lastPublishDate` datetime(6) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`pageId`),
  UNIQUE KEY `IX_3D4AF476` (`nodeId`,`title`,`version`),
  UNIQUE KEY `IX_2CD67C81` (`resourcePrimKey`,`nodeId`,`version`),
  UNIQUE KEY `IX_899D3DFB` (`uuid_`,`groupId`),
  KEY `IX_A2001730` (`format`),
  KEY `IX_BA72B89A` (`groupId`,`nodeId`,`head`,`parentTitle`,`status`),
  KEY `IX_E0092FF0` (`groupId`,`nodeId`,`head`,`status`),
  KEY `IX_941E429C` (`groupId`,`nodeId`,`status`),
  KEY `IX_5FF21CE6` (`groupId`,`nodeId`,`title`,`head`),
  KEY `IX_CAA451D6` (`groupId`,`userId`,`nodeId`,`status`),
  KEY `IX_9F7655DA` (`nodeId`,`head`,`parentTitle`,`status`),
  KEY `IX_40F94F68` (`nodeId`,`head`,`redirectTitle`,`status`),
  KEY `IX_432F0AB0` (`nodeId`,`head`,`status`),
  KEY `IX_46EEF3C8` (`nodeId`,`parentTitle`),
  KEY `IX_1ECC7656` (`nodeId`,`redirectTitle`),
  KEY `IX_546F2D5C` (`nodeId`,`status`),
  KEY `IX_E745EA26` (`nodeId`,`title`,`head`),
  KEY `IX_BEA33AB8` (`nodeId`,`title`,`status`),
  KEY `IX_E1F55FB` (`resourcePrimKey`,`nodeId`,`head`),
  KEY `IX_94D1054D` (`resourcePrimKey`,`nodeId`,`status`),
  KEY `IX_1725355C` (`resourcePrimKey`,`status`),
  KEY `IX_FBBE7C96` (`userId`,`nodeId`,`status`),
  KEY `IX_5DC4BD39` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `WikiPageResource`
--

CREATE TABLE `WikiPageResource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `resourcePrimKey` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `nodeId` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resourcePrimKey`),
  UNIQUE KEY `IX_21277664` (`nodeId`,`title`),
  UNIQUE KEY `IX_F705C7A9` (`uuid_`,`groupId`),
  KEY `IX_13319367` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `WorkflowDefinitionLink`
--

CREATE TABLE `WorkflowDefinitionLink` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `workflowDefinitionLinkId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  `workflowDefinitionName` varchar(75) DEFAULT NULL,
  `workflowDefinitionVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`workflowDefinitionLinkId`),
  KEY `IX_A4DB1F0F` (`companyId`,`workflowDefinitionName`,`workflowDefinitionVersion`),
  KEY `IX_705B40EE` (`groupId`,`companyId`,`classNameId`,`classPK`,`typePK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `WorkflowInstanceLink`
--

CREATE TABLE `WorkflowInstanceLink` (
  `mvccVersion` bigint(20) NOT NULL DEFAULT '0',
  `workflowInstanceLinkId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifiedDate` datetime(6) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`workflowInstanceLinkId`),
  KEY `IX_415A7007` (`groupId`,`companyId`,`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
