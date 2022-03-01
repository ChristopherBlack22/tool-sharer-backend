Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      #resources :tools, only: [:index, :create, :update]
      resources :tools, only: [:update]
      get "/categories", to: "categories#index"
      post "/signup", to: "users#create"
      post "/login", to: "auth#create"

    end 
  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
