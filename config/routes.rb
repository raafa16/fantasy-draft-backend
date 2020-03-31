Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :drafts do
        resources :settings
        resources :footballers
      end

      resources :drafts do
        get :search, on: :collection
      end


      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"

    end
  end
  root to: "api/v1/static#home"
end
