class EventsController < ApplicationController

  def create

    @event = Event.new(event_params)

    if @event.save
      render json: {event: @event}, status: :created
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:session, :view, :time, :question, :kind)
  end

end
