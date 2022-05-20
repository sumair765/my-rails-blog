class Like < ApplicationRecord
  belongs_to :author
  belongs_to :post, foreign_key: 'post_id'

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
