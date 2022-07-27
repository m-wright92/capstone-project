require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user1 = User.create!(email: Faker::Internet.email,
                          password: 'password',
                          birth_date: Faker::Date.between(from: '1930-01-01', to: '2000-01-01'),
                          given_name: Faker::Name.first_name,
                          family_name: Faker::Name.last_name,
                          phone_number: Faker::PhoneNumber.phone_number)
    @user2 = User.create!(email: Faker::Internet.email,
                          password: 'password',
                          birth_date: Faker::Date.between(from: '1930-01-01', to: '2000-01-01'),
                          given_name: Faker::Name.first_name,
                          family_name: Faker::Name.last_name,
                          phone_number: Faker::PhoneNumber.phone_number)
     @user3 = User.create!(email: Faker::Internet.email,
                            password: 'password',
                            birth_date: Faker::Date.between(from: '1930-01-01', to: '2000-01-01'),
                            given_name: Faker::Name.first_name,
                            family_name: Faker::Name.last_name,
                            phone_number: Faker::PhoneNumber.phone_number)
  end

  describe 'associations' do
    it { should have_many :friendships }
    it { should have_many :friends }
    it { should have_many :posts }
    it { should have_many :comments }
    it { should have_many :post_reactions }
    it { should have_many :comment_reactions }
    it { should have_many :pending_friend_requests }
  end

  describe 'validations' do
    it { should validate_presence_of :given_name }
    it { should validate_presence_of :family_name }
    it { should validate_presence_of :birth_date }
  end

  describe '#full_name' do
    it 'returns the full name of the user' do
      user = User.create(given_name: 'John', family_name: 'Doe')
      expect(user.full_name).to eq('John Doe')
    end
  end

  describe '#age' do
    it 'returns the age of the user' do
      user = User.create(birth_date: '2000-01-01')
      expect(user.age).to eq(22)
    end
  end

  describe '#friend_requests' do
    it 'returns the friend requests of the user' do
      friends1 = Friendship.create(user_id: @user1.id, friend_id: @user2.id, confirmed: false)
      friends2 = Friendship.create(user_id: @user1.id, friend_id: @user3.id, confirmed: false)
      expect(@user2.friend_requests).to eq([friends1])
      expect(@user3.friend_requests).to eq([friends2])
    end
  end
  

  describe '#friends' do
    it 'returns the friends of the user' do
      friends1 = Friendship.create(user_id: @user1.id, friend_id: @user2.id, confirmed: true)
      friends2 = Friendship.create(user_id: @user1.id, friend_id: @user3.id, confirmed: true)
      expect(@user1.friends).to eq([@user2, @user3])
    end
  end

  describe '#friends_with?' do
    it 'returns true if the user is friends with the other user' do
      friends1 = Friendship.create(user_id: @user1.id, friend_id: @user2.id, confirmed: false)
      friends2 = Friendship.create(user_id: @user1.id, friend_id: @user3.id, confirmed: false)
    end
  end

  describe '#send_friend_request' do
    it 'sends a friend request to the other user' do
      @user1.send_friend_request(@user2)
      @user1.send_friend_request(@user3)
      expect(@user2.friend_requests.count).to eq(1)
      expect(@user3.friend_requests.count).to eq(1)
    end
  end
end
