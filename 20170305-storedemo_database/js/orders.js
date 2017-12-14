$(document).ready(function(){

  $('#add_order').on('click', function() {
  	var orderID = $('#orderID').val();
  	var userID = $('#userID').val();
    var itemID = $('#itemID').val();

    if(orderID == "" || userID == "" || itemID == ""){
    	return false;
    } else {    	
    	addOrder(orderID, userID, itemID);
    }   

  });

});

function updateOrder(oldid){
	var newid = $('tr[order_id="'+oldid+'"] > td[colname="transactionID"]').text();
	var orderid = $('tr[order_id="'+oldid+'"] > td[colname="orderID"]').text();
  var userid = $('tr[order_id="'+oldid+'"] > td[colname="userID"] > select').val();
  var itemid = $('tr[order_id="'+oldid+'"] > td[colname="itemID"] > select').val();	

	$.ajax({
    	url: 'db/updateorder.php',
    	type: 'post',
    	cache: false,
    	data: 'oldid=' + oldid + '&newid=' + newid + '&orderid=' + orderid + '&userid=' + userid + '&itemid=' + itemid,
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

function removeOrder(orderid){
	$.ajax({
    	url: 'db/removeorder.php',
    	type: 'post',
    	cache: false,
    	data: 'orderid=' + orderid,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	$('#tblorders').load('pages/tblorders.php');
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}

function addOrder(orderID, userID, itemID){
	$.ajax({
    	url: 'db/addorder.php',
    	type: 'post',
    	cache: false,
    	data: 'orderID=' + orderID + '&userID=' + userID + '&itemID=' + itemID,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	$('#tblorders').load('pages/tblorders.php');
            } else {
              $('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}