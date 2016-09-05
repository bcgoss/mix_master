Rails.application.routes.draw do
  root to: 'artists#index'
  resources :artists do
    resources :songs, only: [:new, :create]
  end

  resources :songs, only: [:show]
end
