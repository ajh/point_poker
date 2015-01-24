Rails.application.routes.draw do
  root to: 'games#new'

  resources :games do
    resources :events
    resources :rounds do
      resources :plays
    end
    resources :users

    get 'game_changes/since/:version', to: 'game_changes#since', as: 'changes_since'
  end

  if Rails.env.development?
    get 'channel/:game_id', to: 'channel_tests#channel'
  end
end
