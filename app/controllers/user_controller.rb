class UserController < ApplicationController
before_action :authenticate_user!

  def created_events
    @created_events = current_user.created_events
  end

   def attended_events
    @attended_events = current_user.attended_events
   end

   def attend
     Event.find(params[:id]).attendees << current_user
     redirect_to event_path(params[:id]), notice: "You are now attending this event."
   end
end
