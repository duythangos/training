$(document).on('turbolinks:load', function(){
  $(".delete").on('click', function(){
  	console.log("get in here");
  	if (confirm("Are you sure you want to delete article: ID " + this.parentElement.id)) {
  	  $.ajax({
  		url: '/articles/' + this.parentElement.id,
  		method: 'DELETE',
  		success: function(r){
  		  alert("Article was delete successfully"); 		  
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
  		success: function(r){
  		  alert("Article was updated successfully"); 		  
  		}
  	  });		
  	}  	
  });

});
