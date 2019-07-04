class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash.notice = 'Correo enviado con instrucciones para recuperar la contraseña'
    else
      flash.alert = 'Correo no encontrado'
    end

    redirect_to new_password_reset_path
  end

  def edit; end

  def update
    if params[:user][:password].empty?
      flash.alert = 'Debe ingresar una contraseña'
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_out if logged_in?
      flash.notice = 'La contraseña ha sido cambiada'
      redirect_to login_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirms a valid user
  def valid_user
    unless (@user && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash.alert = 'El período para cambiar la contraseña ha expirado. Realice el proceso de recuperación nuevamente.'
        redirect_to new_password_reset_url
      end
    end
end
