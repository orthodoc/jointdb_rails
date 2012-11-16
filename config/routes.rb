Jointdb::Application.routes.draw do
  resources :pages, except: [:show, :update, :destroy, :edit]

  authenticated :user do
    root :to => 'companies#index'
  end
  root :to => 'companies#index'
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :companies
  resources :categories
  get ':id', to: 'pages#show', as: :page
  put ':id', to: 'pages#update', as: :page
  delete ':id', to: 'pages#destroy', as: :page
  get ':id/edit', to: 'pages#edit', as: :edit_page
end
