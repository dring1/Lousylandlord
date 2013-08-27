LousyLandLord::Application.routes.draw do
  get "comments/new"

  get "landlords/new"

  resources :landlords do 
    resources :comments
  end


  root :to =>  'static_pages#home'

  match '/submit', to: 'landlords#new'
  match '/search', to: 'static_pages#search'
  match '/home', to: 'static_pages#home'
  match '/tos', to: 'static_pages#TermsOfService'
  match '/contact', to: 'static_pages#contact'
  match '/about', to: 'static_pages#about'
  
end