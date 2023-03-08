require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Jonh', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.create!(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                         likes_counter: 1)
  end

  it 'post should be valid with title, text and author' do
    expect(@post).to be_valid
  end

  it 'post should be invalid without title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'post should be invalid without text' do
    @post.text = nil
    expect(@post).to_not be_valid
  end

  it 'post should be invalid without author' do
    @post.author = nil
    expect(@post).to_not be_valid
  end

  it 'post should be invalid without text' do
    @post.text = nil
    expect(@post).to_not be_valid
  end
end
