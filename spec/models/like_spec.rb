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
  subject { Like.new(author: user, post:) }
  before { subject.save }

  it 'like should be invalid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
end
