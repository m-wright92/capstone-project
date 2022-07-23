require 'rails_helper'

describe Friendship do
  before(:each) do
    user1 = User.create!(email: Faker::Internet.email,
                          password: 'password',
                          birth_date: Faker::Date.between(from: '1930-01-01', to: '2000-01-01'),
                          given_name: Faker::Name.first_name,
                          family_name: Faker::Name.last_name,
                          phone_number: Faker::PhoneNumber.phone_number)
    user2 = User.create!(email: Faker::Internet.email,
                          password: 'password',
                          birth_date: Faker::Date.between(from: '1930-01-01', to: '2000-01-01'),
                          given_name: Faker::Name.first_name,
                          family_name: Faker::Name.last_name,
                          phone_number: Faker::PhoneNumber.phone_number)
  end

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :friend }
    it { should validate_uniqueness_of(:user_id).scoped_to(:friend_id) }

    it 'should validate that user and friend are not the same' do
      friendship = Friendship.new(user_id: 1, friend_id: 1)
      expect(friendship).to_not be_valid
    end
  end
end