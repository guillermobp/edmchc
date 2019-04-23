class Home2Controller < ApplicationController
  def index
    @encuentro = Encuentro.where(habilitado: true).last

    # TODO: Sacar al modelo, si se acepta esta propuesta.
    @fotos_aleatorias = (@encuentro.fotos + @encuentro.fotos_ensayos).sample(7)
  end
end
