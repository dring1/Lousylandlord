LousyLandLord::Application.routes.draw do
  get "users/new"

  get "comments/new"

  get "landlords/new"

  resources :landlords do 
    resources :comments
  end
  resources :sessions
  resources :addresses
  
  resources :users
  resources :searches


  root :to =>  'static_pages#home'

  get '/submit', to: 'landlords#new'
  get '/search', to: 'searches#new'
  get '/home', to: 'static_pages#home'
  get '/tos', to: 'static_pages#TermsOfService'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  patch '/create_comment', to: 'landlords#create_comment'
  post '/address_searching', to: 'searches#create_address_search'
  post '/landlord_searching', to: 'searches#create_landlord_search'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
end