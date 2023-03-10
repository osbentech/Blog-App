class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true, length: { maximum: 30 }
  validates :bio, presence: true, length: { maximum: 100 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :posts_counter, numericality: { only_integer: true, less_than_or_equal_to: 100 }
  validates :photo, presence: true, length: { maximum: 250 }

  def latest_posts
    posts.order(created_at: :desc).limit(3)
  end
end
