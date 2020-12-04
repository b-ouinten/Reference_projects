class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :no_rights_to_edit_event, only: [:edit]

  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.new(event_params.merge({admin: current_user}))
    if @event.save
      flash[:notice] = 'Event successfully created'
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = 'Event successfully updated !'
      redirect_to event_attendances_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    Event.destroy(@event.id)
    redirect_to user_path(@event.admin.id)
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :location, :price)
  end

  def no_rights_to_edit_event
    @event = Event.find(params[:id])
    unless is_event_admin_of?(@event)
      flash[:danger] = "You aren't rights to edit this event !"
      redirect_to event_path(@event.id)
    end
  end
end