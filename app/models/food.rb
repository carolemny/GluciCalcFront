class Food < ApplicationRecord
  validates :category, presence: true
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, length: {minimum: 1, maximum: 1000}
  
  has_many :quantities, foreign_key: :recipe_id
  has_many :quantities, foreign_key: :product_id
  has_many :product_id, class_name: "Quantity", foreign_key: "product_id"
  has_many :recipe_id, class_name: "Quantity", foreign_key: "recipe_id"
  has_many :comments, foreign_key: :recipe_id
  has_many :favorites, foreign_key: :recipe_id
end
