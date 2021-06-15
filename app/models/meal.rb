class Meal < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :quantities
end
