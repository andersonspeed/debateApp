Rails.application.routes.draw do



  resources :categories
  devise_for :users
  get 'users/:id/show_open_topics', to: 'users#show_open_topics', as: 'show_open_topics'
  get 'users/:id/show_completed_topics', to: 'users#show_completed_topics', as: 'show_completed_topics'
  get 'users/:id/show_judgments', to: 'users#show_judgments', as: 'show_judgments'
  resources :users, only: [:show]
  resources :users, only: [:show]
  get 'home_page/index'
  resources :topics do
    resources :comments
  end


  namespace :pending do
    resources :topics
  end

  namespace :active do
    resources :topics do
      resources :comments
    end
  end

  namespace :judging do
    resources :topics do
      resources :comments
      resources :judgements

    end
  end

  namespace :completed do
    resources :topics do
      resources :comments
    end
  end
  root 'home_page#index'

  #  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
