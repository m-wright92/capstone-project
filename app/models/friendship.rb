class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates_uniqueness_of :user_id, scope: :friend_id
  validate :disallow_self_friendship

  def disallow_self_friendship
    errors.add(:friend, "can't be yourself") if user == friend
  end
end
