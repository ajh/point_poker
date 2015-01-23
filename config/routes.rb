Rails.application.routes.draw do

  root to: 'games#new'
  resources :games do
    resources :events
    resources :rounds
    resources :users
  end
end
