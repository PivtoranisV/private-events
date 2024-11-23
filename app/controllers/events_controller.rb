class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
     if @event.creator != current_user
    redirect_to events_path, alert: "You are not authorized to edit this event."
     end
  end

  def update
    @event = Event.find(params[:id])
    if @event.creator != current_user
      redirect_to events_path, alert: "You are not authorized to edit this event."
    elsif @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :category, :date)
  end
end
