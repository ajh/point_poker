if @round.errors.empty?
  json.plays do
    json.created_at @round.created_at
    json.description @round.description
    json.game_id @round.game_id
    json.html render(@round)
    json.id @round.id
    json.updated_at @round.updated_at
    json.url game_round_url(@round.game, @round)
  end

else
  json.errors @round.errors.full_messages do |msg|
    json.title msg
  end
end
