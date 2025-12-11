class SessionsController < ApplicationController
  def new
    # formulario de login
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      if user.admin?
        # Redirige al listado de usuarios si es admin
        redirect_to users_path, notice: t("session.logged_in_admin", default: "Sesión iniciada como administrador")
      else
        # Redirige al perfil del usuario con el idioma actual
        redirect_to after_sign_in_path_for(user), notice: t("session.logged_in", default: "Sesión iniciada")

      end
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

