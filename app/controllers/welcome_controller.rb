class WelcomeController < ApplicationController
  layout false
  def home
    @form = QuickStartCreator.new
  end

  # POST /games/create_fast
  def quick_start
    @form = QuickStartCreator.new game_params, user_params

    if @form.save
      session[:user_id] = @form.user.id
      redirect_to @form.game
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
