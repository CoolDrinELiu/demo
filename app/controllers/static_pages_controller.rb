class StaticPagesController < ApplicationController
  def home
    if current_user != nil
      @micropost = current_user.microposts.new
      @feed_items = current_user.feed.page(params[:page]).per(12)
    end
  end

  def help
  end
end
