class EventGroupsController < ApplicationController

  def index
    @event_groups = EventGroup.all
  end

  def show
    @event_group = EventGroup.find(params[:id])

    render json: @event_groups.to_json(include: :events)
  end

  def new
    @event_group = EventGroup.new
  end

  def edit
    @event_group = EventGroup.find(params[:id])
  end

  def create
    @event_group = EventGroup.new(event_group_params)
    if @event_group.save
      redirect_to event_groups_path, notice: 'Event Group is created.'
    else
      render :new
    end
  end

  def update
    @event_group = EventGroup.find(params[:id])
    if @event_group.update(event_group_params)
      redirect_to event_groups_path, notice: 'Event Group is updated.'
    else
      render :edit
    end
  end

  def destroy
    @event_group = EventGroup.find(params[:id])
    @event_group.destroy
    redirect_to event_groups_path, notice: 'Event Group is deleted.'
  end

  private

  def event_group_params
    params.require(:event_group).permit(:name)
  end

end
