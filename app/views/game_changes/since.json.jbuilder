json.game_changes @game_changes do |game_change|
  json.action game_change.action
  json.created_at game_change.created_at
  json.game_version game_change.game_version
  json.id game_change.id
  json.updated_at game_change.updated_at

  if game_change.play
    json.play_id game_change.play_id
    json.play true
    json.round_id game_change.play.round_id
    json.html render(game_change.play)
  elsif game_change.round
    json.round_id game_change.round_id
    json.round true
    json.html render(game_change.round)
  elsif game_change.user
    json.user_id game_change.user_id
    json.user true
    json.html render(game_change.user)
  end
end

json.games do
  json.token @game.token
  json.version @game.lock_version
end
