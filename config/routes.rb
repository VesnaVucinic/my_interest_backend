
Rails.application.routes.draw do
  post "/api/v1/login", to: "api/v1/sessions#create"
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"
  post "/api/v1/signup", to: "api/v1/users#create"
  get "/api/v1/all_boards", to: "api/v1/boards#all_boards"


  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :boards
      resources :pins
      # resources :boards do
      #   resources :pins
      # end
      
    end
  end
end
