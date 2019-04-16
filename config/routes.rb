# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'admin', to: 'admin#index', as: :admin

  resources :encuentros, shallow: true do
    resources :exponentes,
              :coordinadores,
              :charlas,
              :conciertos
  end

  get '/charlas/:id/fotos', to: 'charlas#fotos', as: :charla_fotos
  get '/conciertos/:id/fotos', to: 'conciertos#fotos', as: :concierto_fotos
  get '/encuentros/:id/configuracion', to: 'encuentros#configuracion', as: :encuentro_configuracion
end
