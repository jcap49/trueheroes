if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "483104801760721", "7e581795f88fbb34c10782be4dfbf499"
    provider :twitter, "J1nYi1ddOI8YVYyartye8A", "kQtGqAJVilPzPIgA4nXbolylbAJj0SP04xhEJSbk8"
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"]
    provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  end
end
