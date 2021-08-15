class Status < ApplicationRecord

  belongs_to :user
  belongs_to :status

  validates :date, presence: true
  validates :weight, presence: true

end
