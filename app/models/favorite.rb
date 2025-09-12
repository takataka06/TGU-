class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user

  #user_idとpost_idのペアが重複しない状態に制限
  validates :user_id, uniqueness: { scope: :post_id }
end
