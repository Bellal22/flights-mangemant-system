Rails.application.routes.draw do
  
  resources :bookings 
  resources :flights
  get '/flight_existance', controller: :flights, action: :check_flight
  get '/seats_pnr', controller: :seats, action: :seats_by_pnr
  put '/change-seat', controller: :seats, action: :update_seat
  resources :seats
  resources :aeroplane
  # JWT Auth endpoints
  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
  
end
