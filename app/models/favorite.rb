class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe, class_name: "Food"
end
