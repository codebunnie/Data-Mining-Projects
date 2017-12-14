<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['deptid'])) {
      $deptid = (int)$_POST['deptid'];
      $error = false;      
    } else {
      $error = true;
    }

    if(!$error) {
        $sql = "DELETE FROM tbldepartment WHERE deptID = '". $deptid . "'";
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! department deleted.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>