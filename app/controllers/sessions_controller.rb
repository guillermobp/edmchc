# frozen_string_literal: true

class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to encuentros_path
    else
      flash[:alert] = 'Las credenciales ingresadas no coinciden; inténtelo nuevamente'
      render 'new'
    end
  end
end
