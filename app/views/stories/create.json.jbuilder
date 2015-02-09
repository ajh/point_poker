if @story.errors.empty?
  json.plays do
    json.created_at @story.created_at
    json.description @story.description
    json.game_id @story.game_id
    with_format :html do
      json.html render @story
    end
    json.id @story.id
    json.updated_at @story.updated_at
    json.url game_story_url(@story.game, @story)
  end

else
  json.errors @story.errors.full_messages do |msg|
    json.title msg
  end
end
