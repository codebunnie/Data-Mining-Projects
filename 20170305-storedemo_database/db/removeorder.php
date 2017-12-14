<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['orderid'])) {
      $orderid = (int)$_POST['orderid'];
      $error = false;      
    } else {
      $error = true;
    }

    if(!$error) {
        $sql = "DELETE FROM tblorders WHERE transactionID = '". $orderid . "'";
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! order deleted.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>