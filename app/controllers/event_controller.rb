class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create!(title: params[:title],description: params[:description], start_date: params[:start_date], duration: params[:duration], price: params[:price], location: params[:location], admin_id: current_user.id)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(title: params[:title],description: params[:description], start_date: params[:start_date], duration: params[:duration], price: params[:price], location: params[:location])
      flash[:success] = "Event Update!"
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to event_index_path
  end
end
