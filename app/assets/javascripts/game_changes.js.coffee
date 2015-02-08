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
        getChangesSince game.data('version')

    # Get changes to game since our version
    getChangesSince = (version) ->
      request = $.get game.data('game-changes-url').replace('replace_me', version)
      request.done (data, status, xhr) ->
        $.each data.game_changes, (index, game_change) ->
          handleGameChange game_change
        game.data 'version', data.games.version

    handleGameChange = (game_change) ->
      switch "#{game_change.resource}.#{game_change.action}"

        when "play.create"
          $('#story_' + game_change.story_id + ' .plays').append game_change.html

        when "story.create"
          $('#stories').append game_change.html

        when "story.update"
          $('#story_' + game_change.story_id).replaceWith game_change.html

        when "user.destroy", "user.create"
          $('#user_kick_list').replaceWith game_change.html
