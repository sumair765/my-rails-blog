class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'


  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, length: { maximum: 250 }, presence: true
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_posts_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
