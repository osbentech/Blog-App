# Model for comments
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
  validates :text, presence: true, length: { maximum: 250 }

  after_save :update_comments_counter
  after_destroy :decrement_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_comments_counter
    post.decrement!(:comments_counter)
  end
end
