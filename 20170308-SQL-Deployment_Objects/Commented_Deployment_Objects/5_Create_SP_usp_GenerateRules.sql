DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GenerateRules`()
BEGIN

DECLARE CRCount INT;
DECLARE RCtr INT;
DECLARE LCtr INT;
DECLARE LCount INT;
DECLARE CRItemName VARCHAR(60000);

SET CRCount = (SELECT COUNT(1) FROM tblCandRules);
SET RCtr = 1;
SET LCtr = 1;

WHILE (RCtr <=CRCount)
DO

-- Get Candidate to Split
SET CRItemName = (SELECT itemName as iData FROM tblCandRules WHERE CD_ID = RCtr);

DROP TABLE IF EXISTS tempSplitCands;	
CREATE TABLE tempSplitCands (itemName VARCHAR(255));
SET @S1 = CONCAT("INSERT INTO tempSplitCands (itemName) VALUES ('",REPLACE((SELECT GROUP_CONCAT(CRItemName)), ",", "'),('"),"');");

PREPARE stmt1 FROM @s1;
EXECUTE stmt1;

-- Generate the the rules associated which each level
TRUNCATE TABLE tbltempRules;
INSERT INTO tbltempRules
select 1,case when strcmp(a.itemName,b.itemName) = 1 then concat(b.itemName,',',a.itemName) 
ELSE concat(a.itemName,',',b.itemName) END AS RuleXY, a.itemname AS RuleX,b.itemname AS RuleY from tempSplitCands a 
cross join tempSplitCands b
on a.itemname <>b.itemname;

SET LCount = (SELECT COUNT(*) FROM tempSplitCands);

WHILE (LCtr < LCount-1)
DO
INSERT INTO tbltempRules
SELECT DISTINCT ABC.RuleLevel, ABC.RuleXY, ABC.RuleX, ABC.RuleY 
FROM
(SELECT 2 AS RuleLevel, case when strcmp(A.itemName,B.RuleXY) = 1 then concat(B.RuleXY,',',A.itemName) 
ELSE concat(A.itemName,',',B.RuleXY) END AS RuleXY, a.itemname AS RuleX,b.B.RuleXY AS RuleY
FROM tempSplitCands A
CROSS JOIN (SELECT * FROM tbltempRules 
WHERE RuleLevel = LCtr) B 
ON find_in_set(A.itemname,B.RuleXY) = 0) ABC;

SET LCtr = LCtr+1;
END WHILE;

INSERT INTO tbltempRules(RuleLevel,RuleXY,RuleX,RuleY)
SELECT RuleLevel,RuleXY,RuleY,RuleX
FROM tbltempRules
WHERE RuleLevel >1;

-- Generate the rules table 
INSERT INTO tblRules
SELECT DISTINCT RuleLevel,RuleXY,RuleX,RuleY
FROM tbltempRules;

SET LCtr = 1;
SET RCtr = RCtr +1;
END WHILE;

END$$
DELIMITER ;
