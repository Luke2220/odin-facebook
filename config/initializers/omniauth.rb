

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,  ENV["facebook_id"], ENV["app_secret"]
end



