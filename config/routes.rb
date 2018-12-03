Rails.application.routes.draw do

  get '/home/testaws', to: 'home#testaws'

  root 'home#index'

  resources :exponentes, :charlas, :ensayos, :conciertos, :encuentros, :coordinadores

end
