Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      #resources :categories, only: [:index]
      resources :tools, only: [:index, :create, :update]
      post "/signup", to: "users#create"
      post "/login", to: "auth#create"

    end 
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
