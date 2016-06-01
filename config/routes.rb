Rails.application.routes.draw do
	resources :home
	resources :clients
	resources :products 
  resources :brands
  resources :orders

  get '/entrar' => 'sessions#new'
  post '/entrar' => 'sessions#create'
  get '/sair' => 'sessions#destroy'
  
  get '/cadastrar' => 'users#new'
  post '/users' => 'users#create'

  root 'sessions#new'
end
