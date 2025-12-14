class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :plan, optional: false 

  after_create :sumar_creditos
  
  validates :companion_option, presence: true, inclusion: {
    in: ["no voy a ir solo", "voy a ir con alguien más", "somos más de tres personas"]
  }
  validates :plan_id, uniqueness: { scope: :user_id, message: "ya fue respondido por este usuario" }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "debe tener 10 dígitos" }

  private

  def sumar_creditos
    # Ajusta el nombre de la columna según tu esquema
    user.increment!(:credit, 300)
  end
end
