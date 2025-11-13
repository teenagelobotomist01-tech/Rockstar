class AdminController < ApplicationController
  before_action :require_admin

  def users
    @users = User.all
  end

  private

  def require_admin
    redirect_to profile_path unless current_user&.admin?
  end
end


