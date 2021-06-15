class Food < ApplicationRecord
  validates :type, presence: true
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, length: {minimum: 1, maximum: 1000}
  has_many :quantities
  has_many :product_id, class_name: "Quantity", foreign_key: "product_id"
  has_many :recipe_id, class_name: "Quantity", foreign_key: "recipe_id"
  has_many :comments
  has_many :favorites
end
