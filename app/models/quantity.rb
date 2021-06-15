class Quantity < ApplicationRecord
  validates :quantity, presence: true
  validates :carbs_per_100g, presence: true
  belongs_to :meal
  
  belongs_to :product, class_name: "Food"
  belongs_to :recipe, class_name: "Food"

end
