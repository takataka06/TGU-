class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 500 }
  validates :post_id, presence: true
  validates :user_id, presence: true
end
