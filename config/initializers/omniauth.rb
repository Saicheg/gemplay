secrets = Rails.application.secrets

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, secrets.github_client_id, secrets.github_secret_id, scope: 'user:email'
end
