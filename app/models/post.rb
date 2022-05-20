class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
