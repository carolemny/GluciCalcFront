class Property < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 300}
  validates :location, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
