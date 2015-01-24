json.game_changes @game_changes do |game_change|
  json.id game_change.id
  json.game_version game_change.game_version
  json.created_at game_change.created_at
  json.updated_at game_change.updated_at

  if game_change.play
    json.play true
    json.html render(game_change.play)
  elsif game_change.round
    json.round true
    json.html render(game_change.round)
  elsif game_change.user
    json.user true
    json.html render(game_change.user)
  end
end

json.game do
  json.token @game.token
  json.version @game.lock_version
end
