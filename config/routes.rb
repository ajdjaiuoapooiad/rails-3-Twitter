Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help' =>  'static_pages#help'
  get  '/about' => 'static_pages#about'
  get  "/contact" => "static_pages#contact"

  resources :users
  get  "/signup" =>  "users#new"
  post '/signup' => 'users#create'
  get '/users/:id' => 'users#show'
end
