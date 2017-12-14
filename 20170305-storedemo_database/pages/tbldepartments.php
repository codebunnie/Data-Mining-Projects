<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT * FROM `tbldepartment`";
$queryRecords = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>

<table id="tbldepartment_grid" class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>Department ID</th>
         <th>Department Name</th>
         <th style="text-align: center;">Update/Delete</th>
      </tr>
   </thead>
   <tbody>
      <?php foreach($queryRecords as $res) :?>
      <tr dept_id="<?php echo $res['deptID'];?>">
         <td class="editable-col" contenteditable="true" colname="deptID"><?php echo $res['deptID'];?></td>
         <td class="editable-col" contenteditable="true" colname="deptName"><?php echo $res['deptName'];?></td>
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" onclick="updateDept(<?php echo $res['deptID'];?>)"></i>&nbsp;<i class="fa fa-close fa-fw fa-2x" aria-hidden="true" onclick="removeDept(<?php echo $res['deptID'];?>)"></i></td>
      </tr>
    <?php endforeach;?>
   </tbody>
</table>