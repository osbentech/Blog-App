# Model for comments
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
  validates :text, presence: true, length: { maximum: 250 }

  def update_comments_counter
    post.incremente!(:comments_counter)
  end
end
