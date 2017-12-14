<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['oldid'])) {
      $oldid = (int)$_POST['oldid'];
      $error = false;      
    } else {
      $error = true;
    }

    if(isset($_POST['newid']) &&  !$error) {
      $newid = (int)$_POST['newid'];
      $error = false;
    } else {
      $error = true;
    }

    if(isset($_POST['orderid']) &&  !$error) {
      $orderid = (int)$_POST['orderid'];
      $error = false;
    } else {
      $error = true;
    }

    if(isset($_POST['userid']) &&  !$error) {
      $userid = (int)$_POST['userid'];
      $error = false;
    } else {
      $error = true;
    }

    if(isset($_POST['itemid']) &&  !$error) {
      $itemid = (int)$_POST['itemid'];
      $error = false;
    } else {
      $error = true;
    }
      
    if(!$error) {
        $sql = "UPDATE tblorders SET transactionID='".$newid."', orderID='".$orderid."', userID='".$userid."', itemID='".$itemid."' WHERE transactionID=".$oldid;
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! order updated.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>