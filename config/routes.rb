Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :goals, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
