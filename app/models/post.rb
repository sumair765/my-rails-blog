class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  after_save :update_posts_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
