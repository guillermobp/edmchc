class HomeController < ApplicationController
  def index
    @encuentro = Encuentro.where(habilitado: true).last
  end

  def ver_exponente
    @exponente = Exponente.find(params[:id])
  end

  def ver_quienes_somos
    @encuentro = Encuentro.where(habilitado: true).last
  end

  def ver_coordinador
    @encuentro = Encuentro.where(habilitado: true).last
  end
end
