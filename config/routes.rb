Rails.application.routes.draw do
  get '/comedians', to: 'comedians#index'
end
