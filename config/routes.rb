Rails.application.routes.draw do
  
  # Configuracion rutas questions
  root 'questions#index'
  resources :questions
  
end
