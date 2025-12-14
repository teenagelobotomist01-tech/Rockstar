class User < ApplicationRecord
  has_secure_password

  # Callbacks
  after_create :give_initial_credit
  before_create :set_defaults

  # Asociaciones
  has_many :surveys, dependent: :destroy
  has_many :plans, foreign_key: :planner_id, dependent: :destroy

  # Definición de roles
  enum :role, { planner: "planner", respondent: "respondent", admin: "admin" }

  # Validaciones
  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  def planner?
    role == "planner"
  end

  def respondent?
    role == "respondent"
  end
  private

  def password_required?
    new_record? || !password.nil?
  end

  def set_defaults
    self.experiencia ||= 0
    self.nivel ||= 1
  end

  def give_initial_credit
    increment!(:credit, 500)
  end
end

