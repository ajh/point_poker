Rails.application.routes.draw do

  resources :game_changes

  root to: 'games#new'
  resources :games do
    resources :events
    resources :rounds
    resources :users
  end
end
