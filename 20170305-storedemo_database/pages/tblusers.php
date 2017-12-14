<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT * FROM `tbluser`";
$queryRecords = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>

<table class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>USERID</th>
         <th>USERSEX</th>
         <th>USERAGE</th>
         <th style="text-align: center;">Update/Delete</th>
      </tr>
   </thead>
   <tbody>
      <?php foreach($queryRecords as $res) :?>
      <tr user_id="<?php echo $res['userID'];?>">
         <td class="editable-col" colname="userID" contenteditable="true"><?php echo $res['userID'];?></td>
         <td contenteditable="true" colname="userSex"><select class="form-control">
         	<option <?php echo $res['userSex'] == "F" ? "selected" : "";?> value="F">F</option>
         	<option <?php echo $res['userSex'] == "M" ? "selected" : "";?> value="M">M</option>
         </select></td>
         <td class="editable-col" colname="userAge" contenteditable="true"><?php echo $res['userAge'];?></td>         
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" onclick="updateUser(<?php echo $res['userID'];?>)"></i>&nbsp;<i class="fa fa-close fa-fw fa-2x" aria-hidden="true" onclick="removeUser(<?php echo $res['userID'];?>)"></i></td>
      </tr>
    <?php endforeach;?>
   </tbody>
</table>