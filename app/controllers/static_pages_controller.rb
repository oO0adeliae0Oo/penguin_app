class StaticPagesController < ApplicationController
  def index
    @users = User.where(activated: true)
  end
  
  def home
  end

  def help
  end
end
