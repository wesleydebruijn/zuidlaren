class Api::TeamsController < ApplicationController

  def index
    @teams = Team.all

    render json: to_json(@teams)
  end

  def show
    @team = Team.find(params[:id])

    render json: to_json(@team)
  end

  private

  def to_json(collection)
    collection.to_json(include: [{ users: { include: :repositories}}, :events, :todos])
  end
end
