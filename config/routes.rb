Rails.application.routes.draw do
  root'static_pages#home'

  get 'static_pages/help'

  get '/signup', to: 'users#new'
  resources :users

  post '/signup', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
