<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT o.*, u.userAge, i.itemName FROM `tblorders` o LEFT JOIN `tbluser` u ON (o.userID = u.userID) LEFT JOIN `tblitems` i ON (o.itemID = i.itemID) ORDER BY o.`orderID`";
$queryRecords = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>
<h3>Order Report</h3>
<hr>
<table id="tblorders_grid" class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>Transaction ID</th>
         <th>Order ID</th>
         <th>User ID</th>
         <th>User Age</th>
         <th>Item Name</th>
      </tr>
   </thead>
   <tbody>
      <?php $orderId = "first";
      foreach($queryRecords as $res) {
         if(($orderId != "first") && ($orderId != $res['orderID'])){
   print("<thead>
      <tr>
         <th>Transaction ID</th>
         <th>Order ID</th>
         <th>User ID</th>
         <th>User Age</th>
         <th>Item Name</th>
      </tr>
   </thead>
   <tbody>");
         }
         print("<tr><td >".$res['transactionID']. "</td>");
         print("<td >".$res['orderID']. "</td>");
         print("<td >".$res['userID']. "</td>");
         print("<td >".$res['userAge']. "</td>");
         print("<td >".$res['itemName']. "</td></tr>");

      if(($orderId != "first") && ($orderId != $res['orderID'])){
   print("</tbody>");
         }
    $orderId = $res['orderID'];

    }?>

</table>