class UserController < ApplicationController
before_action :authenticate_user!

  def created_events
    @created_events = current_user.created_events.all
  end
end
