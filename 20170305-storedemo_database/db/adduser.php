<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['userSex'])) {
      $userSex = $_POST['userSex'];
      $error = false;      
    } else {
      $error = true;
    }

    if(isset($_POST['userAge']) && !empty($_POST['userAge']) &&  !$error) {
      $userAge = (int)$_POST['userAge'];
      $error = false;
    } else {
      $error = true;
    }
      
    if(!$error) {
        $sql = "INSERT INTO tbluser (userSex, userAge) VALUES ('".$userSex."','".$userAge."')";
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! user added.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>