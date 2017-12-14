DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_splitItems`(IN ILevel INT)
BEGIN

DROP TABLE IF EXISTS tempSplitItems;	
CREATE TEMPORARY TABLE tempSplitItems (itemName CHAR(255));
SET @S3 = CONCAT("INSERT INTO tempSplitItems (itemName) VALUES ('",REPLACE((SELECT GROUP_CONCAT(itemName) as Data FROM tblCandidates WHERE ItemLevel = ILevel), ",", "'),('"),"');");
PREPARE stmt1 FROM @S3;
EXECUTE stmt1;

TRUNCATE TABLE tblSplitItems;
INSERT INTO tblSplitItems
SELECT DISTINCT(itemName) FROM tempSplitItems Order By itemName;

DROP TABLE tempSplitItems;

 END$$
DELIMITER ;
