# Model for comments
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :posts, class_name: 'Post', foreign_key: :create_posts_id

  def update_comments_counter
    post.increment(:comments_counter)
  end
end
