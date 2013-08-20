Checklist::Application.routes.draw do
  devise_for :users

  resources :tasks do
    resources :followers
  end

  root to: 'tasks#index'
end
