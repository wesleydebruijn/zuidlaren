class EventsController < ApplicationController

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to edit_event_group_path(@event.event_group), notice: 'Event is aangemaakt.'
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to edit_event_group_path(@event.event_group), notice: 'Event is aangepast.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to edit_event_group_path(@event.event_group), notice: 'Event is verwijderd.'
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :action,
      :event_group_id,
      team_ids: []
    )
  end

end
