Rails.application.routes.draw do
  resources :users, only: %i[show, index] do
    resources :posts, only: %i[show create new index]
  end
  root to: 'users#index'

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
end
