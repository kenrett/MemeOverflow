$(document).ready(function() {
  if ($("div.present-meme-box.pagination-centered").length > 0 ){
   setInterval(function(){
    $.get("/present_memes/next",$("form").serialize()).done(function(data){
      console.log(data);
      $("div.present-meme-box").children().attr("src",data.url)
      $("form input#id").val(data.id)
    });
  },5000);
 }
});
