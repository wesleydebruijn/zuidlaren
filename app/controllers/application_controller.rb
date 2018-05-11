class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate!

  private

  def authenticate!
    access_token = session[:gh_access_token]
    raise if access_token.blank?

    client = Octokit::Client.new
    client.check_application_authorization access_token
  rescue => e
    # request didn't succeed because the token was revoked so we
    # invalidate the token stored in the session and render the
    # index page so that the user can start the OAuth flow again
    session.delete(:gh_access_token)
    redirect_to auth_login_path
  end
end
