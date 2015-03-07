class QuickStartCreator
  attr_accessor :game, :user

  def initialize(game_attrs={}, user_attrs={})
    @game = Game.new game_attrs
    @user = @game.users.build user_attrs
  end

  def save
    Game.transaction do
      @game.save && @user.save or raise ActiveRecord::Rollback
    end
  end
end
