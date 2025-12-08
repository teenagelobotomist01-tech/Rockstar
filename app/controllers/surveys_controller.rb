class SurveysController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @survey = Survey.find(params[:id])
  end

  def new
  @user = User.find(params[:user_id])
  @survey = @user.build_survey
end


  def create
    @user = User.find(params[:user_id])
    @survey = @user.build_survey(survey_params)

    if @survey.save
      @user.increment!(:credit, 300)
      redirect_to user_path(@user), notice: "Encuesta creada correctamente. ¡Ganaste 300 créditos!"

    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:companion_option, :minors, :experience, :phone_number)
  end
end

