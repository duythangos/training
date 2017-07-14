$(document).on('turbolinks:load', function(){
  $(".delete").on('click', function(){
  	console.log("get in here");
  	if (confirm("Are you sure you want to delete article: ID " + this.parentElement.id)) {
  	  $.ajax({
  		url: '/articles/' + this.parentElement.id,
  		method: 'DELETE',
  		success: function(r){
  		  alert("Delete successfully"); 		  
  		}
  	  });		
  	}  	
  });
});
