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
          if game_change.round
            handle_round_change game_change

        game.data 'version', data.games.version

    handle_play_change = (game_change) ->
      $('#round_' + game_change.round_id + ' .plays').append game_change.html

    handle_round_change = (game_change) ->
      if game_change.action == 'create'
        $('#rounds').append game_change.html
      else if game_change.action == 'update'
        $('#round_' + game_change.round_id).replaceWith game_change.html

