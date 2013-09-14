OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, 'GOOGLE_OAUTH2_CLIENT_ID', 'GOOGLE_OAUTH2_CLIENT_SECRET'
end
