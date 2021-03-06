class StaticPagesController < ApplicationController
  def home
    if current_user != nil
      @micropost = current_user.microposts.new
      @feed_items = current_user.feed.page(params[:page]).per(12)
    end
  end

  def help
    # @json = [
    #     {"character": "Cyclops", "realName": "Scott Summers"},
    #     {"character": "Professor X", "realName": "Charles Francis Xavier"},
    #     {"character": "Mystique", "realName": "Raven Darkholme"},
    #     {"character": "Magneto", "realName": "Max Eisenhardt"},
    #     {"character": "Storm", "realName": "Ororo Monroe"},
    #     {"character": "Wolverine", "realName": "James Howlett"}
    # ].to_json
    # respond_to do |format|
    #   format.html
    #   format.json {render :json => @json}
  end
end
