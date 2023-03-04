class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :posts, class_name: 'Post', foreign_key: :create_posts_id
  after_save :likes_counter

  def update_likes_counter
    post.increment(:likes_counter)
  end
end
