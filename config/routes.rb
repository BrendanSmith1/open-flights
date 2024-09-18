Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, only: %i[create destroy]
    end
  end

  # Routes all requests not predefined in the Rails app to the React app index.html, without interfering with Rails routes
  get '*path', to: 'pages#index', via: :all
end
