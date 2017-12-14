<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT * FROM `tblitems`";
$queryRecords = mysqli_query($conn, $sql) or die("error to fetch employees data");

$sql = "SELECT * FROM `tbldepartment`";
$departments = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>

<table id="tblitems_grid" class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>Item ID</th>
         <th>Item Name</th>
         <th>Department</th>
         <th style="text-align: center;">Update/Delete</th>
      </tr>
   </thead>
   <tbody>
      <?php foreach($queryRecords as $res) :?>
      <tr item_id="<?php echo $res['itemID'];?>">
         <td class="editable-col" colname="itemID" contenteditable="true"><?php echo $res['itemID'];?></td>
         <td class="editable-col" colname="itemName" contenteditable="true"><?php echo $res['itemName'];?></td>
         <td class="editable-col" contenteditable="true" colname="deptID"><select class="form-control">
         	<?php foreach($departments as $dep) :?>
               <option <?php echo $dep['deptID'] == $res['deptID'] ? "selected" : "";?> value="<?php echo $dep['deptID'];?>"><?php echo $dep['deptName'];?></option>
            <?php endforeach;?>
         </select></td>
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" onclick="updateItem(<?php echo $res['itemID'];?>)"></i>&nbsp;<i class="fa fa-close fa-fw fa-2x" aria-hidden="true" onclick="removeItem(<?php echo $res['itemID'];?>)"></i></td>
      </tr>
    <?php endforeach;?>
   </tbody>
</table>