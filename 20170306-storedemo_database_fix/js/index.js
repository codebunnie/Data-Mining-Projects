$(document).ready(function() {

	$('div.data-view').load('pages/rules.php');

	/* Ajax Rules */
	$(document).on("click", "#rules_id", function(){ 
		$('div.data-view').load('pages/rules.php');
		return true;
 	});

 	/* Ajax Users */
	$(document).on("click", "#users_id", function(){ 
		$('div.data-view').load('pages/users.php');
		return true;
 	});

 	/* Ajax Items */
	$(document).on("click", "#items_id", function(){ 
		$('div.data-view').load('pages/items.php');		
		return true;
 	}); 

 	/* Ajax Departments */
	$(document).on("click", "#deps_id", function(){ 
		$('div.data-view').load('pages/departments.php');
		return true;
 	});

 	/* Ajax Orders */
	$(document).on("click", "#orders_id", function(){ 
		$('div.data-view').load('pages/orders.php');
		return true;
 	});

	/* Ajax Order Report */
	$(document).on("click", "#orders_rep_id", function(){ 
		$('div.data-view').load('pages/orders_rep.php');
		return true;
 	}); 

	/* Ajax Transactions */
	$(document).on("click", "#trans_id", function(){ 
		$('div.data-view').load('pages/transactions.php');
		return true;
 	});
});