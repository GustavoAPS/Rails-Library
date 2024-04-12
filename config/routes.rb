Rails.application.routes.draw do
  root "pages#home"
  resources :books#, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
