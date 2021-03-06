Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts, only: [:index, :show, :create, :destroy] do
    member do
      resources :votes, only: [:create]
    end
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
