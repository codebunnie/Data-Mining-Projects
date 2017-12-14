<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['itemid'])) {
      $itemid = (int)$_POST['itemid'];
      $error = false;      
    } else {
      $error = true;
    }

    if(!$error) {
        $sql = "DELETE FROM tblitems WHERE itemID = '". $itemid . "'";
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! item deleted.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>