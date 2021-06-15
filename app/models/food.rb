class Food < ApplicationRecord
  validates :type, presence: true
  validates :name, presence: true
  has_many :quantities
  has_many :product_id, class_name: "Quantity", foreign_key: "product_id"
  has_many :recipe_id, class_name: "Quantity", foreign_key: "recipe_id"
  has_many :comments
  has_many :favorites
end
