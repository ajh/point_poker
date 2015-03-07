class StoriesController < ApplicationController
  before_action :set_game
  respond_to :json, :html

  # POST /games/:game_id/stories
  # POST /games/:game_id/stories.json
  def create
    @story = @game.stories.build story_params
    story_creator = StoryCreator.new @story

    respond_to do |format|
      if story_creator.save
        format.json do
          render status: :created, location: game_story_url(@story.game, @story)
        end
        format.html do
          redirect_to game_path(@game)
        end
      else
        format.json do
          render status: :unprocessable_entity
        end
        format.html do
          redirect_to game_path(@game)
        end
      end
    end
  end

  private

  def set_game
    @game = Game.find_by_token(params[:game_id])
  end

  def story_params
    params.require(:story).permit(:description)
  end
end
