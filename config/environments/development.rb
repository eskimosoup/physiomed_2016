Rails.application.configure do
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.action_view.raise_on_missing_translations = true

  # Mailer
  config.action_mailer.delivery_method = :letter_opener

  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  Rails.application.routes.default_url_options[:protocol] = 'https'

  config.action_mailer.default_url_options = {
    host: Rails.application.routes.default_url_options[:host],
    protocol: Rails.application.routes.default_url_options[:protocol]
  }

  config.action_mailer.asset_host = [
    Rails.application.routes.default_url_options[:protocol],
    '://',
    Rails.application.routes.default_url_options[:host]
  ].join

  # config.action_controller.asset_host = [
  #  Rails.application.routes.default_url_options[:protocol],
  #  '://',
  #  Rails.application.routes.default_url_options[:host]
  # ].join

  # Do not let rack-mini-profiler disable caching
  Rack::MiniProfiler.config.disable_caching = true # true is default
  Rack::MiniProfiler.config.position = 'right'
  Rack::MiniProfiler.config.start_hidden = false # use ALT + P to toggle

  config.generators do |g|
    g.stylesheets false
    g.javascripts false
    g.helpers false
  end

  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.add_footer = true
  end

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
  end
end
