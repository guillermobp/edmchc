# frozen_string_literal: true

class UsersController < AdminController
  before_action :find_user

  def edit; end

  def update
    if (user_params[:password] != user_params[:password_confirmation])
      flash[:alert] = 'Las contraseñas no coinciden'
    elsif @user.update(user_params)
      flash[:notice] = 'El usuario ha sido actualizado correctamente'
    else
      flash[:alert] = 'Ocurrió un error intentando actualizar el usuario. Revise los datos ingresados. Nombre y correo son obligatorios.'
    end

    redirect_to edit_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
