class PlaysController < ApplicationController
  before_action :set_game
  before_action :set_story

  respond_to :json

  # POST /games/:game_id/stories/:story_id/plays
  # POST /games/:game_id/stories/:story_id/plays.json
  def create
    @play = @story.plays.build play_params.merge(user: current_user, user_name: current_user.name)
    play_creator = PlayCreator.new @play

    if play_creator.save
      render status: :created, location: game_story_play_url(@play.story.game, @play.story, @play)
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find_by_token(params[:game_id])
  end

  def set_story
    @story = @game.stories.find params[:story_id]
  end

  def play_params
    params.require(:play).permit(:value)
  end
end
