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

  # Método para proteger rutas y exigir login
  def authenticate_user!
    unless current_user
      redirect_to new_session_path, alert: "Debes iniciar sesión para acceder a esta página"
    end
  end

  # Redirige al inicio si no hay usuario logueado, manteniendo el idioma
  def require_login
    redirect_to root_path(locale: I18n.locale) unless current_user
  end

  # Redirección según el rol del usuario
def after_sign_in_path_for(resource)
  case resource.role
  when "planner"
    planner_dashboard_path
  when "respondent"
    user_path(resource)   # aquí va al perfil del usuario
  when "admin"
    admin_dashboard_path
  else
    root_path
  end
end

end

