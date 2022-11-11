Rails.application.routes.draw do
  #get 'home/index'
  root 'home#index'
  get '/index/:date' => 'home#index', as:'index'
  get 'home/calendar'
 
 
  
end
