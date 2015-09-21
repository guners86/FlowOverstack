Rails.application.routes.draw do

  # Configuracion rutas questions
  root 'questions#index'
  resources :questions
  
   # Configuracion rutas users -> Solo se permite new y create 
  resources :users, only: [:new, :create]
  
end
