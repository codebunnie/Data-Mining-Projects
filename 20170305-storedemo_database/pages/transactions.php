<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT * FROM `tblorders`";
$queryRecords = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>
<h3>Transactions Report</h3>
<hr>
<table id="tblorders_grid" class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>Transaction ID</th>
         <th>Order ID</th>
         <th>User ID</th>
         <th>Item ID</th>
      </tr>
   </thead>
   <tbody>
      <?php foreach($queryRecords as $res) :?>
      <tr>
         <td ><?php echo $res['transactionID'];?></td>
         <td ><?php echo $res['orderID'];?></td>
         <td ><?php echo $res['userID'];?></td>
         <td ><?php echo $res['itemID'];?></td>
      </tr>
    <?php endforeach;?>
   </tbody>
</table>