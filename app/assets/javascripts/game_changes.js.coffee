$(document).on 'ready', ->

  update = ->
    request = $.get $('section.game').data('game-changes-url').replace('replace_me', $('section.game').data('version'))
    request.done (data, status, xhr) ->
      $.each data.game_changes, (index, game_change) ->
        console.log game_change
        if game_change.play
          $('.plays').append game_change.html

      $('section.game').data 'version', data.game.version

  if $('section.game').length > 0
    # todo
    # * what happens if dispatcher already exists?
    window.dispatcher = new WebSocketRails $('section.game').data('websocket-url').replace('http://', '')

    window.channel = dispatcher.subscribe $('section.game').data('channel')
    window.channel.bind 'news', (data)->
      if $('section.game').data('version') < data.game_version
        update()
