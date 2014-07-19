$(document).ready(function() {
  $('#login_form').hide();
  $('#sign_up_form').hide();

  $('#login').click(function(e){
    e.preventDefault();
    $(this).hide();
    $('#login_form').show();
  })

  $('#sign_up').click(function(e){
    e.preventDefault();
    $(this).hide();
    $('#sign_up_form').show();
  })
});
