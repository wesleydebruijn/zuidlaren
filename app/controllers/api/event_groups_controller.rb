class Api::EventGroupsController < ApplicationController

  def index
    @event_groups = EventGroup.all

    render json: to_json(@event_groups)
  end

  def show
    @event_group = EventGroup.find_by(name: params[:name])

    render json: to_json(@event_group)
  end

  private

  def to_json(collection)
    collection.to_json(include: :events)
  end
end
