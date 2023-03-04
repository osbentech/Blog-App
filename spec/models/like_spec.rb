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
  it 'like should be valid with author and post' do
    expect(like).to be_valid
  end

  it 'like should be invalid without author' do
    like.author = nil
    expect(like).to_not be_valid
  end

  it 'likes counter should be equal to 3' do
    expect(post.likes_counter).to eq(3)
  end
end
