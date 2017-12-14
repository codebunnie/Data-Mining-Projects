$(document).ready(function(){

  $('#tblorders_sort').tablesorter( {headers:{4:{sorter:false},2:{sorter:'select'},3:{sorter:'select'}}});

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
            	
              $('#tblorders_sort').trigger("update");
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
            	
              $.get("pages/tblorders.php", function(html) { 
                   // append the "ajax'd" data to the table body 
                   $('#tblorders_sort tbody').html(html); 
                  // let the plugin know that we made a update 
                  $('#tblorders_sort').trigger("update");                  
              });
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
            	
              $.get("pages/tblorders.php", function(html) { 
                   // append the "ajax'd" data to the table body 
                   $('#tblorders_sort tbody').html(html); 
                  // let the plugin know that we made a update 
                  $('#tblorders_sort').trigger("update");                  
              });
            } else {
              $('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}