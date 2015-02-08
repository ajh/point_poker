class UsersController < ApplicationController
  before_action :set_game

  def new
    @user = @game.users.build
  end

  def create
    @user = @game.users.build user_params

    respond_to do |format|
      if UserCreator.new(@user).save
        session[:user_id] = @user.id
        format.html { redirect_to @game, notice: "Welcome #{@user.name}" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = @game.users.find params[:id]
    UserDestroyer.new(@user).destroy
    head :no_content
  end

  private

  def set_game
    @game = Game.find_by_token(params[:game_id])
  end

  def user_params
    params.require(:user).permit(:name, :observer)
  end
end
