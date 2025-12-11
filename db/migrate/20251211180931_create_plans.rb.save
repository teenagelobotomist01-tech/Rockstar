class CreatePlans < ActiveRecord::Migration[8.1]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.text :description
      t.references :planner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
