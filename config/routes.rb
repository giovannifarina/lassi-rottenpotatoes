Rails.application.routes.draw do
  root "movies#index"

  resources :movies do
		resources :reviews, only: [:new, :show, :create]
	end
  resources :moviegoers, only: [:index, :new, :show, :create]
  
end
