class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :posts , dependent: :destroy
  has_many :post_reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_reactions, dependent: :destroy

  validates :given_name, presence: true
  validates :family_name, presence: true
  validates :birth_date, presence: true

  def full_name
    "#{given_name} #{family_name}"
  end

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  def friend_requests
    Friendship.where(friend_id: id, confirmed: false)
    Friendship.where(user_id: id, confirmed: false)
  end

  def send_friend_request(friend)
    Friendship.create(user_id: id, friend_id: friend.id, confirmed: false)
  end
end
