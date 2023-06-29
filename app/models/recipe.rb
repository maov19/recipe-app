class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods

  validates :name, presence: true
  attribute :public, :boolean, default: false
  validates :public, inclusion: { in: [true, false] }
  validates :preparation_time, presence: true, numericality: { greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }
end
