class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # before_action :authenticate_user!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true, length: { maximum: 30 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :posts_counter, numericality: { only_integer: true, less_than_or_equal_to: 100 }

  def latest_posts
    posts.includes(:author).order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end

  private

  def set_default_values
    self.posts_counter ||= 0
  end
end
