$(document).ready(function() {
  // Homepage Things

  $('#login_form').hide();
  $('#sign_up_form').hide();

  $('#login').click(function(e){
    e.preventDefault();
    $(this).hide();
    $('#login_form').show();
  });

  $('#sign_up').click(function(e){
    e.preventDefault();
    $(this).hide();
    $('#sign_up_form').show();
  });

  // decks#create things

  $('#create_deck').submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: "/decks/create",
      data: $('#create_deck').serialize(),
      success: function(result){
        console.log(result)
        $('.left_column').html(result)
      },
      fail: function(){
        alert("Request failed")
      }
    })
  });
});
