class EncuentrosController < ApplicationController
    def index
        @encuentros = Encuentro.all
    end

    def edit
        @encuentro = Encuentro.find(params[:id])
    end

    def show
        @encuentro = Encuentro.find(params[:id])
    end

    def update
        @encuentro = Encuentro.find(params[:id])
        if @encuentro.update(encuentro_params)
            flash[:notice] = 'El encuentro ha sido actualizado exitosamente'
            redirect_to @encuentro
        else
            flash[:alert] = 'Ocurrió un error intentando actualizar el encuentro'
            redirect_to edit_encuentro_path(@encuentro)
        end
    end

    private

        def encuentro_params
            params.require(:encuentro).permit(:titulo, coordinador_attributes: [:nombre, :bio, :foto], fotos: [])
        end

end
