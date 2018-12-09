class FotosController < ApplicationController

  def index
    @charla = Charla.find(params[:charla_id])
    render layout: 'home'
  end
end
