class Food < ApplicationRecord
  validates :type, presence: true
  validates :name, presence: true
  has_many :quantities
  has_many :comments
  has_many :favorites
end
