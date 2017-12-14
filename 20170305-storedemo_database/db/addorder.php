<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['orderID'])) {
      $orderID = (int)$_POST['orderID'];
      $error = false;      
    } else {
      $error = true;
    }

    if(isset($_POST['userID']) &&  !$error) {
      $userID = (int)$_POST['userID'];
      $error = false;
    } else {
      $error = true;
    }

    if(isset($_POST['itemID']) &&  !$error) {
      $itemID = (int)$_POST['itemID'];
      $error = false;
    } else {
      $error = true;
    }
      
    if(!$error) {
        $sql = "INSERT INTO tblorders (orderID, userID, itemID) VALUES ('".$orderID."','".$userID."','".$itemID."')";
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! order added.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>