Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mechanic_id', to: 'mechanics#show'
  post 'mechanics/:mechanic_id', to: 'mechanic_rides#new'

  get '/amusement_parks/:park_id', to: 'amusement_parks#show'
end
