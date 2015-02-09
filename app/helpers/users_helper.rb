module UsersHelper
  # returns html for a kick link to the given user
  def kick_link(user)
    is_kick = current_user != user
    link_to (is_kick ? 'kick' : 'leave'),
      game_user_path(@game, user),
      'data-confirm' => 'This will remove the user from the game. Are you sure?',
      method: :delete,
      remote: true,
      class: "btn #{is_kick ? 'btn-danger' : 'btn-default'}"
  end
end
