class DashboardController < ApplicationController

  def index
    @teams = Team.all
    @users = User.all
  end

end
