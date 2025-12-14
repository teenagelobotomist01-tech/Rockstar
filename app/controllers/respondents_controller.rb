class RespondentsController < ApplicationController
  def dashboard
    @plans = Plan.all
  end
end
