class RepositoriesController < ApplicationController

  def index
    @repositories = Repository.all
  end

  def show
    @repository = Repository.find(params[:id])
  end

  def new
    @repository = Repository.new
  end

  def edit
    @repository = Repository.find(params[:id])
  end

  def create
    @repository = Repository.new(repository_params)
    if @repository.save
      redirect_to repositories_path, notice: 'Repository is created.'
    else
      render :new
    end
  end

  def update
    @repository = Repository.find(params[:id])
    if @repository.update(repository_params)
      redirect_to repositories_path, notice: 'Repository is updated.'
    else
      render :edit
    end
  end

  def destroy
    @repository = Repository.find(params[:id])
    @repository.destroy
    redirect_to repositories_path, notice: 'Repository is deleted.'
  end

  private

  def repository_params
    params.require(:repository).permit(
      :name,
      :slug,
      user_ids: [],
      event_ids: []
    )
  end

end
