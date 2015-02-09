json.game_changes @game_changes do |game_change|
  json.action game_change.action
  json.created_at game_change.created_at
  json.game_version game_change.game_version
  json.id game_change.id
  json.updated_at game_change.updated_at

  if game_change.play
    json.resource 'play'
    json.play_id game_change.play_id
    json.play true
    json.story_id game_change.play.story_id
    with_format :html do
      json.html render game_change.play
    end
  elsif game_change.story
    json.resource 'story'
    json.story_id game_change.story_id
    json.story true
    with_format :html do
      json.html render game_change.story
    end
  elsif game_change.user_id
    json.resource 'user'
    json.user_id game_change.user_id
    json.user true
    with_format :html do
      json.html render partial: "users/user_kick_list", locals: {user: game_change.user}
    end
  end
end

json.games do
  json.token @game.token
  json.version @game.lock_version
end
