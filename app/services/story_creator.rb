class StoryCreator
  attr_accessor :story

  def initialize(story)
    @story = story
  end

  def save
    story.transaction do
      story.save && game_change.save or raise ActiveRecord::Rollback
      WebsocketRails[story.game.token].trigger 'news', {game_version: story.game.lock_version}
    end
  end

  private

  def game_change
    @game_change ||= story.game
                          .game_changes
                          .build story: story,
                                 game_version: story.game.lock_version + 1,
                                 action: 'create'
  end
end
