class Api::RepositoriesController < ApplicationController

  def index
    @repositories = Repository.all

    render json: to_json(@repositories)
  end

  def show
    @repository = Repository.find_by(slug: params[:slug])

    render json: to_json(@repository)
  end

  private

  def to_json(collection)
    collection.to_json(include: [:users])
  end
end
