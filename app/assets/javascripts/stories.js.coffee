# play a card when it is clicked

$(document).on 'ready', ->

  $('form#new_story').on 'ajax:success', ->
    $(this)[0].reset()
