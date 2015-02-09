class WelcomeController < ApplicationController
  layout false
  def home; end

  # POST /games/create_fast
  def quick_start
    @game = Game.new game_params
    @user = @game.users.build user_params

    success = Game.transaction do
      @game.save && @user.save or raise ActiveRecord::Rollback
      session[:user_id] = @user.id
    end

    if success
      redirect_to @game
    else
      render :home
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def user_params
    params.require(:user).permit(:name, :observer)
  end
end
