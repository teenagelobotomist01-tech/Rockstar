class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :email
      t.integer :experiencia
      t.integer :nivel
      t.string :password_digest

      t.timestamps
    end
  end
end
