class PlannersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_planner!

  def dashboard
    @plans = current_user.plans.includes(surveys: :user).distinct
  end

  private

  def ensure_planner!
    redirect_to root_path, alert: "No autorizado" unless current_user.planner?
  end
end
