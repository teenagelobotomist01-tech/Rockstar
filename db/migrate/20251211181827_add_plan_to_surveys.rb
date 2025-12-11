class AddPlanToSurveys < ActiveRecord::Migration[8.1]
  def change
    add_reference :surveys, :plan, foreign_key: true
  end
end
