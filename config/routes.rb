Jointdb::Application.routes.draw do
  authenticated :user do
    root :to => 'companies#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :companies
  resources :categories
end
