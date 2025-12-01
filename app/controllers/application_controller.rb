class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :current_user

  # Establece el idioma desde la URL o usa español por defecto
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Asegura que todas las URLs generadas incluyan el idioma actual
  def default_url_options
    { locale: I18n.locale }
  end

  # Devuelve el usuario actual si está logueado
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Redirige al inicio si no hay usuario logueado, manteniendo el idioma
  def require_login
    redirect_to root_path(locale: I18n.locale) unless current_user
  end
end

