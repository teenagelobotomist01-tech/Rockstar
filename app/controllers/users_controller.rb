class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Redirige al perfil del usuario con el idioma actual
      redirect_to @user, locale: I18n.locale, notice: t("user.created")
    else
      # Renderiza la vista 'new' sin perder el idioma
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nombre, :email, :password, :password_confirmation)
  end
end

