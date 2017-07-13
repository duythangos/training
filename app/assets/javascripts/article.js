$(document).ready(function(){
  $("button").unbind('click').click(function(){
    $("p").toggle(1000);
    console.log("after this");
  });

  $('new-article-form').html("<%= j (render 'form') %>");
  $('new-article-form').slideDown(1000);

});
