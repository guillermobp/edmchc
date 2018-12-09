class CharlasController < ApplicationController

    def index
        @charlas = Encuentro.last.charlas
    end

    def new
        @charla = Charla.new
        @charla.encuentro = Encuentro.last
    end

    def create
        @charla = Charla.new(charla_params)
        @charla.encuentro = Encuentro.last
        if (@charla.save)
            flash[:notice] = 'La charla ha sido creada exitosamente'
            redirect_to @charla
        else
            flash[:alert] = 'Ocurrió un error intentando crear la charla'
            redirect_to new_charla_path
        end
    end

    def show
        @charla = Charla.find(params[:id])
    end

    def edit
        @charla = Charla.find(params[:id])
    end

    def update
        @charla = Charla.find(params[:id])
        if @charla.update(charla_params)
            flash[:notice] = 'La charla ha sido actualizada correctamente'
            redirect_to @charla
        else
            flash[:alert] = 'Ocurrió un error intentando actualizar la charla'
            redirect_to edit_charla_path(@charla)
        end
    end

    def fotos
      @fotos = Charla.find(params[:id]).fotos
      render layout: 'home'
    end

    private

        def charla_params
            params.require(:charla).permit(:titulo, fotos: [])
        end

end
