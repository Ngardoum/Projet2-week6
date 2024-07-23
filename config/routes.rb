Rails.application.routes.draw do
  root 'gossips#index'
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'
  get 'welcome/:first_name', to: 'pages#welcome', as: 'welcome'
  resources :gossips, only: [:new, :index, :show]
  resources :users, only: [:show]
end
