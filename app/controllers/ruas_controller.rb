class RuasController < ApplicationController
  def beijing
    respond_to do |format|
      format.json {render json: User.where("name like ?","%#{params[:phrase]}%").map{|x|{name:x.name,id:x.id}}}

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
end
