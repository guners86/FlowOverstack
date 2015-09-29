Rails.application.routes.draw do

  get 'sessions/new'

  # Configuracion rutas questions
  root 'questions#index'
  resources :questions
  
  resources :questions do
	  resources :answers, only: [:create] # ruta de respuestas asociada a la pregunta
	end
  
  # Configuracion rutas users -> Solo se permite new y create 
  resources :users, only: [:new, :create]
  
  # Configuracion rutas login new, create y logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
