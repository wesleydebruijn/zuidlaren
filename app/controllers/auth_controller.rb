class AuthController < ApplicationController
  skip_before_action :authenticate!

  def login

  end

  def authenticate
    client = Octokit::Client.new
    url    = client.authorize_url

    redirect_to url
  end

  def callback
    code   = params[:code]
    client = Octokit::Client.new
    result = client.exchange_code_for_token(code)

    if result[:error]
      redirect_to auth_logout_path and return
    end

    access_token = result[:access_token]
    find_or_create_user access_token

    redirect_to root_path
  end

  def logout
    session[:gh_access_token] = nil
  end

  private

  def find_or_create_user(access_token)
    session[:gh_access_token] = access_token

    client      = Octokit::Client.new(access_token: access_token)
    github_user = client.user

    user = User.find_or_initialize_by(github_username: github_user[:login])
    if user.new_record?
      user.name = github_user[:name]
      user.save
    end
  end

end
