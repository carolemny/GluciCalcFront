class Meal < ApplicationRecord
  validates :type, presence: true
  belongs_to :user
end
