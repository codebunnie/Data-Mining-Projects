$(document).ready(function(){

  $('#add_item').on('click', function() {
  	var itemName = $('#itemName').val();
  	var deptID = $('#deptID').val();

    if(itemName == "" || deptID == ""){
    	return false;
    } else {    	
    	addItem(itemName, deptID);
    }   

  });

});

function updateItem(itemid){
	var newid = $('tr[item_id="'+itemid+'"] > td[colname="itemID"]').text();
	var deptid = $('tr[item_id="'+itemid+'"] > td[colname="deptID"] > select').val();
	var itemname = $('tr[item_id="'+itemid+'"] > td[colname="itemName"]').text();
	

	$.ajax({
    	url: 'db/updateitem.php',
    	type: 'post',
    	cache: false,
    	data: 'itemid=' + itemid + '&newid=' + newid + '&deptid=' + deptid + '&itemname=' + itemname,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	//$('#tblusers').load('pages/tblusers.php');
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}

function removeItem(itemid){
	$.ajax({
    	url: 'db/removeitem.php',
    	type: 'post',
    	cache: false,
    	data: 'itemid=' + itemid,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	$('#tblitems').load('pages/tblitems.php');
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}

function addItem(itemName, deptID){
	$.ajax({
    	url: 'db/additem.php',
    	type: 'post',
    	cache: false,
    	data: 'itemName=' + itemName + '&deptID=' + deptID,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	$('#tblitems').load('pages/tblitems.php');
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}