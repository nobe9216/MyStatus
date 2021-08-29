class Status < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :date, presence: true
  validates :weight, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
