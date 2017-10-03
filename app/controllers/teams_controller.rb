class TeamsController < ApplicationController

  def index
    @teams = Team.all

    respond_to do |format|
      format.html { render }
      format.json { render json: @teams.to_json(include: [{ users: { include: :repositories}}, :events, :todos]) }
    end
  end

  def show
    @team = Team.find(params[:id])

    render json: @team.to_json(include: [{ users: { include: :repositories}}, :events, :todos])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Team is created.'
    else
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path, notice: 'Team is updated.'
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path, notice: 'Team is deleted.'
  end

  private

  def team_params
    params.require(:team).permit(
      :name,
      :slack_channel,
      event_ids: [],
      user_ids: []
    )
  end

end
