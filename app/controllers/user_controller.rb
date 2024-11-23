class UserController < ApplicationController
before_action :authenticate_user!

  def created_events
    @created_events = current_user.created_events
  end

   def attended_events
    @attended_events = current_user.attended_events
   end

   def attend
    event = Event.find(params[:id])
    if current_user.attended_events.include?(event)
      redirect_to event_path(event), alert: "You are already attending this event."
    else
     event.attendees << current_user
     redirect_to event_path(params[:id]), notice: "You are now attending this event."
    end
   end
end
