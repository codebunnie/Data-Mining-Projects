DELIMITER $$
-- CALL usp_getL2Candidates(.05, 30, 1);
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getL2Candidates`(IN minSupport DECIMAL(5,2), IN transactionCount INT, IN CLevel INT)
BEGIN
 DECLARE x INT;
 
declare elementCount INT;
declare candCheckCtr INT;
SET x = 1;
set elementCount =0;
set candCheckCtr =1;
-- SELECT @candCheckCtr;
-- SELECT @elementCount;

TRUNCATE TABLE tblElementSet;
-- SELECT * FROM tblElementSet;
-- STEP 7: Get the cartesian product sets of the elements stored in the Candidates table. CLevel is passed to indicate what level of candidate is being processed.
INSERT INTO tblElementSet(ElementSet)
SELECT 
    CONCAT(B.ItemName, ' , ', A.ItemName) AS ItemName
FROM
    (SELECT 
        *
    FROM
        tblCandidates
    WHERE
        ItemLevel = CLevel) A
        CROSS JOIN
    (SELECT 
        *
    FROM
        tblCandidates
    WHERE
        ItemLevel = CLevel) B ON A.CD_ID > B.CD_ID;
        
        
-- Keep track of the total items in the element set for confidence calculations
SET elementCount = (SELECT COUNT(*) FROM tblElementSet);

WHILE(candCheckCtr <= elementCount)
DO
-- Check the candidates by passing in the level of the candidate and increment the counter for future calls.
CALL storedemo.usp_CheckCandidate(CLevel,candCheckCtr,minSupport,transactionCount);
set candCheckCtr = candCheckCtr + 1;
END WHILE;

 END$$
DELIMITER ;
