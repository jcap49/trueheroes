if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook
    provider :twitter
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"]
    provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  end
end
