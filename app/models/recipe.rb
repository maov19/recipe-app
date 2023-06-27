class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :name, presence: true
  attribute :public, :boolean, default: false
  validates :public, inclusion: { in: [true, false] }
end
