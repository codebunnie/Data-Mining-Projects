<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT * FROM `tbluser`";
$users = mysqli_query($conn, $sql) or die("error to fetch employees data");

$sql = "SELECT * FROM `tblitems`";
$items = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>

<h3>Update Orders</h3>
<hr>
<div id="notification"></div>
<h3>Add</h3>
<table class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>Order ID</th>
         <th>User ID</th>
         <th>Item Name</th>
         <th style="text-align: center;">ADD</th>
      </tr>
   </thead>
   <tbody>
      <tr>
   		<td ><input class="form-control" id="orderID" type="text" value=""></td>
         <td ><select class="form-control" id="userID">
            	<?php foreach($users as $user) :?>
                  <option value="<?php echo $user['userID'];?>"><?php echo $user['userID'];?></option>
               <?php endforeach;?>
         </select></td>
         <td ><select class="form-control" id="itemID">
               <?php foreach($items as $item) :?>
                  <option value="<?php echo $item['itemID'];?>"><?php echo $item['itemName'];?></option>
               <?php endforeach;?>
         </select></td>
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" id="add_order"></i></td>
      </tr>
   </tbody>
</table>
<hr>
<h3>Update</h3>

<table id="tblorders_sort" class="table table-condensed table-hover table-striped bootgrid-table tablesorter" cellspacing="0">
   <thead>
      <tr>
         <th>Transaction ID</th>
         <th>Order ID</th>
         <th>User ID</th>
         <th>Item ID</th>
         <th style="text-align: center;">Update/Delete</th>
      </tr>
   </thead>
   <tbody>
      <?php include("tblorders.php");?>
   </tbody>
</table>
<script src="js/orders.js"></script>