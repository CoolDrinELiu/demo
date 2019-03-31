class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    if event.save
      xxx = "ok"
    else
      xxx = "failed"
    end
    respond_to do |format|
      format.json { render json: {msg: xxx, result: event.valid?} }
    end
  end

  def event_params
    params.permit(:name,:phone)
  end
end
