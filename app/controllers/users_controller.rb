class UsersController < ApplicationController
  before_action :require_admin, only: [:index]
def index
  @users = User.all
end


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
    @plans = Plan.all
  end

  private

  def user_params
    params.require(:user).permit(:nombre, :email, :password, :password_confirmation)
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "No tienes permisos para acceder."
    end
  end

end

