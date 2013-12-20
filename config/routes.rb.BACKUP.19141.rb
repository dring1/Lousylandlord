LousyLandLord::Application.routes.draw do
  get "users/new"

  get "comments/new"

  get "landlords/new"

  resources :landlords do 
    resources :comments
  end
<<<<<<< HEAD

  resources :addresses

=======
  resources :sessions
  resources :users
>>>>>>> e99003e1284fb83d28279f09d6fb26cb239f66ce

  root :to =>  'static_pages#home'

  get '/submit', to: 'landlords#new'
  get '/search', to: 'static_pages#search'
  get '/home', to: 'static_pages#home'
  get '/tos', to: 'static_pages#TermsOfService'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
<<<<<<< HEAD
  get '/maps', to: 'static_pages#maps'
  patch '/create_comment', to: 'landlords#create_comment'
=======
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
>>>>>>> e99003e1284fb83d28279f09d6fb26cb239f66ce
end