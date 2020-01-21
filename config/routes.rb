Rails.application.routes.draw do
  get 'login', to: 'home#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, only: %i[new create show edit update destroy]
  resources :boards
  resources :comments, only: %i[create destroy]
end
