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
        $.post('memes', FPFile).done(function() {
          alert("done");
          debugger
          // $('div.container').append(data);
        });
      });
    },
    function(FPError){
      console.log(FPError.toString());
    }
  );
}
