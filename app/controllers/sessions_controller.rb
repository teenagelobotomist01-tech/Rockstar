class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      # Redirige al perfil del usuario en el idioma actual
      redirect_to user_path(user, locale: I18n.locale), notice: t("session.logged_in", default: "Sesión iniciada")
    else
      flash.now[:alert] = t("session.invalid", default: "Correo o contraseña incorrectos")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path(locale: I18n.locale), notice: t("session.logged_out", default: "Sesión cerrada")
  end
end

