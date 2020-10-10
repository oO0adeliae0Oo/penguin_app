class StaticPagesController < ApplicationController
  def index
    @users = User.where(activated: true)
  end
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
