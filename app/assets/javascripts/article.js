$(document).on('turbolinks:load', function(){
  $(".delete").on('click', function(){
  	console.log("get in here");
  	if (confirm("Are you sure you want to delete article: ID " + this.parentElement.id)) {
  	  $.ajax({
  		  url: '/articles/' + this.parentElement.id,
  		  method: 'DELETE',
        dataType: 'json',
  		  success: function(data){
  		    alert(data.status); 		  
  		  }
  	  });		
  	}  	
  });

  $(".update").on('click', function(){
  	console.log("get in update status here");
  	if (confirm("Are you sure you want to update article: ID " + this.parentElement.id)) {
  	  $.ajax({
    		url: '/articles/' + this.parentElement.id + '/update_status',
    		method: 'GET',
        dataType: 'json',
    		success: function(data){
          if (data.status == 'fail') {            
            alert("update " + data.status);
          } else {                
            alert("update " + data.status);
          }    		  
    		}
  	  });		
  	}  	
  });

});
