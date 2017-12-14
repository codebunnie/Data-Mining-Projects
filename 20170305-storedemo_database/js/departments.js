$(document).ready(function(){

  $('#add_dept').on('click', function() {
    var deptID = $('#deptID').val();
  	var deptName = $('#deptName').val();    

    if(deptName == "" || deptID == ""){
    	return false;
    } else {    	
    	addDept(deptID, deptName);
    }   

  });

});

function updateDept(deptid){
	var newid = $('tr[dept_id="'+deptid+'"] > td[colname="deptID"]').text();
	var deptname = $('tr[dept_id="'+deptid+'"] > td[colname="deptName"]').text();
	

	$.ajax({
    	url: 'db/updatedept.php',
    	type: 'post',
    	cache: false,
    	data: 'deptid=' + deptid + '&newid=' + newid + '&deptname=' + deptname,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}

function removeDept(deptid){
	$.ajax({
    	url: 'db/removedept.php',
    	type: 'post',
    	cache: false,
    	data: 'deptid=' + deptid,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	$('#tbldepts').load('pages/tbldepartments.php');
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}

function addDept(deptID, deptName){
	$.ajax({
    	url: 'db/adddept.php',
    	type: 'post',
    	cache: false,
    	data: 'deptName=' + deptName + '&deptID=' + deptID,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	$('#tbldepts').load('pages/tbldepartments.php');
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}