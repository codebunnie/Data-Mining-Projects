$(document).ready(function(){

  $('#tblusers_sort').tablesorter( {headers:{3:{sorter:false},1:{sorter:'select'}}});

  $('#add_user').on('click', function() {
  	var userSex = $('#add_userSex').val();
  	var userAge = $('#add_userAge').val();

    if(userSex == "" || userAge == ""){
    	return false;
    } else {    	
    	addUser(userSex, userAge);
    }   

  });

});

function updateUser(userid){
	var newid = $('tr[user_id="'+userid+'"] > td[colname="userID"]').text();
	var usersex = $('tr[user_id="'+userid+'"] > td[colname="userSex"] > select').val();
	var userage = $('tr[user_id="'+userid+'"] > td[colname="userAge"]').text();
	//console.log('id: '+ userid + ' newid: '+newid + ' usersex: ' + usersex + ' userage: ' + userage); return false;

	$.ajax({
    	url: 'db/updateuser.php',
    	type: 'post',
    	cache: false,
    	data: 'userid=' + userid + '&newid=' + newid + '&usersex=' + usersex + '&userage=' + userage,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');

              $('#tblusers_sort').trigger("update");
            	//$('#tblusers').load('pages/tblusers.php');
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}

function removeUser(userid){
	$.ajax({
    	url: 'db/removeuser.php',
    	type: 'post',
    	cache: false,
    	data: 'userid=' + userid,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            	
              $.get("pages/tblusers.php", function(html) { 
                   // append the "ajax'd" data to the table body 
                   $('#tblusers_sort tbody').html(html); 
                  // let the plugin know that we made a update 
                  $('#tblusers_sort').trigger("update");                  
              });

              //$('#tblusers_sort tbody').load('pages/tblusers.php',$('#tblusers_sort').trigger('update'));
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}

function addUser(userSex, userAge){
	$.ajax({
    	url: 'db/adduser.php',
    	type: 'post',
    	cache: false,
    	data: 'userSex=' + userSex + '&userAge=' + userAge,
    	dataType: 'json',
          success: function(response)  
          {   
            $('.alert-success, .alert-warning').remove();


            if(response.status) {
            	$('#notification').html('<div class="alert alert-success" style="display: none;">' + response.msg + '</div>');
            	$('.alert-success').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');

              $.get("pages/tblusers.php", function(html) { 
                   // append the "ajax'd" data to the table body 
                   $('#tblusers_sort tbody').html(html); 
                  // let the plugin know that we made a update 
                  $('#tblusers_sort').trigger("update");                  
              }); 

            	//$('#tblusers_sort tbody').load('pages/tblusers.php',$('#tblusers_sort').trigger('update'));
            } else {
              	$('#notification').html('<div class="alert alert-warning" style="display: none;">' + response.msg + '</div>');
            	$('.alert-warning').fadeIn('slow');
            	$('html, body').animate({ scrollTop: 0 }, 'slow');
            }
          }   
        });
}