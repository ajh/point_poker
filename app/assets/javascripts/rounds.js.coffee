# play a card when it is clicked

$(document).on 'ready', ->

  $('form#new_round').on 'ajax:success', ->
    console.log 'here'
    $(this)[0].reset()
