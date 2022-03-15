Rails.application.routes.draw do
  root "movies#index"
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
