class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html { render }
      format.json { render json: @users.to_json(include: [:teams, :todos]) }
    end
  end

  def show
    @user = User.find(params[:id])

    render json: @user.to_json(include: [:teams, :todos])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User is aangemaakt.'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User is aangepast.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User is verwijderd.'
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :github_username,
      :slack_username,
      team_ids: []
    )
  end

end
