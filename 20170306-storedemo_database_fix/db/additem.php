<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['itemName'])) {
      $itemName = $_POST['itemName'];
      $error = false;      
    } else {
      $error = true;
    }

    if(isset($_POST['deptID']) &&  !$error) {
      $deptID = (int)$_POST['deptID'];
      $error = false;
    } else {
      $error = true;
    }
      
    if(!$error) {
        $sql = "INSERT INTO tblitems (itemName, deptID) VALUES ('".$itemName."','".$deptID."')";
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! item added.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>