$(document).on 'ready', ->

  if $('#game').length > 0
    game = $('#game')

    # create websocket dispatcher
    window.dispatcher = new WebSocketRails game.data('websocket-url').replace(/https?:\/\//, '')

    # subscribe to the games channel
    window.channel = dispatcher.subscribe game.data('channel')

    # listen for the one event type on the channel: 'news'
    window.channel.bind 'news', (data)->
      if game.data('version') < data.game_version
        get_changes_since game.data('version')

    # Get changes to game since our version
    get_changes_since = (version) ->
      request = $.get game.data('game-changes-url').replace('replace_me', version)
      request.done (data, status, xhr) ->
        $.each data.game_changes, (index, game_change) ->
          if game_change.play
            handle_play_change game_change
          if game_change.story
            handle_story_change game_change

        game.data 'version', data.games.version

    handle_play_change = (game_change) ->
      $('#story_' + game_change.story_id + ' .plays').append game_change.html

    handle_story_change = (game_change) ->
      if game_change.action == 'create'
        $('#stories').append game_change.html
      else if game_change.action == 'update'
        $('#story_' + game_change.story_id).replaceWith game_change.html

