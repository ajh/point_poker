if @play.errors.empty?
  json.plays do
    json.created_at @play.created_at
    with_format :html do
      json.html @play
    end
    json.id @play.id
    json.story_id @play.story_id
    json.updated_at @play.updated_at
    json.url game_story_play_url(@play.story.game, @play.story, @play)
    json.user_id @play.user_id
    json.value @play.value
  end

else
  json.errors @play.errors.full_messages do |msg|
    json.title msg
  end
end
