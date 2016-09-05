Rails.application.routes.draw do
  root to: 'artists#index'
  resources :artists do
    resources :songs, only: [:index, :new, :create]
  end

  resources :songs, only: [:index, :show, :edit, :update, :destroy]
end
