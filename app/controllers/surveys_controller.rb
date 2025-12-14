class SurveysController < ApplicationController
def new
  @user = User.find(params[:user_id])
  if params[:plan_id].present?
    @plan = Plan.find(params[:plan_id])
    @survey = @user.surveys.build(plan: @plan)
  else
    @survey = @user.surveys.build
  end
end

def create
  @user = User.find(params[:user_id])
  @survey = @user.surveys.build(survey_params)
  @plan = Plan.find(@survey.plan_id) if @survey.plan_id.present?

  if @survey.save
    redirect_to user_path(@user), notice: "Encuesta enviada correctamente."
  else
    render :new, status: :unprocessable_entity
  end
end




  private

  def survey_params
    params.require(:survey).permit(:companion_option, :plan_id, :minors, :experience, :phone_number)
  end
end

