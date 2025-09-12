class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
