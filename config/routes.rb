Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :home, only: [:index, :secret]
  resources :event do
  	resources :charges
	end
  resources :users, only: [:show, :edit, :update]
  resources :participations, only: [:index, :new, :create, :destroy]
  
end
