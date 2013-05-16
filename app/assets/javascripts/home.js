$(document).ready(function(){
  $('#upload').on('click', function(e){
    e.preventDefault();
    openFilePicker();
  });
});

function openFilePicker() {
  filepicker.setKey('AOixcvrX6QDqKiFk6kvaCze');
  filepicker.pickMultiple({
    mimetypes: ['image/*', 'text/plain'],
    container: 'window',
    services:['COMPUTER', 'FACEBOOK', 'GMAIL', 'INSTAGRAM']
    },
    function(FPFiles){
      $.each(FPFiles, function(index, FPFile){
        // var tempID = allTheMemes[index].id + 100;
        // var meme = new Meme (tempID, FPFile.url);
        // allTheMemes.push(meme);
        $.post('memes', FPFile);
        // var memeDiv = ['<div id="', tempID,'" class="meme">',meme.smallImg,'</div>'].join('');
        // $('#display-all-memes').prepend(memeDiv);
      });
    },
    function(FPError){
      console.log(FPError.toString());
    }
  );
}
