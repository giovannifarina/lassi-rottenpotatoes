Rails.application.routes.draw do
  root "movies#index"
  resources :movies do
		resources :reviews, only: [:new, :create, :destroy]
	end
end
