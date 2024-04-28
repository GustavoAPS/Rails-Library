Rails.application.routes.draw do
  root "pages#home"
  resources :books#, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :users, except: [:new]
  get 'signup', to: 'users#new'
end
