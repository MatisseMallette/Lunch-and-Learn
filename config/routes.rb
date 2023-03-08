Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :recipes, only: :index
      resources :learning_resources, only: :index
      resources :users, only: :create
      resources :favorites, only: [:create, :index]
      get 'air_quality', to: 'air_quality#show'
    end
  end
end
