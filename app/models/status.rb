class Status < ApplicationRecord

  belongs_to :user
  has_many :favorites
  has_many :comments

  validates :date, presence: true
  validates :weight, presence: true

end
