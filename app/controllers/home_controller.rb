require 'aws-sdk-s3'

class HomeController < ApplicationController
  def index
    @encuentro = Encuentro.last
    @dias_charlas = @encuentro.charlas.group(:fecha).select(:fecha)
    @charlas = @encuentro.charlas
    @exponentes = @encuentro.exponentes
    @conciertos = @encuentro.conciertos
  end
end
