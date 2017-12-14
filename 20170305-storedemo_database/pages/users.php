<h3>Update Users</h3>
<hr>
<div id="notification"></div>
<h3>Add</h3>
<table class="table table-condensed table-hover table-striped bootgrid-table" cellspacing="0">
   <thead>
      <tr>
         <th>USERSEX</th>
         <th>USERAGE</th>
         <th style="text-align: center;">ADD</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td ><select id="add_userSex" class="form-control">
         	<option value="F">F</option>
         	<option value="M">M</option>
         </select></td>
         <td ><input class="form-control" id="add_userAge" type="text" value=""></td>
         <td style="text-align: center;"><i class="fa fa-check-square fa-fw fa-2x" aria-hidden="true" id="add_user"></i></td>
      </tr>
   </tbody>
</table>
<hr>
<h3>Update</h3>
<div id="tblusers">
   <?php include("tblusers.php");?>
</div>

<script src="js/users.js"></script>
