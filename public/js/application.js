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
        $('.form').html(result)
      },
      fail: function(){
        alert("Request failed")
      }
    })
  });

  // flashcards#create inside decks#create view

  $('.form').on('submit', '#create_flashcard', function(e){
    e.preventDefault();
    var deckId = $('input[name=deckId]').val();
    $.ajax({
      type: "POST",
      url: "/decks/"+deckId+"/flashcards/create",
      data: $('#create_flashcard').serialize(),
      dataType: "json",
      fail: function(){
        alert("We apologize for the error. We have failed our families. Committing harakiri")
      },
      success: function(result){
        $.ajax({
          url: "/decks/"+deckId+"/flashcards",
          success: function(response){
            $('.right_column').html(response)
          },
          fail: function(){
            alert("HARAKIRI!!!!")
          }
        })
      }
    })
  })

  // flashcards#show so that question -> answer, and answer -> question

  $('.answer').hide();
  $('.question').on('click', function(e){
    $('.question').hide();
    $('.answer').show();
  })
  $('.answer').click(function(e){
    $('.answer').hide();
    $('.question').show();
  })

  // decks#show moving from one flashcard to the next
  // if only it worked

  // $('#next').click(function(e){
  //   e.preventDefault()
  //   var deckId = $('input[name=deckId]').val();
  //   var flashcardId = $('input[name=flashcardId]').val();
  //   console.log(flashcardId)
  //   $.ajax({
  //     url: '/decks/'+deckId+'/flashcards/'+flashcardId,
  //     data: $('#next').serialize(),
  //     success: function(response){
  //       console.log(response)
  //       $('.card').html(response)
  //     }
  //   })
  // })

  // flashcards#edit

  $('.right_column').on('click', '.edit_flashcard', function(e){
    console.log(this)
  })
});
