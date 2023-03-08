require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a photo' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a bio' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'is should not be valid with a name longer than 30 characters' do
    subject.name = 'a' * 31
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name shorter than 1 character' do
    subject.name = 'a' * 0
    expect(subject).to_not be_valid
  end

  it 'is not valid with a bio longer than 100 characters' do
    subject.bio = 'a' * 101
    expect(subject).to_not be_valid
  end

  it 'is not valid with a bio shorter than 1 character' do
    subject.bio = 'a' * 0
    expect(subject).to_not be_valid
  end
end
