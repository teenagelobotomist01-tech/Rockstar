class User < ApplicationRecord
  has_secure_password

  has_one :survey, dependent: :destroy

  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?  

  before_create :set_defaults

  private
 def password_required?
    new_record? || !password.nil?
  end

  def set_defaults
    self.experiencia ||= 0
    self.nivel ||= 1
  end
end

