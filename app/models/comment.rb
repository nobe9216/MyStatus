class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :status
  validates :comment, presence: true
end
