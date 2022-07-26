class PagesController < ApplicationController
  def home
    if current_user
      redirect_to '/feed'
    else
      render 'home'   
    end
  end
end
