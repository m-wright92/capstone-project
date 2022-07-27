class PostsController < ApplicationController

  def create 
    @user = current_user
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to user_feed_path
    else
      flash[:error] = "Post not created!"
      redirect_to user_feed_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_body, :user_id)
  end
end
