Rails.application.routes.draw do
  devise_for :users
  get 'home_page/index'
  resources :topics
  root 'home_page#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
