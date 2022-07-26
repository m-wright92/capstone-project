class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates_uniqueness_of :user_id, scope: :friend_id
  validate :disallow_self_friendship

  # prevents user from adding themselves as a friend#
  def disallow_self_friendship
    errors.add(:friend, "can't be yourself") if user == friend
  end

  # used to show friendship status of two users#
  def self.accepted_request?(id1, id2)
    case1 = !Friendship.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = !Friendship.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 || case2
  end

  # Not sure if necessary, but can by used to find record to verify deletion#
  def self.find_friendship(id1, id2)
    if Friendship.where(user_id: id1, friend_id: id2, confirmed: true).empty?
      Friendship.where(user_id: id2, friend_id: id1, confirmed: true)[0].id
    else
      Friendship.where(user_id: id1, friend_id: id2, confirmed: true)[0].id
    end
  end

end
