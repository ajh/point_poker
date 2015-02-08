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
    json.html render(partial: "plays/play.html", locals: {play: game_change.play})
  elsif game_change.story
    json.resource 'story'
    json.story_id game_change.story_id
    json.story true
    json.html render(partial: "stories/story.html", locals: {story: game_change.story})
  elsif game_change.user_id
    json.resource 'user'
    json.user_id game_change.user_id
    json.user true
    json.html render(partial: "users/user_kick_list.html", locals: {user: game_change.user})
  end
end

json.games do
  json.token @game.token
  json.version @game.lock_version
end
