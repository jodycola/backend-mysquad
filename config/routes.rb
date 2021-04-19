Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ######## PLAYERS ROUTES ########
  get '/players', to: 'players#index'
  get '/player/:search/:filter', to: 'players#show'

  ######## USER ROUTES ########
  get '/users', to: 'users#index'
  get '/auth', to: 'users#auth'
  get '/user/:id', to: 'users#show'
  post '/login', to: 'users#login'
  post '/signup', to: 'users#signup'
  put '/user/:id/updatename', to: 'users#name_change'
  put '/user/:id/updateemail', to: 'users#email_change'
  put '/user/:id/updatepassword', to: 'users#password_change'
  delete '/user/:id', to: 'users#delete'

  ######## TEAM ROUTES ########
  get '/team', to: 'teams#index'
  get '/team/:user_id/', to: 'teams#show'
  get '/team/:team_id/roster', to: 'teams#roster'
  post '/team/:user_id/new', to: 'teams#create'
  delete '/team/:team_id', to: 'teams#delete'
  delete '/team/:team_id/:player_id', to: 'teams#remove_from_team'

  ######## CONTRACT ROUTES ########
  get '/contract/:player_id', to: 'contracts#find'
  post '/contract', to: 'contracts#create'
  delete '/contract/:player_id', to: 'contracts#delete'

end
