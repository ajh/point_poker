if @play.errors.empty?
  json.plays do
    json.created_at @play.created_at
    json.html render(partial: 'plays/play.html', locals: {play: @play})
    json.id @play.id
    json.round_id @play.round_id
    json.updated_at @play.updated_at
    json.url game_round_play_url(@play.round.game, @play.round, @play)
    json.user_id @play.user_id
    json.value @play.value
  end

else
  json.errors @play.errors.full_messages do |msg|
    json.title msg
  end
end
