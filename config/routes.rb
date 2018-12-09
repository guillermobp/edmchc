Rails.application.routes.draw do

  root 'home#index'

  resources :exponentes, :ensayos, :encuentros, :coordinadores

  resources :charlas, :conciertos do
    resources :fotos, only: [:index]
  end

end
