class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', dependent: :destroy

  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
