DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GenerateAprioriRules`(IN minSupport DECIMAL(5,2), IN minConfidence DECIMAL(5,2))
BEGIN
DECLARE transactionCount INT;

-- Pre-processing table which needs to be cleared before every run
TRUNCATE TABLE tblTotalOrder;

-- STEP ONE: Consolidate all of the data into a single denormalized table for processing.
INSERT INTO tblTotalOrder
SELECT O.transactionID,O.orderID,O.userID,O.itemID,U.userID As U_UserID, U.userSex,
U.userAge, I.itemID AS I_itemID, I.itemName, I.deptID, D.deptID AS D_deptID, D.deptName  
FROM tblorders O
JOIN tbluser U
ON O.userID = U.userID
JOIN tblitems I
ON O.itemID = I.itemID
JOIN tbldepartment D
ON D.deptID = I.deptID
ORDER BY O.orderID;

-- STEP TWO: Get Distinct ItemList from all transactions.
-- SELECT * FROM tblItemList;
TRUNCATE TABLE tblItemList;
INSERT INTO tblItemList(ItemName)
SELECT DISTINCT ItemName FROM tbltotalorder
ORDER BY itemName;

-- STEP THREE: Consolidate the items in each order into one list seperated into CSV and store them in a Transactions Table for further processing
-- SELECT * FROM tblTransactions;
TRUNCATE TABLE tblTransactions;
INSERT INTO tblTransactions(OrderID,OrderItemList)
SELECT orderID, GROUP_CONCAT(DISTINCT itemname ORDER BY itemname) AS OrderItems FROM tbltotalorder
GROUP BY orderID
ORDER BY itemname;

-- Set MinSupport and Confidence
-- SELECT @minSupport:=0.05;
-- SELECT @confidence:=0.5;

-- STEP FOUR: Now that we have a table with transposed distinct orders we can calculate the total number of transactions.
-- SELECT COUNT(DISTINCT OrderID) FROM  tbltotalorder;
SET transactionCount = (SELECT COUNT(DISTINCT OrderID) FROM  tbltotalorder);

-- STEP FIVE: Calculate the support for single element item sets and store them in the Candidates List table. 
-- SELECT * FROM tblCandidates;
TRUNCATE TABLE tblCandidates;
INSERT INTO  tblCandidates(ItemName,ItemSupport,ItemLevel)
SELECT C.* FROM 
(SELECT itemName,COUNT(DISTINCT orderID) AS itemsupport, 1 AS ItemLevel FROM tbltotalorder
group by itemName) C
WHERE C.itemsupport/transactionCount >= minSupport; 


-- STEP SIX: Call Stored Procedure to get Level2 element candidates.
CALL storedemo.usp_getL2Candidates(minSupport, transactionCount, 1);

-- STEP SEVEN: Call Stored Procedure to get Level3 and above element candidates.
CALL storedemo.usp_getCandidates(minSupport, transactionCount, 2);

-- STEP EIGHT: After the getCandidates calls fill tblCandidates, select the unique rules. 
TRUNCATE TABLE tblFinalCandidates;
INSERT INTO tblFinalCandidates(ItemName,ItemSupport,ItemLevel)
SELECT DISTINCT ItemName,ItemSupport,ItemLevel from tblCandidates;

-- STEP 9: Insert distinct rules into tblCandRules for processing
TRUNCATE TABLE tblCandRules;
INSERT INTO tblCandRules(ItemName,ItemSupport,ItemLevel)
SELECT ItemName,ItemSupport,ItemLevel FROM (
SELECT   *,LENGTH(itemName) - LENGTH(REPLACE(itemName, ',', ''))+1 As NoElements from tblFinalCandidates) ABC
Where NoElements > 1;

-- STEP 10: Generate rules for all candidates
TRUNCATE TABLE tblRules;
CALL storedemo.usp_GenerateRules();

-- Final Rules table displayed to the user. 

TRUNCATE TABLE tblStrongRules;
INSERT INTO tblStrongRules(RuleXY,RuleX,RuleY,SupportXY,SupportX,Confidence)
SELECT A.RuleXY, A.RuleX, A.RuleY,B.ItemSupport AS SupportXY, C.ItemSupport AS SupportX,
CAST((B.ItemSupport/C.ItemSupport)*100 AS DECIMAL(5,2)) AS Confidence
FROM (SELECT DISTINCT RuleXY, RuleX,RuleY FROM tblRules) A
JOIN tblFinalCandidates B
ON A.RuleXY = B.ItemName
JOIN tblFinalCandidates C
ON A.RuleX = C.ItemName;


SELECT * FROM tblStrongRules
WHERE Confidence>= minConfidence;

 END$$
DELIMITER ;
