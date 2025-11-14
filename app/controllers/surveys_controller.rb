class SurveysController < ApplicationController
  before_action :require_login
  def show
    @survey = Survey.find(params[:id])
    unless current_user.admin? || current_user == @survey.user
      redirect_to profile_path, alert: "Acceso no autorizado"
    end
  end

  def new
    @survey = current_user.build_survey
  end

  def create
    @survey = current_user.build_survey(survey_params)
    if @survey.save
      redirect_to profile_path, notice: "Encuesta enviada"
    else
      render :new
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:group_size, :has_minors, :has_experience, :phone)
  end

  def require_login
    redirect_to login_path unless current_user
  end
end

