DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_CheckCandidate`(IN citlevel INT,IN EID INT,IN minSupport DECIMAL(5,2), IN transactionCount INT)
BEGIN

DECLARE itemSum INT;
DECLARE elementString VARCHAR(60000);
SET itemSum = 0;

SET elementString = (SELECT GROUP_CONCAT(ElementSet) as Data FROM tblelementset
WHERE E_ID = EID);

-- SELECT * FROM tblElementSet;
--  Currently the items in the Element Set table are concatenated. Split the elements to compare thier values against the transactions table
DROP TABLE IF EXISTS tempSplitElements;	
CREATE TEMPORARY TABLE tempSplitElements (itemName CHAR(255));
SET @S2 = CONCAT("INSERT INTO tempSplitElements (itemName) VALUES ('",REPLACE((SELECT GROUP_CONCAT(ElementSet) as Data FROM tblelementset
WHERE E_ID = EID), ",", "'),('"),"');");

PREPARE stmt1 FROM @S2;
EXECUTE stmt1;
-- SELECT * FROM tempSplitElements;

SET itemSum = (SELECT COUNT(*) FROM tempSplitElements);

-- Check to see if the candidates are a subset of eachother and calculate the support for each of them
INSERT INTO tblCandidates(ItemName,ItemSupport,ItemLevel)
SELECT ABCDE.* FROM 
(SELECT  elementString AS itemName,
    COUNT(ABCD.orderID) AS itemSupport,
    citlevel  + 1 AS ItemLevel FROM 
(SELECT OrderID,OrderItemList,SUM(ItemExists) AS SumItems FROM
(SELECT DISTINCT itemName,OrderID,OrderItemList,ItemExists FROM
(SELECT *, CASE WHEN find_in_set(A.itemName,B.OrderItemList) = 0 THEN 0 ELSE 1 END AS ItemExists FROM tempSplitElements A
 CROSS JOIN tbltransactions B) AB) ABC
 GROUP BY OrderID,OrderItemList
HAVING SumItems = itemSum) ABCD
GROUP BY ABCD.OrderItemList
ORDER BY ABCD.OrderItemList) ABCDE
WHERE ABCDE.itemsupport/transactionCount >= minSupport;

 END$$
DELIMITER ;
