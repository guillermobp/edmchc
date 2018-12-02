class EnsayosController < ApplicationController

    def index
        @ensayos = Encuentro.last.ensayos
    end

    def new
        @ensayo = Ensayo.new
        @ensayo.encuentro = Encuentro.last
    end

    def create
        @ensayo = Ensayo.new(ensayo_params)
        @ensayo.encuentro = Encuentro.last
        if (@ensayo.save)
            flash[:notice] = 'El ensayo ha sido creado exitosamente'
            redirect_to @ensayo
        else
            flash[:alert] = 'Ocurrió un error intentando crear el ensayo'
            redirect_to new_ensayo_path
        end
    end

    def show
        @ensayo = Ensayo.find(params[:id])
    end

    def edit
        @ensayo = Ensayo.find(params[:id])
    end

    def update
        @ensayo = Ensayo.find(params[:id])
        if @ensayo.update(ensayo_params)
            flash[:notice] = 'El ensayo ha sido actualizado correctamente'
            redirect_to @ensayo
        else
            flash[:alert] = 'Ocurrió un error intentando actualizar el ensayo'
            redirect_to edit_ensayo_path(@ensayo)
        end
    end

    private

        def ensayo_params
            params.require(:ensayo).permit(:titulo, :descripcion, fotos: [])
        end
end
