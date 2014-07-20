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
  $('.flashcard_form').hide();

  $('#create_deck').submit(function(e){
    e.preventDefault();
    console.log($('#create_deck').serialize())
    $.ajax({
      type: "POST",
      url: "/decks/create",
      data: $('#create_deck').serialize()
    }).success(function(data){
        $('.deck_form').hide();
        $('.flashcard_form').show();
      })
    .fail(function(){
      alert("Request failed")
    })
  });
});
