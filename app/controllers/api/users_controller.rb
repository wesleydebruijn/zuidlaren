class Api::UsersController < ApplicationController

  def index
    @users = User.all

    render json: to_json(@users)
  end

  def show
    @user = User.find_by(github_username: params[:github_username])

    render json: to_json(@user)
  end

  private

  def to_json(collection)
    collection.to_json(include: [:teams, :todos])
  end
end
