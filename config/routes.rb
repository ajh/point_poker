Rails.application.routes.draw do
  root to: 'games#new'

  resources :games do
    resources :events
    resources :game_changes
    resources :rounds do
      resources :plays
    end
    resources :users
  end
end
