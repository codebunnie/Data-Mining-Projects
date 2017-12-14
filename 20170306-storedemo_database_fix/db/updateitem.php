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

    if(isset($_POST['newid']) &&  !$error) {
      $newid = (int)$_POST['newid'];
      $error = false;
    } else {
      $error = true;
    }

    if(isset($_POST['itemname']) && !empty($_POST['itemname']) &&  !$error) {
      $itemname = $_POST['itemname'];
      $error = false;
    } else {
      $error = true;
    }

    if(isset($_POST['deptid']) && !empty($_POST['deptid']) &&  !$error) {
      $deptid = $_POST['deptid'];
      $error = false;
    } else {
      $error = true;
    }
      
    if(!$error) {
        $sql = "UPDATE tblitems SET itemID='".$newid."', itemName='".$itemname."', deptID='".$deptid."' WHERE itemID=".$itemid;
        $status = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
        $msg = array('status' => !$error, 'msg' => 'Success! item updated.');
    }
  }

  // send data as json format
  echo json_encode($msg);
  
?>