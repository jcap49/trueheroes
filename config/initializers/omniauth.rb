if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV["FACEBOOK_DEV"], ENV["FACEBOOK_DEV_SECRET"]
    provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"]
    provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  end
end
