<?php
//include connection file 
include_once("../db/connection.php");
$sql = "SELECT * FROM `tbluser`";
$users = mysqli_query($conn, $sql) or die("error to fetch employees data");

$sql = "SELECT * FROM `tblorders`";
$queryRecords = mysqli_query($conn, $sql) or die("error to fetch employees data");

$sql = "SELECT * FROM `tblitems`";
$items = mysqli_query($conn, $sql) or die("error to fetch employees data");
?>

      <?php foreach($queryRecords as $res) :?>
      <tr order_id="<?php echo $res['transactionID'];?>">
         <td contenteditable="true" colname="transactionID"><?php echo $res['transactionID'];?></td>
         <td contenteditable="true" colname="orderID"><?php echo $res['orderID'];?></td>
         <td colname="userID"><select class="form-control">
         	<?php foreach($users as $user) :?>
               <option <?php echo $user['userID'] == $res['userID'] ? "selected" : "";?> value="<?php echo $user['userID'];?>"><?php echo $user['userID'];?></option>
            <?php endforeach;?>
         </select></td>
         <td colname="itemID"><select class="form-control">
               <?php foreach($items as $item) :?>
                  <option <?php echo $item['itemID'] == $res['itemID'] ? "selected" : "";?> value="<?php echo $item['itemID'];?>"><?php echo $item['itemName'];?></option>
               <?php endforeach;?>
         </select></td>
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" onclick="updateOrder(<?php echo $res['transactionID'];?>)"></i>&nbsp;<i class="fa fa-close fa-fw fa-2x" aria-hidden="true" onclick="removeOrder(<?php echo $res['transactionID'];?>)"></i></td>
      </tr>
    <?php endforeach;?>