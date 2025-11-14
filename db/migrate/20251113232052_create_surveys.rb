class CreateSurveys < ActiveRecord::Migration[8.1]
  def change
    create_table :surveys do |t|
      t.references :user, null: false, foreign_key: true
      t.string :group_size
      t.boolean :has_minors
      t.boolean :has_experience
      t.string :phone

      t.timestamps
    end
  end
end
