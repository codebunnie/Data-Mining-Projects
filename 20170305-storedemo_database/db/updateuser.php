<?php
  //include connection file 
  include_once("connection.php");
  
  $error = true;
  
  $msg = array('status' => !$error, 'msg' => 'Failed! mysql database error.');

  if(isset($_POST)){
    if(isset($_POST['userid'])) {
      $userid = (int)$_POST['userid'];
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

    if(isset($_POST['usersex']) && !empty($_POST['usersex']) &&  !$error) {
      $usersex = $_POST['usersex'];
      $error = false;
    } else {
      $error = true;
    }

    if(isset($_POST['userage']) && !empty($_POST['userage']) &&  !$error) {
      $userage = $_POST['userage'];
      $error = false;
    } else {
      $error = true;
    }
      
    if(!$error) {
        $sql = "UPDATE tbluser SET userID='".$newid."', userSex='".$usersex."', userAge='".$userage."' WHERE userID=".$userid;
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! user updated.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>