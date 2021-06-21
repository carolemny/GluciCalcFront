class Food < ApplicationRecord
  validates :category, presence: true
  validates :name, presence: true
  validates :description, length: {minimum: 1, maximum: 5000}, if: :category_type?
  
  has_many :quantities, foreign_key: :recipe_id
  has_many :quantities, foreign_key: :product_id
  has_many :product_id, class_name: "Quantity", foreign_key: "product_id"
  has_many :recipe_id, class_name: "Quantity", foreign_key: "recipe_id"
  has_many :comments, foreign_key: :recipe_id
  has_many :favorites, foreign_key: :recipe_id

  def category_type?
    :category == 0;
  end
end
