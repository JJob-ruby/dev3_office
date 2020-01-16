Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users

  resources :users
  resources :tickets
  resources :sprints
  resources :projects
  resources :ticket_time_logss

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
