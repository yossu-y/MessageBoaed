Rails.application.routes.draw do
  resources :data_pages
  get 'users/index'
  get 'users/login_check'
  devise_for :accounts
  resources :board_messages
  resources :board_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
