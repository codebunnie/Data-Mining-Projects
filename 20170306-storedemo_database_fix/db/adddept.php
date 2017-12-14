<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['deptName'])) {
      $deptName = $_POST['deptName'];
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
        $sql = "INSERT INTO tbldepartment (deptID, deptName) VALUES ('".$deptID."','".$deptName."')";
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! department added.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>