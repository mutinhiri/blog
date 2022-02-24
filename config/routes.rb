Rails.application.routes.draw do
  resources :users, only: %i[show, index] do
    resources :posts, only: %i[show, index]
  end
  root to: 'users#index'
end
