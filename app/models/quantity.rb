class Quantity < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :carbs_per_100g, presence: true
  belongs_to :meal
  
  belongs_to :product, class_name: "Food", optional: true
  belongs_to :recipe, class_name: "Food", optional: true

end
