$(document).ready(function() {
  
  // $("form").on("submit",function(e){
  //   e.preventDefault();
 setInterval(function(){
  $.get("/present_memes/next",$("form").serialize()).done(function(data){
      console.log(data);
      $("div.container .meme-box.span4 a").eq(1).children().attr("src",data.url)
      $("form input#id").val(data.id)
      });
},1000);
    // });

  });
