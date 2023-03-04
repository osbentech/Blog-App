require 'rails_helper'
# tests
RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'user should be valid with name, photo and bio' do
    expect(subject).to be_valid
  end

  it 'user should be invalid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'user should be invalid without photo' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'user should be invalid without bio' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'post should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post should be less than or equal to 100' do
    subject.posts_counter = 101
    expect(subject).to_not be_valid
  end

  it 'updates posts counter after save' do
    subject.save
    expect(subject.posts_counter).to eq(1)
  end
end
