require 'rails_helper'

RSpec.describe Post, type: :model do
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

  it 'post should be valid with title, text and author' do
    expect(post).to be_valid
  end

  it 'post should be invalid without title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'post should be invalid without text' do
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'post should be invalid without author' do
    post.author = nil
    expect(post).to_not be_valid
  end

  it 'posts counter should be equal to 2' do
    expect(user.posts_counter).to eq(2)
  end

  it 'post should be invalid with title length less than 5' do
    post.title = '1234'
    expect(post).to_not be_valid
  end

  it 'post should be invalid with title length more than 250' do
    post.title = '1234567890' * 25
    expect(post).to_not be_valid
  end

  it 'updates posts counter after save' do
    post.save
    expect(user.posts_counter).to eq(2)
  end
end
