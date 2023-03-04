require 'rails_helper'

RSpec.describe Comment, type: :model do
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
      likes_counter: 2,
      comments_counter: 1
    )
  end

  let(:comment) do
    Comment.new(
      text: 'This is my first comment.',
      author: user,
      post:
    )
  end
  it 'comment should be vaild with author and post' do
    expect(comment).to be_valid
  end
  it 'comment should be invalid without author' do
    comment.author = nil
    expect(comment).to_not be_valid
  end
  it 'comments counter should be equal to 3' do
    expect(post.comments_counter).to eq(3)
  end
end
