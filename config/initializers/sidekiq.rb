Sidekiq.configure_server do |config|
  config.redis = { namespace: 'props' }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'props' }
end

if Rails.env.test?
  Sidekiq.logger = nil
end
