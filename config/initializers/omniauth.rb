Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter,
        Rails.application.secrets.twitter_api_key,
        Rails.application.secrets.twitter_api_secret
end
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook,
        Rails.application.secrets.facebook_api_key,
        Rails.application.secrets.facebook_api_secret
        #ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
