Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create], shallow: true do
        resources :drafts do
          resources :settings
          resources :footballers
        end
      end

      resources :drafts do
        get :search, on: :collection
      end


      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
      get "/logged_in", to: "auth#logged_in"
    end
  end
end
