Octokit.configure do |c|
  c.client_id     = Rails.application.secrets.gh_basic_client_id
  c.client_secret = Rails.application.secrets.gh_basic_secret_id
end
