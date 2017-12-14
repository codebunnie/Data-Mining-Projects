DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getCandidates`(IN minSupport DECIMAL(5,2), IN transactionCount INT, IN CLevel INT)
BEGIN

DECLARE ctr INT;
declare cnt int;
declare itlevel  INT;
declare elementCount INT;
declare candCheckCtr INT;
SET ctr=1;
set cnt=0;
set elementCount =0;
set candCheckCtr =1;
set itlevel = CLevel;


myloop: WHILE (ctr < 100)
DO 
 
 CALL storedemo.usp_splitItems(itlevel);

TRUNCATE TABLE tblElementSet;
INSERT INTO tblElementSet(ElementSet)
SELECT DISTINCT case when strcmp(TC.itemName,TS.itemName) = 1 then concat(TS.itemName,',',TC.itemName) 
ELSE concat(TC.itemName,',',TS.itemName) END AS itemName FROM tblCandidates TC 
CROSS JOIN tblSplitItems TS
ON TC.ItemLevel = itlevel 
AND find_in_set(TS.itemName,TC.itemName) = 0; 

 
SET elementCount = (SELECT COUNT(*) FROM tblElementSet);

WHILE(candCheckCtr <= elementCount)
DO
CALL storedemo.usp_CheckCandidate(itlevel,candCheckCtr,minSupport,transactionCount);
set candCheckCtr = candCheckCtr + 1;
END WHILE;

set itlevel  = itlevel  + 1;
set ctr = ctr+1;
 
   SET cnt = (SELECT COUNT(*) FROM tblCandidates WHERE ItemLevel = itlevel);
   IF cnt = 0 THEN
      -- SELECT cnt;
      LEAVE myloop;
   END IF;
END WHILE;

 END$$
DELIMITER ;
