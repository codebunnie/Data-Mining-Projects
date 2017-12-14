CREATE TABLE `tblcandidates` (
  `CD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(60000) DEFAULT NULL,
  `ItemSupport` int(11) DEFAULT NULL,
  `ItemLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

CREATE TABLE `tblcandrules` (
  `CD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(60000) DEFAULT NULL,
  `ItemSupport` int(11) DEFAULT NULL,
  `ItemLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;


CREATE TABLE `tblelementset` (
  `E_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ElementSet` varchar(60000) DEFAULT NULL,
  PRIMARY KEY (`E_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

CREATE TABLE `tblfinalcandidates` (
  `CD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(60000) DEFAULT NULL,
  `ItemSupport` int(11) DEFAULT NULL,
  `ItemLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`CD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

CREATE TABLE `tblitemlist` (
  `IL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

CREATE TABLE `tblsplititems` (
  `itemName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbltemprules` (
  `RuleLevel` int(11) DEFAULT NULL,
  `RuleXY` varchar(20000) DEFAULT NULL,
  `RuleX` varchar(20000) DEFAULT NULL,
  `RuleY` varchar(20000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tblstrongrules` (
  `RuleId` int(11) NOT NULL AUTO_INCREMENT,
  `RuleXY` varchar(20000) DEFAULT NULL,
  `RuleX` varchar(20000) DEFAULT NULL,
  `RuleY` varchar(20000) DEFAULT NULL,
  `SupportXY` int(11) DEFAULT NULL,
  `SupportX` int(11) DEFAULT NULL,
  `Confidence` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`RuleId`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

CREATE TABLE `tblrules` (
  `RuleLevel` int(11) DEFAULT NULL,
  `RuleXY` varchar(20000) DEFAULT NULL,
  `RuleX` varchar(20000) DEFAULT NULL,
  `RuleY` varchar(20000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbltotalorder` (
  `transactionID` int(5) NOT NULL DEFAULT '0',
  `orderID` int(4) NOT NULL,
  `userID` int(4) NOT NULL,
  `itemID` int(2) NOT NULL,
  `U_UserID` int(4) NOT NULL DEFAULT '0',
  `userSex` varchar(1) NOT NULL,
  `userAge` int(2) NOT NULL,
  `I_itemID` int(2) NOT NULL DEFAULT '0',
  `itemName` varchar(50) NOT NULL,
  `deptID` int(2) NOT NULL,
  `D_deptID` int(2) NOT NULL,
  `deptName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbltransactions` (
  `OrderID` int(11) DEFAULT NULL,
  `OrderItemList` varchar(60000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;