class Meal < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :quantities, dependent: :destroy

  def as_json(options)
    super(include: { quantities: { include: [:product, :recipe] } })
  end
end
