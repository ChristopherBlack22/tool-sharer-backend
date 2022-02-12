Rails.application.routes.draw do
  #resources :categories
  #resources :tools, only: [:index, :create, :update]
  resources :users, only: [:create]
  post "login", to: "auth#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
