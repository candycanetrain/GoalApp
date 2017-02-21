class Goal < ApplicationRecord
  validates :title, :description, :user, :completed, :privacy, presence: true
  belongs_to :user
end
