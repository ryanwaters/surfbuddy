OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1028818941680.apps.googleusercontent.com', '79LTGhzTkQ1B_6vzkCf5JZE'
end
