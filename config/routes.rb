Rails.application.routes.draw do
  root to: 'welcome#home'
  post 'quick_start', to: 'welcome#quick_start', as: 'quick_start'

  resources :games do
    resources :events
    resources :stories do
      resources :plays
    end
    resources :users

    get 'game_changes/since/:version', to: 'game_changes#since', as: 'changes_since'
  end

  if Rails.env.development?
    get 'channel/:game_id', to: 'channel_tests#channel'
    get "/pages/*id" => 'high_voltage/pages#show'
  end
end
