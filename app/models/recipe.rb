class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  # validates :name, presence: true
  # validates :public, presence: true
end