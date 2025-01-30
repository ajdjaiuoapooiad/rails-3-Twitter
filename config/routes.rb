Rails.application.routes.draw do
  get "sessions/new"
  root 'static_pages#home'

  get '/help' =>  'static_pages#help'
  get  '/about' => 'static_pages#about'
  get  "/contact" => "static_pages#contact"

  resources :users
  get  "/signup" =>  "users#new"
  post '/signup' => 'users#create'
  get '/users/:id' => 'users#show'
  
  resources :sessions
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
end
