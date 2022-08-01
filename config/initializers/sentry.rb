Sentry.init do |config|
  # Sentry is only enabled when the dsn is set.
  unless Rails.env.development? || Rails.env.test?
    config.dsn = 'https://bb3d991f409a49b6a06317faf01330de@sentry.shefcompsci.org.uk/84'
  end

  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.before_send = -> (event, hint) { ActiveSupport::ParameterFilter.new(Rails.application.config.filter_parameters).filter(event.to_hash) }
  config.excluded_exceptions += ["CanCan::AccessDenied", "SystemExit", 'ActionDispatch::Http::MimeNegotiation::InvalidType']
end
