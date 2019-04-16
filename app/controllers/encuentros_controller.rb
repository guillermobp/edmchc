class EncuentrosController < AdminController
  before_action :find_encuentro, only: [:edit, :update, :destroy, :configuracion]

  def index; end

  def show; end

  def edit; end

  def configuracion; end

  def new
    @encuentro = Encuentro.new
  end

  def create
    @encuentro = Encuentro.new(encuentro_params)

    if @encuentro.save
      flash[:notice] = 'El encuentro ha sido creado exitosamente'
    else
      flash[:alert] = 'Ha ocurrido un error intentando crear el encuentro'
    end

    redirect_to edit_encuentro_path(@encuentro)
  end

  def update
    if @encuentro.update(encuentro_params)
      flash[:notice] = 'El encuentro ha sido actualizado exitosamente'
    else
      flash[:alert] = 'Ocurrió un error intentando actualizar el encuentro'
    end

    if params[:encuentro][:url]
      flash.discard(:notice)
      redirect_to params[:encuentro][:url]
    else
      redirect_to edit_encuentro_path(@encuentro)
    end
  end

  def destroy
    if @encuentro.destroy
      flash[:notice] = 'El encuentro ha sido eliminado exitosamente'
    else
      flash[:alert] = 'Ocurrió un error intentando eliminar el encuentro'
    end
    redirect_to admin_path
  end

  private

  def encuentro_params
    params.require(:encuentro).permit(:habilitado,
                                      :version,
                                      :epigrafe,
                                      :titulo,
                                      :bajada,
                                      :banner_promocional,
                                      :mostrar_promocional,
                                      :video,
                                      :titulo_quienes_somos,
                                      :cuerpo_quienes_somos,
                                      :foto_quienes_somos,
                                      :foto_coordinador,
                                      :videos,
                                      fotos: [],
                                      fotos_ensayos: [],
                                      logos: [],
                                      imagenes_prensa: [])
  end

  def find_encuentro
    @encuentro = @encuentro_tabs = Encuentro.find(params[:id])
  end

end
