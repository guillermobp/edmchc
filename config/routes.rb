Rails.application.routes.draw do

  root 'home#index'

  resources :exponentes, :ensayos, :encuentros, :coordinadores, :charlas, :conciertos

  get '/charlas/:id/fotos', to: 'charlas#fotos', as: :charla_fotos
  get '/conciertos/:id/fotos', to: 'conciertos#fotos', as: :concierto_fotos

end
