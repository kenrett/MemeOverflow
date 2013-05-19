$(document).ready(function(){
   $('#upload').on('click', function(e){
    e.preventDefault();
    openFilePicker();
  });

  if ($("#google-login-button").length > 0){
    $("form").on("submit" ,function(e){
      e.preventDefault();
      window.location = "/auth/google_oauth2";
    });
  }
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
        $.post('memes', FPFile).always(function(data) {
          $('div.gallery div.row').prepend(data.responseText);
        });
      });
    },
    function(FPError){
      console.log(FPError.toString());
    }
  );
}
