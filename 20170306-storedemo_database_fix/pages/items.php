<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT * FROM `tbldepartment`";
$departments = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>
<h3>Update Items</h3>
<hr>
<div id="notification"></div>
<h3>Add</h3>
<table class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>Item Name</th>
         <th>Department</th>
         <th style="text-align: center;">ADD</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td ><input class="form-control" id="itemName" type="text" value=""></td>
         <td ><select class="form-control" id="deptID">
         <?php foreach($departments as $dep) :?>
         	<option value="<?php echo $dep['deptID'];?>"><?php echo $dep['deptName'];?></option>
         <?php endforeach;?>
         </select></td>
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" id="add_item"></i></td>
      </tr>
   </tbody>
</table>
<hr>
<h3>Update</h3>
<table id="tblitems_sort" class="table table-condensed table-hover table-striped bootgrid-table tablesorter" cellspacing="0">
   <thead>
      <tr>
         <th>Item ID</th>
         <th>Item Name</th>
         <th>Department</th>
         <th style="text-align: center;">Update/Delete</th>
      </tr>
   </thead>
   <tbody>
      <?php include("tblitems.php");?>
   </tbody>
</table>

<script src="js/items.js"></script>