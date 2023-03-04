require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 1
    )
  end

  let(:post) do
    Post.new(
      title: 'My first post',
      text: 'This is my first post.',
      author: user,
      comments_counter: 1,
      likes_counter: 2
    )
  end
  let(:like) do
    Like.new(
      author: user,
      post:
    )
  end
end
