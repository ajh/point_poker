class UserCreator
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def save
    user.transaction do
      game_change.save && user.save or raise ActiveRecord::Rollback
    end
  end

  private

  def game_change
    @game_change ||= user.game.game_changes.build user: user,
                                                  game_version: user.game.lock_version + 1,
                                                  action: 'create'
  end
end
