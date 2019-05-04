Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :readings, only: [:create, :show]
  get '/thermostats/:id/status', to: 'thermostats#status'
end
