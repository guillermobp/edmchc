class Home2Controller < ApplicationController
  def index
    @encuentro = Encuentro.where(habilitado: true).last

    # TODO: Sacar al modelo, si se acepta esta propuesta.
    @fotos_aleatorias = (@encuentro.fotos + @encuentro.fotos_ensayos).sample(7)
    @conciertos_para_videos = @encuentro.conciertos.select { |c| c.tiene_video? }.sample(3)
    @fotos_ensayos = @encuentro.fotos_ensayos.sample(8)
    @fotos = @encuentro.fotos.sample(8)
  end
end