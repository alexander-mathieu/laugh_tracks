Rails.application.routes.draw do
  get '/comedians', to: 'comedians#index'
  get '/comedians/new', to: 'comedians#new'
  post '/comedians', to: 'comedians#create'
end
