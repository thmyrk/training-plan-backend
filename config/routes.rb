Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :workouts, only: [:show]
      resources :exercises, only: [:index, :create]
    end
  end
end
