class Comment < ApplicationRecord
  validates :content, presence: true, length: {minimum: 1, maximum: 280}
  belongs_to :user
  belongs_to :recipe, class_name: "Food"
end
