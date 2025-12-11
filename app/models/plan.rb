class Plan < ApplicationRecord
  belongs_to :planner, class_name: "User"
  has_many :surveys, dependent: :destroy

  validates :name, presence: true
end
