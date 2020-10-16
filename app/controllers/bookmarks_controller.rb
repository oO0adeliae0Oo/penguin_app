class BookmarksController < ApplicationController
  before_action :logged_in_user
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.bookmark(current_user)
  end

  def destroy
    @micropost = Bookmark.find(parms[:id]).micropost
    @micropost.rmbookmark(current_user)
  end
end
