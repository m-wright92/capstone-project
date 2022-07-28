class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def index
    @users = User.all
    render 'index'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You're signed up!"
      session[:user_id] = @user.id
      render root_path
    else
      redirect_to '/signup'
    end
  end

  def show 
    @friend = User.find(params[:id])
    @user = User.find(current_user.id)
    @friend_requests = @user.friend_requests
    render 'profile'
  end

  def edit
    @user = User.find(current_user.id.to_s)
    render 'edit_profile'
  end

  def feed
    @user = current_user
    @post = Post.new
    @posts = Post.most_recent_ten
    render 'feed'
  end

  def add_friend
    @user = current_user
    @friend = User.find(params[:friend_id])
    @user.send_friend_request(@friend)
    flash[:success] = "Friend request sent!"
    redirect_to user_path(@friend)
  end

  def accept_friend
    @user = current_user
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.where(user_id: @friend.id, friend_id: @user.id).first
    @friendship.update(confirmed: true)
    redirect_to user_path(@user)
  end

  def decline_friend
    @user = current_user
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.where(user_id: @friend.id, friend_id: @user.id).first
    @friendship.destroy
    redirect_to user_path(@user)
  end

  def friend_requests
    @user = current_user
    @friend_requests = @user.friend_requests
    render 'friend_requests'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :birth_date, :given_name, :family_name, :phone_number)
  end
end
