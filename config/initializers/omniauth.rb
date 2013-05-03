Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  provider :facebook, "481087998631394", "a50aa05ee28d5a7c3285eb8fea5d6467"
end
