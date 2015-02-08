class UserDestroyer
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def destroy
    user.transaction do
      game_change.save && user.destroy or raise ActiveRecord::Rollback
    end
  end

  private

  def game_change
    @game_change ||= user.game.game_changes.build user: user,
                                                  game_version: user.game.lock_version + 1,
                                                  action: 'destroy'
  end
end
