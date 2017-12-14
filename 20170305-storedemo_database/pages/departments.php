<h3>Update Departments</h3>
<hr>
<div id="notification"></div>
<h3>Add</h3>
<table class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>Department Id</th>
         <th>Department Name</th>
         <th style="text-align: center;">ADD</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td ><input class="form-control" id="deptID" type="text" value=""></td>
         <td ><input class="form-control" id="deptName" type="text" value=""></td>        
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" id="add_dept"></i></td>
      </tr>
   </tbody>
</table>
<hr>
<h3>Update</h3>
<div id="tbldepts">
   <?php include("tbldepartments.php");?>
</div>

<script src="js/departments.js"></script>
