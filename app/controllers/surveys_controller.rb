class SurveysController < ApplicationController
  def show
    @survey = Survey.find(params[:id])
  end

  def new
    # Cada usuario tiene una sola encuesta
    @survey = current_user.build_survey
  end

  def create
    @survey = current_user.build_survey(survey_params)
    if @survey.save
      redirect_to root_path, notice: "Encuesta creada correctamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:companion_option, :minors, :experience, :phone_number)
  end
end

