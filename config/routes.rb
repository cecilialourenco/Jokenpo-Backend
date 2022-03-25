Rails.application.routes.draw do
  resources :users

  post '/win' => 'users#win'
  post '/draw' => 'users#draw'
  post '/lose' => 'users#lose'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
