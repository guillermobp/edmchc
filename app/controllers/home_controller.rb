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

  def fotos_generales
    @encuentro = Encuentro.where(habilitado: true).last
    render layout: 'fotos'
  end

  def fotos_ensayos
    @encuentro = Encuentro.where(habilitado: true).last
    render layout: 'fotos'
  end
end
