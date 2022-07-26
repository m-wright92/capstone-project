class FriendshipsController < ApplicationController

  def create
    user = current_user
    friend = User.find(params[:id])
    Friendship.create(user_id: user.id, friend_id: friend.id, confirmed: false)
    redirect_to '/feed'
  end



end
