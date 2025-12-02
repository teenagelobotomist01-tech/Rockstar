class CreateSurveys < ActiveRecord::Migration[8.1]
    def change
    create_table :surveys do |t|
      t.string :companion_option, null: false   # "no voy a ir solo", "voy a ir con alguien más", "somos más de tres personas"
      t.boolean :minors, default: false         # ¿Hay menores de edad?
      t.boolean :experience, default: false     # ¿Tienes experiencia escalando?
      t.string :phone_number, null: false       # Número celular
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
