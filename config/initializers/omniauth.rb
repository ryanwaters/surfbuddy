Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["1028818941680.apps.googleusercontent.com"], ENV["a79LTGhzTkQ1B_6vzkCf5JZE"]
end
